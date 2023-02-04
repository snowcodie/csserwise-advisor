<%@ page import="java.sql.Connection" %>
<%@ page import="com.cs01.serwise.DatabaseConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../CSS/content.css">
    <link rel="stylesheet" href="../../CSS/navigation.css">
    <link rel="stylesheet" href="../../CSS/footer.css">
    <link rel="stylesheet" href="../../CSS/backgrount.css">
    <link rel="stylesheet" href="../CSS/table.css">
    <link rel="stylesheet" href="../CSS/popup.css">
    <title>Document</title>
</head>
<body>

<%@ page import ="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.io.IOException"%>

<%
    class gatep{
        Integer GP_Id;
        String V_No;
        Date date;
        Time time;
    }
    List<gatep> data = new ArrayList<gatep>();

    try{
        Connection con = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = con.prepareStatement("select * from serwise.gatepass");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            gatep gp = new gatep();
            gp.GP_Id=rs.getInt("GP_Id");
            gp.V_No=rs.getString("V_No");
            gp.date=rs.getDate("date");
            gp.time=rs.getTime("time");
            data.add(gp);
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
<div  id="blur" class="back_g">
    <header class="navigation">
        <img src="../../Assets/SerWise.png" class="navimg">
        <table>
            <tr>
                <td><a href="../Home.jsp" >Home</a></td>
                <td><a href="../Appointments/Appointments.jsp" >Appointments</a></td>
                <td><a href="../Gatepasses/Gatepass.jsp" style="color:#EE534F">Gatepass</a></td>
                <td><a href="../../Login/login.html"><button class="button">Logout</button></a></td>
            </tr>
        </table>
    </header>

    <div>

        <div class="single-content-div center title">
            <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; View Appointment</span>
        </div>

        <div class="single-content-div center title">
            Search By Appointment ID : &MediumSpace;
            <form>
                <input type="text" placeholder="Employee ID">
                &MediumSpace;
                <input type="submit" value="Search" class="button">
            </form>
        </div>

        <div class="single-content-div center form-display-table">
            <table id="tablej">
                <tr>
                    <th>Gatepass ID</th>
                    <th>Vehicle No</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th style="border-style: none;"></th>
                </tr>
                <%
                    for(Integer i = 0; i<data.size();i++){
                        out.println("<tr><td>"+data.get(i).GP_Id+"</td><td>"+data.get(i).V_No+"</td><td>"+data.get(i).date+"</td><td>"+data.get(i).time+"</td><td style=\"border-style: none;\"> <button class=\"button\" onclick=\"checkoutconfirm('"+data.get(i).V_No+"')\">Check Out</button></td></tr>");
                    }
                %>
            </table>
        </div>
    </div>
</div>


<%--popup delete confirmation--%>
<div id="popupwin">
    <div class="popup" id="popupid" >
        <div class="popup-content">
            <div>
                <button class="close" onclick="popup_close()" style="background: none; border: none; float: right;">X</button>
            </div>
            <div>
                <form method="post" action="../../ServletCheckOut">
                    <p id="pop-p1">Do You Want To Check Out Vehicle No <input type="text" value='' id="v_no" name="v_no" readonly style="border: none;text-align: center"></p>
                    <button class="button" type="button" style="background-color: #dddddd" onclick="popup_close()">Cancel</button>
                    </a><button class="button" type="submit">CheckOut</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    function checkoutconfirm(id) {
        var bk_g = document.getElementById('blur');
        var popwin = document.getElementById('popupid');
        var pop_text = document.getElementById('v_no');
        var ft = document.getElementById('footer');
        bk_g.classList.add('active');
        ft.classList.add('active');
        pop_text.value = id;
        popwin.style.display='block';
        popwin.style.filter='none';

    }
    function popup_close(){
        document.getElementById('popupid').style.display='none';
        var bk_g = document.getElementById('blur');
        bk_g.classList.remove('active');
    }

</script>


<footer class="footer" id="footer">
    <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
    <div class="center"><a href="#"> Contact Us </a> &nbsp|
        &nbsp<a href="#"> About Us </a> &nbsp|
        &nbsp <a href="#"> Legal Stuff </a></div>
    <div class="center">All Rights Recieved</div>
</footer>

</body>
</html>