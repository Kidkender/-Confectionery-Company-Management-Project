/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;
/**
 *
 * @author HuuDuc
 */
public class sqlserverprovider {
    private Connection connect;
    
    public void open()
    {
        String strServerName="DESKTOP-H2VHHSI";
        String strDatabaseName="QL_CTSXBanhkeo_Duc";
        String strUserName="duchuu";
        String strPassword="123";
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionURL="jdbc:sqlserver://"+strServerName+":1433;databaseName="+strDatabaseName
                    +";user="+strUserName+";password="+strPassword;
            connect=DriverManager.getConnection(connectionURL);
            if(connect==null){
            
                System.out.println("loi");
            }
            else
                System.out.println("Thanh cong");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(sqlserverprovider.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void close()
    {
        try {
            this.connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(sqlserverprovider.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet executeQuery(String sql)
    {
        ResultSet rs=null;
        Statement sm=null;
        try {
            sm=connect.createStatement();
            rs=sm.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(sqlserverprovider.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public int executeUpdate(String sql)
    {
        int n=-1;
        Statement sm;
        try {
            sm = connect.createStatement();
            n=sm.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(sqlserverprovider.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
     
    
}
