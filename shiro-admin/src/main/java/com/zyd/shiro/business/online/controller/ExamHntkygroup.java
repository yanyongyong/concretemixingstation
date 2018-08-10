package com.zyd.shiro.business.online.controller;

import java.util.Date;

public class ExamHntkygroup {
    private Integer zuhao;

    private Integer lingqi;

    private Integer gronum;

    private String pingzhong;

    private String speed;

    private Double grokn;

    private Double grompa;

    private String expman;

    private Date expdate;

    private String expcop;

    private Integer specialshape;

    private Integer selectgronum;

    public Integer getZuhao() {
        return zuhao;
    }

    public void setZuhao(Integer zuhao) {
        this.zuhao = zuhao;
    }

    public Integer getLingqi() {
        return lingqi;
    }

    public void setLingqi(Integer lingqi) {
        this.lingqi = lingqi;
    }

    public Integer getGronum() {
        return gronum;
    }

    public void setGronum(Integer gronum) {
        this.gronum = gronum;
    }

    public String getPingzhong() {
        return pingzhong;
    }

    public void setPingzhong(String pingzhong) {
        this.pingzhong = pingzhong == null ? null : pingzhong.trim();
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed == null ? null : speed.trim();
    }

    public Double getGrokn() {
        return grokn;
    }

    public void setGrokn(Double grokn) {
        this.grokn = grokn;
    }

    public Double getGrompa() {
        return grompa;
    }

    public void setGrompa(Double grompa) {
        this.grompa = grompa;
    }

    public String getExpman() {
        return expman;
    }

    public void setExpman(String expman) {
        this.expman = expman == null ? null : expman.trim();
    }

    public Date getExpdate() {
        return expdate;
    }

    public void setExpdate(Date expdate) {
        this.expdate = expdate;
    }

    public String getExpcop() {
        return expcop;
    }

    public void setExpcop(String expcop) {
        this.expcop = expcop == null ? null : expcop.trim();
    }

    public Integer getSpecialshape() {
        return specialshape;
    }

    public void setSpecialshape(Integer specialshape) {
        this.specialshape = specialshape;
    }

    public Integer getSelectgronum() {
        return selectgronum;
    }

    public void setSelectgronum(Integer selectgronum) {
        this.selectgronum = selectgronum;
    }
}