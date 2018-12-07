package com.yang.model;

import java.util.Date;

public class Ifile {
    private Integer fid;

    private Integer uid;

    private String fname;

    private String danshuang;

    private String zhizhang;

    private String caiyin;

    private String jiaji;

    private String yema;

    private String money;

    private String zhuangtai;

    private String jujue;

    private Date ftime;

    private String ikey;

    private String beizhu;

    private String fenshu;

    private User user;

    public User getUser(){ return user; }

    public void setUser(User user){ this.user = user;}

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname == null ? null : fname.trim();
    }

    public String getDanshuang() {
        return danshuang;
    }

    public void setDanshuang(String danshuang) {
        this.danshuang = danshuang == null ? null : danshuang.trim();
    }

    public String getZhizhang() {
        return zhizhang;
    }

    public void setZhizhang(String zhizhang) {
        this.zhizhang = zhizhang == null ? null : zhizhang.trim();
    }

    public String getCaiyin() {
        return caiyin;
    }

    public void setCaiyin(String caiyin) {
        this.caiyin = caiyin == null ? null : caiyin.trim();
    }

    public String getJiaji() {
        return jiaji;
    }

    public void setJiaji(String jiaji) {
        this.jiaji = jiaji == null ? null : jiaji.trim();
    }

    public String getYema() {
        return yema;
    }

    public void setYema(String yema) {
        this.yema = yema == null ? null : yema.trim();
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money == null ? null : money.trim();
    }

    public String getZhuangtai() {
        return zhuangtai;
    }

    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? null : zhuangtai.trim();
    }

    public String getJujue() {
        return jujue;
    }

    public void setJujue(String jujue) {
        this.jujue = jujue == null ? null : jujue.trim();
    }

    public Date getFtime() {
        return ftime;
    }

    public void setFtime(Date ftime) {
        this.ftime = ftime;
    }

    public String getIkey() {
        return ikey;
    }

    public void setIkey(String ikey) {
        this.ikey = ikey == null ? null : ikey.trim();
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu == null ? null : beizhu.trim();
    }


    public String getFenshu() { return fenshu; }

    public void setFenshu(String fenshu) { this.fenshu = fenshu == null ? null : fenshu.trim(); }
}