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
public class nguyenlieu {

    public nguyenlieu(String manl, String tennl, float nhietdo, String dangvl) {
        this.manl = manl;
        this.tennl = tennl;
        this.nhietdo = nhietdo;
        this.dangvl = dangvl;
    }

    public nguyenlieu() {
    }

    public String getManl() {
        return manl;
    }

    public void setManl(String manl) {
        this.manl = manl;
    }

    public String getTennl() {
        return tennl;
    }

    public void setTennl(String tennl) {
        this.tennl = tennl;
    }

    public float getNhietdo() {
        return nhietdo;
    }

    public void setNhietdo(float nhietdo) {
        this.nhietdo = nhietdo;
    }

    public String getDangvl() {
        return dangvl;
    }

    public void setDangvl(String dangvl) {
        this.dangvl = dangvl;
    }
    String manl;
    String tennl;
    float nhietdo;
    String dangvl;
}
