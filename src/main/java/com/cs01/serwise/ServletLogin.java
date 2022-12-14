package com.cs01.serwise;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ServletLogin", value = "/ServletLogin")
public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String user_mail = request.getParameter("Email");
        String pass = request.getParameter("pass");

        if(login.validate(user_mail,pass)){
            HttpSession session = request.getSession();
            session.setAttribute("Email",user_mail);
            response.sendRedirect("ServiceAdvisor/Home.jsp");
        }
        else{
            out.print("Sorry username or password error");
            response.sendRedirect(""); //err pa
        }

        out.close();
    }
}
