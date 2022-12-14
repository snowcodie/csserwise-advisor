package com.cs01.serwise;
import java.sql.*;

public class login {
    public static boolean validate(String name, String pass) {
        boolean status = false;
        try{

            Connection con=DatabaseConnection.initializeDatabase();

            PreparedStatement ps=con.prepareStatement("select Email from employee where Email=? and Password=?");

            ps.setString(1,name);
            ps.setString(2,pass);


            ResultSet rs=ps.executeQuery();
            status=rs.next();


        }catch(Exception e){System.out.println(e);}
        return status;
    }
}