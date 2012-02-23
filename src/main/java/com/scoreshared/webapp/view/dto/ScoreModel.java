package com.scoreshared.webapp.view.dto;

import java.util.HashMap;
import java.util.Map;

public class ScoreModel {

    private String date;
    private String time;
    private String playersLeft;
    private String playersRight;
    private Integer set1Left;
    private Integer set1Right;
    private Integer set2Left;
    private Integer set2Right;
    private Integer set3Left;
    private Integer set3Right;
    private Integer set4Left;
    private Integer set4Right;
    private Integer set5Left;
    private Integer set5Right;
    private String comment;
    private boolean pvt;
    private boolean postInTwitter;
    private boolean postInFacebook;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPlayersLeft() {
        return playersLeft;
    }

    public void setPlayersLeft(String playersLeft) {
        this.playersLeft = playersLeft;
    }

    public String getPlayersRight() {
        return playersRight;
    }

    public void setPlayersRight(String playersRight) {
        this.playersRight = playersRight;
    }

    public Integer getSet1Left() {
        return set1Left;
    }

    public void setSet1Left(Integer set1Left) {
        this.set1Left = set1Left;
    }

    public Integer getSet1Right() {
        return set1Right;
    }

    public void setSet1Right(Integer set1Right) {
        this.set1Right = set1Right;
    }

    public Integer getSet2Left() {
        return set2Left;
    }

    public void setSet2Left(Integer set2Left) {
        this.set2Left = set2Left;
    }

    public Integer getSet2Right() {
        return set2Right;
    }

    public void setSet2Right(Integer set2Right) {
        this.set2Right = set2Right;
    }

    public Integer getSet3Left() {
        return set3Left;
    }

    public void setSet3Left(Integer set3Left) {
        this.set3Left = set3Left;
    }

    public Integer getSet3Right() {
        return set3Right;
    }

    public void setSet3Right(Integer set3Right) {
        this.set3Right = set3Right;
    }

    public Integer getSet4Left() {
        return set4Left;
    }

    public void setSet4Left(Integer set4Left) {
        this.set4Left = set4Left;
    }

    public Integer getSet4Right() {
        return set4Right;
    }

    public void setSet4Right(Integer set4Right) {
        this.set4Right = set4Right;
    }

    public Integer getSet5Left() {
        return set5Left;
    }

    public void setSet5Left(Integer set5Left) {
        this.set5Left = set5Left;
    }

    public Integer getSet5Right() {
        return set5Right;
    }

    public void setSet5Right(Integer set5Right) {
        this.set5Right = set5Right;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean getPrivate() {
        return pvt;
    }

    public void setPrivate(boolean pvt) {
        this.pvt = pvt;
    }

    public boolean getPostInTwitter() {
        return postInTwitter;
    }

    public void setPostInTwitter(boolean postInTwitter) {
        this.postInTwitter = postInTwitter;
    }

    public boolean getPostInFacebook() {
        return postInFacebook;
    }

    public void setPostInFacebook(boolean postInFacebook) {
        this.postInFacebook = postInFacebook;
    }

    public Map<String, String> getSets() {
        Map<String, String> result = new HashMap<String, String>();
        result.put("set1Left", set1Left != null ? String.valueOf(set1Left) : null);
        result.put("set1Right", set1Right != null ? String.valueOf(set1Right) : null);
        result.put("set2Left", set2Left != null ? String.valueOf(set2Left) : null);
        result.put("set2Right", set2Right != null ? String.valueOf(set2Right) : null);
        result.put("set3Left", set3Left != null ? String.valueOf(set3Left) : null);
        result.put("set3Right", set3Right != null ? String.valueOf(set3Right) : null);
        result.put("set4Left", set4Left != null ? String.valueOf(set4Left) : null);
        result.put("set4Right", set4Right != null ? String.valueOf(set4Right) : null);
        result.put("set5Left", set5Left != null ? String.valueOf(set5Left) : null);
        result.put("set5Right", set5Right != null ? String.valueOf(set5Right) : null);
        return result;
    }
}