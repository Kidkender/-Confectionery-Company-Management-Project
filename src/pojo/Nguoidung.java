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
public class Nguoidung {

    public Nguoidung() {
    }

    public Nguoidung(String username, String tendangnhap, String matkhau, String email, int id_user, String diachi, String gioitinh, int ngaysinh) {
        this.username = username;
        this.tendangnhap = tendangnhap;
        this.matkhau = matkhau;
        this.email = email;
        this.id_user = id_user;
        this.diachi = diachi;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTendangnhap() {
        return tendangnhap;
    }

    public void setTendangnhap(String tendangnhap) {
        this.tendangnhap = tendangnhap;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public int  getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(int ngaysinh) {
        this.ngaysinh = ngaysinh;
    }
    private String username;
    private String tendangnhap;
    private String matkhau;
    private String email;
    private int id_user;
    private String diachi;
    private String gioitinh;
    private int ngaysinh;
}
