package com.cs01.serwise;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ServletCheckOut", value = "/ServletCheckOut")
public class ServletCheckOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();

        String v_id= request.getParameter("v_no");

        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        try {
            con=DatabaseConnection.initializeDatabase();

            PreparedStatement psd=con.prepareStatement("DELETE FROM serwise.gatepass WHERE V_No=?");

            psd.setString(1,v_id);

            int i=psd.executeUpdate();
            if(i>0){
                response.sendRedirect("/SerWise_war_exploded/Security/Gatepasses/Gatepass.jsp");
            }





        } catch (SQLException e) {
            //response.sendRedirect("/SerWise_war/Login/login.html");
            throw new RuntimeException(e);
            //out.println(uname);
            //out.println(dbUser);
            //out.println(password);
            //out.println(dbPass);
        } catch (ClassNotFoundException e) {

            throw new RuntimeException(e);
        }
        finally {
            close(con,stmt,rs);
        }

    }

    private void close(Connection con, Statement stmt, ResultSet rs) {
        try {
            if(rs !=null){
                rs.close();
            }
            if(stmt != null){
                stmt.close();
            }
            if(con != null){
                con.close();
            }
        }
        catch (Exception exc){
            exc.printStackTrace();
        }
    }

}
