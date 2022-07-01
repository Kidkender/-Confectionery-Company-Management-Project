/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import gui.jframeqlthanhpham;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.chitietsp;

/**
 *
 * @author HuuDuc
 */
public class chitietspdao {
      public static ArrayList<chitietsp> layLiSTctsp()
    {
          ArrayList<chitietsp> listctsp = new ArrayList<chitietsp>();
          
          
        try {
            String sql="Select * from chitietsanpham";
            sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                chitietsp sh=new chitietsp();
                sh.setMaloaisp(rs.getString("Maloaisp"));
                sh.setManl(rs.getString("manl"));
                sh.setNgaysx(rs.getString("ngaysx"));
                sh.setTensp(rs.getString("tensp"));
                
                listctsp.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            Logger.getLogger(chitietspdao.class.getName()).log(Level.SEVERE, null, ex);
        }
          return listctsp;
    } 
      
     public static ArrayList<chitietsp> timkiemsachtheoma(String manl)
        {
        ArrayList<chitietsp> listsach =new ArrayList<chitietsp>();    
        try {
             String sql="Select * from chitietsanpham where manl = '"+manl+"'";
           sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                chitietsp sh=new chitietsp();
                sh.setMaloaisp(rs.getString("Maloaisp"));
                sh.setManl(rs.getString("manl"));
                sh.setNgaysx(rs.getString("ngaysx"));
                sh.setTensp(rs.getString("tensp"));
              
                listsach.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            Logger.getLogger(chitietspdao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listsach;
    }      
     
     
     
        public static boolean themsp(chitietsp sh)
    {
    
     
        
        boolean kq=false;
        String sql=String.format("set dateformat dmy insert into chitietsanpham(Maloaisp,tensp,manl,ngaysx) values('%s','%s','%s','04/04/2021')", sh.getMaloaisp(),sh.getTensp(),sh.getManl());
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
       
        public static boolean xoasanpham(chitietsp sh)
    {
        boolean kq=false;
        String sql=String.format("Delete from chitietsanpham where manl='%s' and maloaisp='%s'",sh.getManl(),sh.getMaloaisp());
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
        
          public static boolean capnhatsanpham(chitietsp sh)
    {
        boolean kq=false;
        String sql=String.format("update chitietsanpham set TENsp='%s'"+"where manl='%s' and maloaisp='%s'", 
                sh.getTensp(),sh.getManl(),sh.getMaloaisp()) ;
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
}
