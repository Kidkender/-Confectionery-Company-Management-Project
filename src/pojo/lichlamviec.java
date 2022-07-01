/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.Date;

/**
 *
 * @author HuuDuc
 */
public class lichlamviec {

    public lichlamviec(String manv, String calam, Date ngaylam) {
        this.manv = manv;
        this.calam = calam;
        this.ngaylam = ngaylam;
    }

    public lichlamviec() {
    }

    public String getManv() {
        return manv;
    }

    public void setManv(String manv) {
        this.manv = manv;
    }

    public String getCalam() {
        return calam;
    }

    public void setCalam(String calam) {
        this.calam = calam;
    }

    public Date getNgaylam() {
        return ngaylam;
    }

    public void setNgaylam(Date ngaylam) {
        this.ngaylam = ngaylam;
    }
    String manv;
    String calam;
    Date ngaylam;
}
