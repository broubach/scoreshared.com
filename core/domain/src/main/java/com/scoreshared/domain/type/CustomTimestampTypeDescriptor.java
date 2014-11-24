package com.scoreshared.domain.type;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    private static SimpleDateFormat CONVERSION_DF;
    private static Map<String, Calendar> calendarByTimeZone;
    {
        calendarByTimeZone = new HashMap<String, Calendar>();
        synchronized (calendarByTimeZone) {
            UTC = TimeZone.getTimeZone("UTC");
            AMERICA_SAO_PAULO = TimeZone.getTimeZone("America/Sao_Paulo");
            CONVERSION_DF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            UTC_DF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            UTC_DF.setTimeZone(UTC);
            calendarByTimeZone.put(AMERICA_SAO_PAULO.getID(), Calendar.getInstance(AMERICA_SAO_PAULO));
            calendarByTimeZone.put(UTC.getID(), Calendar.getInstance(UTC));
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
        return new BasicBinder<X>( javaTypeDescriptor, this ) {
            @Override
            protected void doBind(PreparedStatement st, X value, int index, WrapperOptions options) throws SQLException {
                Timestamp s = javaTypeDescriptor.unwrap( value, Timestamp.class, options );
                if (s != null) {
                    // there's something like 1970-01-01 19:00:00 that should be converted to
                    // 1970-01-01 22:00:00 before persisting
                    Timestamp result = convert(s.getTime(), UTC);

                    st.setTimestamp( index, result );
                } else {

                    st.setTimestamp( index, null );
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
                        Date parsedToConvert = UTC_DF.parse(source.toString());

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
        Calendar calendar = calendarByTimeZone.get(timezone.getID());
        synchronized (calendar) {
            calendar.setTimeInMillis(timeMillis);

            CONVERSION_DF.setCalendar(calendar);

            return Timestamp.valueOf(CONVERSION_DF.format(calendar.getTime()));
        }
    }
}