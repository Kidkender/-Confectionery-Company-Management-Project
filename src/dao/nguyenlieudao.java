/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.nguyenlieu;

/**
 *
 * @author HuuDuc
 */
public class nguyenlieudao 
{
      public static ArrayList<nguyenlieu> layLiSTnguyenlieu()
    {
          ArrayList<nguyenlieu> listnl = new ArrayList<nguyenlieu>();
          
          
        try {
            String sql="Select * from nguyenlieu";
            sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                nguyenlieu sh=new nguyenlieu();
                sh.setDangvl(rs.getString("dangnguyenlieu"));
                sh.setManl(rs.getString("manl"));
                sh.setTennl(rs.getString("Tennguyenlieu"));
                sh.setNhietdo(rs.getInt("nhietdobaoquan"));
              
                listnl.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            Logger.getLogger(nguyenlieudao.class.getName()).log(Level.SEVERE, null, ex);
        }
          return listnl;
    } 
      
       public static boolean themsach(nguyenlieu sh)
    {
        
        boolean kq=false;
        String sql=String.format("insert into nguyenlieu values('%s','%s','%f','%s');", sh.getManl(),sh.getTennl(),sh.getNhietdo(),sh.getDangvl());
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
       
        public static boolean xoasach(nguyenlieu sh)
    {
        boolean kq=false;
        String sql=String.format("Delete from nguyenlieu where manl='%s'",sh.getManl());
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
        
          public static boolean capnhatsach(nguyenlieu sh)
    {
        boolean kq=false;
        String sql=String.format("update nguyenlieu set TENNGUYENLIEU='%s',NhietdoBaoQuan='%f',Dangnguyenlieu='%s'"+"where manl='%s'", 
                sh.getTennl(),sh.getNhietdo(),sh.getDangvl(),sh.getManl());
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
          
        public static ArrayList<nguyenlieu> timkiemsachtheoten(String tennl)
        {
        ArrayList<nguyenlieu> listsach =new ArrayList<nguyenlieu>();    
        try {
             String sql="Select * from nguyenlieu where tennguyenlieu like '%"+tennl+"%'";
           sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                nguyenlieu sh=new nguyenlieu();
                sh.setDangvl(rs.getString("dangnguyenlieu"));
                sh.setManl(rs.getString("manl"));
                sh.setTennl(rs.getString("Tennguyenlieu"));
                sh.setNhietdo(rs.getInt("nhietdobaoquan"));
              
                listsach.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            Logger.getLogger(nguyenlieudao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listsach;
    }
        
     public static ArrayList<nguyenlieu> timkiemsachtheoma(String manl)
        {
        ArrayList<nguyenlieu> listsach =new ArrayList<nguyenlieu>();    
        try {
             String sql="Select * from nguyenlieu where manl = '"+manl+"'";
           sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                nguyenlieu sh=new nguyenlieu();
                sh.setDangvl(rs.getString("dangnguyenlieu"));
                sh.setManl(rs.getString("manl"));
                sh.setTennl(rs.getString("Tennguyenlieu"));
                sh.setNhietdo(rs.getInt("nhietdobaoquan"));
              
                listsach.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            Logger.getLogger(nguyenlieudao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listsach;
    }    
}
