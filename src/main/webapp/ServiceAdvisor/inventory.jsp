<%@ page import="java.sql.Connection" %>
<%@ page import="com.cs01.serwise.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/content.css">
    <link rel="stylesheet" href="../CSS/navigation.css">
    <link rel="stylesheet" href="../CSS/footer.css">
    <link rel="stylesheet" href="../CSS/backgrount.css">
    <link rel="stylesheet" href="table.css">
    <link rel="stylesheet" href="dlt_app_popup.css">
    <title>Document</title>
</head>
<body>

<%@ page import ="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.io.IOException"%>

<%
    class inventory{
        Integer ID;
        String name;
        Integer quantity;
        Integer H_time;
        Float Price;
    }
    List<inventory> data = new ArrayList<inventory>();

    try{
        Connection con = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = con.prepareStatement("select * from serwise.inventory_item");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            inventory in = new inventory();
            in.ID=rs.getInt("Inventory_Item_Id");
            in.name=rs.getString("Name");
            in.quantity=rs.getInt("Quantity");
            in.H_time=rs.getInt("Handling_Time");
            in.Price= rs.getFloat("price");
            data.add(in);
        }
    }
    catch(SQLException sq){
        response.sendRedirect("Errsql.html");
    }
    catch(ClassNotFoundException cq){
        response.sendRedirect("Err.html");
    }
//  out.println("<table>");
//  out.println("</table>");
%>
<div id="blur" class="back_g">
    <header class="navigation">
        <img src="../Assets/SerWise.png" class="navimg">
        <table>
            <tr>
                <td><a href="Home.jsp">Home</a></td>
                <td><a href="inventory.jsp" style="color:#EE534F">Inventory</a></td>
                <td><a href="job.jsp">Jobs</a></td>
                <td><a href="#">Slots</a></td>
                <td><a href="../Login/login.html"><button class="button">Logout</button></a></td>
            </tr>
        </table>
    </header>

    <div>

        <div class="single-content-div center title">
            <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; View Inventory</span>
        </div>

        <div class="single-content-div center title">
            Search By Item name : &MediumSpace;
            <form>
                <input type="text" placeholder="Employee ID">
                &MediumSpace;
                <input type="submit" value="Search" class="button">
            </form>
        </div>

        <div class="single-content-div center form-display-table">
            <table id="tablej">
                <tr>
                    <th>Item ID</th>
                    <th>Name</th>
                    <th>Handling Time</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th style="border-style: none;"></th>
                </tr>
                <%
                    for(Integer i = 0; i<data.size();i++){
                        out.println("<tr><td>"+data.get(i).ID+"</td><td>"+data.get(i).name+"</td><td>"+data.get(i).H_time+"</td><td>"+data.get(i).quantity+"</td><td>"+data.get(i).Price+"</td>");
                    }
                %>
            </table>
        </div>
    </div>
</div>


<footer class="footer">
    <div class="center"><img src="../Assets/SerWise.png" class="logo"></div>
    <div class="center"><a href="#"> Contact Us </a> &nbsp|
        &nbsp<a href="#"> About Us </a> &nbsp|
        &nbsp <a href="#"> Legal Stuff </a></div>
    <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>