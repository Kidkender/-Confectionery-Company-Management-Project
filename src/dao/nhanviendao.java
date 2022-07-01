/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import pojo.nhanvien;
import java.sql.ResultSet;
import java.sql.SQLException;
import pojo.Nguoidung;
import pojo.nguyenlieu;
/**
 *
 * @author HuuDuc
 */
public class nhanviendao 
{
     public static ArrayList<nhanvien> layLiSTnhanvien()
    {
          ArrayList<nhanvien> listnv = new ArrayList<nhanvien>();
          
          
        try {
            String sql="Select * from nhanvien";
            sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                nhanvien sh=new nhanvien();
                sh.setManv(rs.getString("manv"));
                sh.setTennv(rs.getString("tennv"));
                sh.setMaph(rs.getString("maph"));
                sh.setSdt(rs.getString("Dientnv"));
                sh.setLuong(rs.getFloat("Luongnv"));
                listnv.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(nhanviendao.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
          return listnv;
    } 
     
       public static boolean themnv(nhanvien sh)
    {
        
        boolean kq=false;
        String sql=String.format("insert into nhanvien(manv,tennv,maph,dientnv,luongnv) values('%s','%s','%s','%s','%f');", sh.getManv(),sh.getTennv(),sh.getMaph(),sh.getSdt(),sh.getLuong());
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
       
          public static boolean xoanv(nhanvien sh)
    {
        
        boolean kq=false;
        String sql=String.format("delete from nhanvien where manv='%s'", sh.getManv());
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
          
             public static boolean capnhatnv(nhanvien sh)
    {
        
        boolean kq=false;
        String sql=String.format("update nhanvien set tennv='%s' ,maph='%s' ,dientnv='%s' ,luongnv='%f' where  manv='%s' ", sh.getTennv(),sh.getMaph(),sh.getSdt(),sh.getLuong(),sh.getManv());
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
             
     public static ArrayList<nhanvien> timkiemnvtheoten(String maph)
        {
        ArrayList<nhanvien> listnv =new ArrayList<nhanvien>();    
        try {
            String sql=String.format("Select * from nhanvien where maph= '%s'",maph);
         
           sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                nhanvien sh=new nhanvien();
                sh.setManv(rs.getString("manv"));
                sh.setTennv(rs.getString("tennv"));
                sh.setMaph(rs.getString("maph"));
                sh.setSdt(rs.getString("Dientnv"));
                sh.setLuong(rs.getFloat("Luongnv"));
              
                
                listnv.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(nhanviendao.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return listnv;
    }
}
