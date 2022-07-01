/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author HuuDuc
 */
public class CheckStatusLogin 
{
    
    public static boolean check()
    {ResultSet rs = null;
    int count=0;
        boolean kq=false;
          String sql="Select count(*) from lichsudangnhap ";
        sqlserverprovider provider=new sqlserverprovider();
        provider.open();
        rs= provider.executeQuery(sql);
        try {
            while(rs.next())
            {
                count=rs.getInt(1);
                if(count>0)
                {
                    kq=true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckStatusLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        provider.close();
        return kq;
    }
}
