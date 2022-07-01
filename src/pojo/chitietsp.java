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
public class chitietsp {

    public chitietsp(String manl, String maloaisp, String tensp, String ngaysx) {
        this.manl = manl;
        this.maloaisp = maloaisp;
        this.tensp = tensp;
        this.ngaysx = ngaysx;
    }

    public chitietsp() {
    }

    public String getManl() {
        return manl;
    }

    public void setManl(String manl) {
        this.manl = manl;
    }

    public String getMaloaisp() {
        return maloaisp;
    }

    public void setMaloaisp(String maloaisp) {
        this.maloaisp = maloaisp;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getNgaysx() {
        return ngaysx;
    }

    public void setNgaysx(String ngaysx) {
        this.ngaysx = ngaysx;
    }
    String manl;
    String maloaisp;
    String tensp;
    String ngaysx;
}
