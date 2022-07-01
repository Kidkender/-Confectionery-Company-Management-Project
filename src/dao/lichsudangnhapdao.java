/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.lichsudangnhap;

/**
 *
 * @author HuuDuc
 */
public class lichsudangnhapdao 
{
     public static boolean addaccount(lichsudangnhap ac)
    {
        boolean kq=false;
        
        String sql1=String.format("insert into lichsudangnhap Select tendangnhap,matkhau,hoten,email,diachi,namsinh,gioitinh from NguoiDung where tendangnhap ='%s'",ac.getLichsutendangnhap()) ;
        sqlserverprovider provider=new sqlserverprovider();
        provider.open();
        int n= provider.executeUpdate(sql1);
        if(n==1)
        {
            kq=true;
        }
        provider.close();
        return kq;
    }
 public static boolean xoataikhoan(lichsudangnhap nd)
 {
        boolean kq=false;
        String sql=String.format("delete from lichsudangnhap where tendangnhap='s'",nd.getLichsutendangnhap());
        sqlserverprovider provider=new sqlserverprovider();
        provider.open();
        int n= provider.executeUpdate(sql);
        if(n==1)
        {
            kq=true;
        }
        provider.close();
        return kq;
     
 }
  public static void xoataikhoanfull()
 {
        boolean kq=false;
        String sql="delete from lichsudangnhap ";
        sqlserverprovider provider=new sqlserverprovider();
        provider.open();
        int n= provider.executeUpdate(sql);
        if(n==1)
        {
            kq=true;
        }
        provider.close();
 }
}
