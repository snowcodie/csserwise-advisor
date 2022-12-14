package com.cs01.serwise;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ServletRegister", value = "/ServletRegister")
public class ServletRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int E_ID = Integer.parseInt(request.getParameter("E_ID"));
        String fname = request.getParameter("Fname");
        String lname = request.getParameter("Lname");
        String contact = request.getParameter("Contact");
        String A_Home = request.getParameter("Address_Home");
        String A_City = request.getParameter("Address_City");
        int Branch_ID = Integer.parseInt(request.getParameter("Branch_ID"));
        Date J_date      = Date.valueOf(request.getParameter("Joined_Date"));
        int role = Integer.parseInt(request.getParameter("Role"));
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");

        Connection con= null;

        try {
            con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps2=con.prepareStatement("insert into serwise.employee(Employee_Id,F_Name,L_Name,Contact,A_Home,A_City,Branch_id,Joined_Date,Role,Email,password) values (?,?,?,?,?,?,?,?,?,?,?)");
            PreparedStatement ps1=con.prepareStatement("insert into serwise.registered_client(First_Name,Last_Name,Contact,Address) values (?,?,?,?)");


            ps2.setInt(1,E_ID);
            ps2.setString(2,fname);
            ps2.setString(3,lname);
            ps2.setString(4, contact);
            ps2.setString(5,A_Home);
            ps2.setString(6,A_City);
            ps2.setInt(7,Branch_ID);
            ps2.setDate(8,J_date);
            ps2.setInt(9,role);
            ps2.setString(10,email);
            ps2.setString(11,password);


            int i=ps2.executeUpdate();
            if(i>0){


                    response.sendRedirect("Login/login.html");
            }


        } catch (SQLException e) {
            //String message = "User already exixsts";
            //HttpSession session = request.getSession();
            //session.setAttribute("massage",message);
            //request.setAttribute("message", message); // This will be available as ${message}
            //request.getRequestDispatcher("/UnregisteredClient/Register/register.jsp").forward(request, response);
            //throw new RuntimeException(e);
            response.sendRedirect("/Test_war/UnregisteredClient/Register/userAlreadyExists.html");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        out.close();

    }
}