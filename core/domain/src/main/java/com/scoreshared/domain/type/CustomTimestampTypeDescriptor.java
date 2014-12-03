package com.scoreshared.domain.type;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import org.hibernate.type.descriptor.ValueBinder;
import org.hibernate.type.descriptor.ValueExtractor;
import org.hibernate.type.descriptor.WrapperOptions;
import org.hibernate.type.descriptor.java.JavaTypeDescriptor;
import org.hibernate.type.descriptor.sql.BasicBinder;
import org.hibernate.type.descriptor.sql.BasicExtractor;
import org.hibernate.type.descriptor.sql.SqlTypeDescriptor;

public class CustomTimestampTypeDescriptor implements SqlTypeDescriptor {

    public static final CustomTimestampTypeDescriptor INSTANCE = new CustomTimestampTypeDescriptor();

    private static TimeZone UTC;
    private static TimeZone AMERICA_SAO_PAULO;
    private static SimpleDateFormat UTC_DF;
    private static SimpleDateFormat CONVERSION_UTC_DF;
    private static SimpleDateFormat CONVERSION_AMERICA_SAO_PAULO_DF;
    private static Map<String, DateFormat> dateFormatByTimeZone;
    {
        dateFormatByTimeZone = new HashMap<String, DateFormat>();
        synchronized (dateFormatByTimeZone) {
            UTC = TimeZone.getTimeZone("UTC");
            UTC_DF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            UTC_DF.setTimeZone(UTC);

            AMERICA_SAO_PAULO = TimeZone.getTimeZone("America/Sao_Paulo");
            CONVERSION_UTC_DF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            CONVERSION_UTC_DF.setTimeZone(UTC);
            CONVERSION_AMERICA_SAO_PAULO_DF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            CONVERSION_AMERICA_SAO_PAULO_DF.setTimeZone(AMERICA_SAO_PAULO);

            dateFormatByTimeZone.put(AMERICA_SAO_PAULO.getID(), CONVERSION_AMERICA_SAO_PAULO_DF);
            dateFormatByTimeZone.put(UTC.getID(), CONVERSION_UTC_DF);
        }
    }

    public int getSqlType() {
        return Types.TIMESTAMP;
    }

    @Override
    public boolean canBeRemapped() {
        return true;
    }

    public <X> ValueBinder<X> getBinder(final JavaTypeDescriptor<X> javaTypeDescriptor) {
        return new BasicBinder<X>(javaTypeDescriptor, this) {
            @Override
            protected void doBind(PreparedStatement st, X value, int index, WrapperOptions options) throws SQLException {
                Timestamp s = javaTypeDescriptor.unwrap(value, Timestamp.class, options);
                if (s != null) {
                    // there's something like 1970-01-01 19:00:00 that should be
                    // converted to
                    // 1970-01-01 22:00:00 before persisting
                    Timestamp result = convert(s.getTime(), UTC);

                    st.setTimestamp(index, result);
                } else {

                    st.setTimestamp(index, null);
                }
            }
        };
    }

    public <X> ValueExtractor<X> getExtractor(final JavaTypeDescriptor<X> javaTypeDescriptor) {
        return new BasicExtractor<X>(javaTypeDescriptor, this) {
            @Override
            protected X doExtract(ResultSet rs, String name, WrapperOptions options) throws SQLException {
                try {
                    java.sql.Timestamp source = rs.getTimestamp(name);
                    if (source != null) {
                        // gets the date in UTC
                        Date parsedToConvert = null;
                        synchronized (UTC_DF) {
                            parsedToConvert = UTC_DF.parse(source.toString());
                        }

                        // converts it to America/Sao_Paulo
                        Timestamp converted = convert(parsedToConvert.getTime(), AMERICA_SAO_PAULO);
                        return javaTypeDescriptor.wrap(converted, options);
                    }
                    return javaTypeDescriptor.wrap(null, options);
                } catch (ParseException e) {
                    // should never reach this part of the code
                    throw new RuntimeException(e);
                }
            }
        };
    }

    public Timestamp convert(long timeMillis, TimeZone timezone) {
        DateFormat df = dateFormatByTimeZone.get(timezone.getID());
        synchronized (df) {
            df.getCalendar().setTimeInMillis(timeMillis);

            return Timestamp.valueOf(df.format(df.getCalendar().getTime()));
        }
    }
}