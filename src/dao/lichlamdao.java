/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pojo.lichlamviec;
import pojo.nhanvien;

/**
 *
 * @author HuuDuc
 */
public class lichlamdao {
    
      public static ArrayList<lichlamviec> layLiSTlichlam()
    {
          ArrayList<lichlamviec> listnv = new ArrayList<lichlamviec>();
          
          
        try {
            String sql="Select * from lichlamviec";
            sqlserverprovider provin= new sqlserverprovider();
            provin.open();
            ResultSet rs =provin.executeQuery(sql);
            while(rs.next())
            {
                lichlamviec sh=new lichlamviec();
                sh.setManv(rs.getString("manv"));
                sh.setCalam(rs.getString("calam"));
                sh.setNgaylam(rs.getDate("Ngaylam"));
               
                listnv.add(sh);
            }
            provin.close();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(lichlamviec.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
          return listnv;
    } 
}
