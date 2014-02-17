package com.scoreshared.scaffold;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.web.multipart.MultipartFile;

public class CustomMultipartFile implements MultipartFile {
    private ByteArrayOutputStream imageAsArray = new ByteArrayOutputStream();
    private String imageUrl;

    public CustomMultipartFile(String imageUrl) throws MalformedURLException, IOException {
        this.imageUrl = imageUrl;

        BufferedOutputStream bos = new BufferedOutputStream(imageAsArray);
        InputStream is = null;
        try {
            is = new URL(imageUrl).openStream();
            BufferedInputStream bis = new BufferedInputStream(is);

            byte[] byteChunk = new byte[4096];
            int n;
            while ((n = bis.read(byteChunk)) > 0) {
                bos.write(byteChunk, 0, n);
            }

        } finally {
            if (bos != null) {
                bos.flush();
                bos.close();
            }
            if (is != null) {
                is.close();
            }
        }        
    }

    @Override
    public String getName() {
        return imageUrl;
    }

    @Override
    public String getOriginalFilename() {
        return imageUrl;
    }

    @Override
    public String getContentType() {
        return null;
    }

    @Override
    public boolean isEmpty() {
        return imageAsArray.toByteArray().length == 0;
    }

    @Override
    public long getSize() {
        return imageAsArray.size();
    }

    @Override
    public byte[] getBytes() throws IOException {
        return imageAsArray.toByteArray();
    }

    @Override
    public InputStream getInputStream() throws IOException {
        return null;
    }

    @Override
    public void transferTo(File dest) throws IOException, IllegalStateException {
    }
}