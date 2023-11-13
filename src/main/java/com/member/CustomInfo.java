package com.member;

public class CustomInfo {

    private String userEmail;
    private String userName;
    private String userTel;
    private String verNum;
    private String authorized;

    public String getUserEmail() {
        return userEmail;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getAuthorized() {
        return authorized;
    }
    public void setAuthorized(String authorized) {
        this.authorized = authorized;
    }
    public String getUserTel() {
        return userTel;
    }
    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }
    public String getVerNum() {
        return verNum;
    }
    public void setVerNum(String verNum) {
        this.verNum = verNum;
    }

}
