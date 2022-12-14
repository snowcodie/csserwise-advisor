package com.cs01.serwise;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "ServletCreateJob", value = "/ServletCreateJob")
public class ServletCreateJob extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String type = request.getParameter("type");
        Date dt = Date.valueOf(request.getParameter("date"));
        String tt = request.getParameter("time");
        Integer slot = Integer.parseInt(request.getParameter("slot"));



        Connection con= null;

        try {
            con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps2=con.prepareStatement("insert into serwise.job(Description,Date,Time,Slot) values (?,?,?,?)");


            ps2.setString(1,type);
            ps2.setDate(2,dt);
            ps2.setString(3,tt);
            ps2.setInt(4, slot);



            int i=ps2.executeUpdate();
            if(i>0){

                response.sendRedirect("/SerWise_war_exploded/ServiceAdvisor/Home.jsp");
            }


        } catch (SQLException e) {
            //String message = "User already exixsts";
            //HttpSession session = request.getSession();
            //session.setAttribute("massage",message);
            //request.setAttribute("message", message); // This will be available as ${message}
            //request.getRequestDispatcher("/UnregisteredClient/Register/register.jsp").forward(request, response);
            //throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        out.close();

    }
}
