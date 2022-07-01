/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

/**
 *
 * @author HuuDuc
 */
public class nhanvien {

    public nhanvien(String manv, String tennv, String sdt, String maph, float luong) {
        this.manv = manv;
        this.tennv = tennv;
        this.sdt = sdt;
        this.maph = maph;
        this.luong = luong;
    }

    public nhanvien() {
    }

    public String getManv() {
        return manv;
    }

    public void setManv(String manv) {
        this.manv = manv;
    }

    public String getTennv() {
        return tennv;
    }

    public void setTennv(String tennv) {
        this.tennv = tennv;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getMaph() {
        return maph;
    }

    public void setMaph(String maph) {
        this.maph = maph;
    }

    public float getLuong() {
        return luong;
    }

    public void setLuong(float luong) {
        this.luong = luong;
    }
    String manv;
    String tennv;
    String sdt;
    String maph;
    float luong;
}
