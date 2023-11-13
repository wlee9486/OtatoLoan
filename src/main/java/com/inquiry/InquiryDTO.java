package com.inquiry;

public class InquiryDTO {

    private String userEmail;
    private String iPwd;
    private String iSubject;
    private String iContent;
    private int iNum;
    private String iTag;



    public String getUserEmail() {
        return userEmail;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    public String getiPwd() {
        return iPwd;
    }
    public void setiPwd(String iPwd) {
        this.iPwd = iPwd;
    }
    public String getiSubject() {
        return iSubject;
    }
    public void setiSubject(String iSubject) {
        this.iSubject = iSubject;
    }
    public String getiContent() {
        return iContent;
    }
    public void setiContent(String iContent) {
        this.iContent = iContent;
    }
    public int getiNum() {
        return iNum;
    }
    public void setiNum(int iNum) {
        this.iNum = iNum;
    }
    public String getiTag() {
        return iTag;
    }
    public void setiTag(String iTag) {
        this.iTag = iTag;
    }



}
