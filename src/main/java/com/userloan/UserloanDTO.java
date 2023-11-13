package com.userloan;

public class UserloanDTO {

    private String userEmail;
    private int uNum;
    private String pName;
    private String signed;
    private String rate;
    private String duration;
    private String repay;
    private String saveFilename;
    private String originalFilename;
    private String endDate;
    private String amount;
    private int payment;

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getuNum() {
        return uNum;
    }

    public void setuNum(int uNum) {
        this.uNum = uNum;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getSigned() {
        return signed;
    }

    public void setSigned(String signed) {
        this.signed = signed;
    }

    public String getRepay() {
        return repay;
    }

    public void setRepay(String repay) {
        this.repay = repay;
    }

    public String getSaveFilename() {
        return saveFilename;
    }

    public void setSaveFilename(String saveFilename) {
        this.saveFilename = saveFilename;
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public void setOriginalFilename(String originalFilename) {
        this.originalFilename = originalFilename;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }
}
