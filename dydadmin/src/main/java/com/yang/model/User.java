package com.yang.model;

public class User {
    private Integer uid;

    private String uname;

    private String uphone;

    private String uapart;

    private String uzifu;

    private String upwd;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone == null ? null : uphone.trim();
    }

    public String getUapart() {
        return uapart;
    }

    public void setUapart(String uapart) {
        this.uapart = uapart == null ? null : uapart.trim();
    }

    public String getUzifu() {
        return uzifu;
    }

    public void setUzifu(String uzifu) {
        this.uzifu = uzifu == null ? null : uzifu.trim();
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }
}