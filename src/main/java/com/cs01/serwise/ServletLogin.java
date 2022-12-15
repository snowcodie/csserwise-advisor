package com.cs01.serwise;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "ServletLogin", value = "/ServletLogin")
public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String uname=(String) request.getParameter("uname");
        String password=(String) request.getParameter("pw");
        //response.sendRedirect("/BranchManager/Home/home.html");
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        try {
            con=DatabaseConnection.initializeDatabase();

            String sql="select * from serwise.user where id='"+uname+"'";

            stmt= con.createStatement();

            rs= stmt.executeQuery(sql);

            rs.next();
            String dbUser=rs.getString("id");
            String dbPass=rs.getString("password");
            int dbRole=Integer.parseInt(rs.getString("role"));

            if(uname.equals(dbUser) && password.equals(dbPass)){
                if(dbRole==5) {
                    response.sendRedirect("/SerWise_war/BranchManager/Home/home.html");
                }
                if(dbRole==3){
                    response.sendRedirect("ServiceAdvisor/Home.jsp");
                }
            }
            else {
                //out.println(uname);
                out.println(dbUser);
                //out.println(password);
                out.println(dbPass);
                out.println(dbRole);
                response.sendRedirect("/SerWise_war/Login/login.html");
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

