/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.Nguoidung;


/**
 *
 * @author HuuDuc
 */
public class accountdao 
{
    Statement stat=null;
    ResultSet rs=null;
    
    public static boolean addaccount(Nguoidung ac)
    {
        boolean kq=false;
        
        String sql=String.format("Insert into Nguoidung Values ('%d','%s','%s','%s','%s','%s','%s','%s');",
                ac.getId_user(),ac.getTendangnhap(),ac.getMatkhau(),ac.getUsername(),ac.getEmail(),ac.getDiachi(),ac.getNgaysinh(),ac.getGioitinh());
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
 public static boolean xoataikhoan(Nguoidung nd)
 {
        boolean kq=false;
        String sql=String.format("Delete from nguoidung where nd_ID=%d",nd.getId_user());
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
    
  public static boolean updatepassword(Nguoidung nd)
 {
        boolean kq=false;
        String sql=String.format("Update nguoidung set matkhau='%s' where tendangnhap='%s' and hoten='%s' and email='%s'",nd.getMatkhau(),nd.getTendangnhap(),nd.getUsername(),nd.getEmail());
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
      public static boolean updatethongtin(Nguoidung nd)
 {
        boolean kq=false;
        String sql=String.format("Update nguoidung set hoten='%s',email='%s',Diachi='%s',namsinh='%d',gioitinh='%s' where tendangnhap='%s'  ",nd.getUsername(),nd.getEmail(),nd.getDiachi(),nd.getNgaysinh(),nd.getGioitinh(),nd.getTendangnhap());
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
  public static ArrayList<Nguoidung> layLiStuser()
    {
          ArrayList<Nguoidung> list = new ArrayList<Nguoidung>();
          
          
        try {
            String sql="Select * from nguoidung";
            sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                Nguoidung nd=new Nguoidung();
                nd.setId_user(rs.getInt("ND_ID"));
                nd.setTendangnhap(rs.getString("tendangnhap"));
                nd.setMatkhau(rs.getString("matkhau"));
                nd.setUsername(rs.getString("HOTEN"));
                nd.setEmail(rs.getString("email"));
                nd.setDiachi(rs.getString("diachi"));
                nd.setNgaysinh(rs.getInt("Namsinh"));
                nd.setGioitinh(rs.getString("gioitinh"));
                list.add(nd);
            }
            provin.close();
        } catch (SQLException ex) {
            Logger.getLogger(Nguoidung.class.getName()).log(Level.SEVERE, null, ex);
        }
          return list;
    } 
}
