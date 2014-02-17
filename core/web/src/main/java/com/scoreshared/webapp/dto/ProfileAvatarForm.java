package com.scoreshared.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProfileAvatarForm {
    private Double x;
    private Double y;
    private Double x2;
    private Double y2;
    private MultipartFile file;
    private Boolean avatarUploaded;

    public Double getX() {
        return x;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(Double y) {
        this.y = y;
    }

    public Double getX2() {
        return x2;
    }

    public void setX2(Double x2) {
        this.x2 = x2;
    }

    public Double getY2() {
        return y2;
    }

    public void setY2(Double y2) {
        this.y2 = y2;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Boolean getAvatarUploaded() {
        return avatarUploaded;
    }

    public void setAvatarUploaded(Boolean avatarUploaded) {
        this.avatarUploaded = avatarUploaded;
    }
}