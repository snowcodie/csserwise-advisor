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
  class job{
    Integer app_id;
    Date date;
    String time;
    String V_No;
  }
  List<job> data = new ArrayList<job>();

  try{
    Connection con = DatabaseConnection.initializeDatabase();
    PreparedStatement ps = con.prepareStatement("select * from serwise.appoinment INNER JOIN serwise.vehicle ON serwise.appoinment.Vehicle_Id = serwise.vehicle.Vehicle_Id");
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
      job ap = new job();
      ap.app_id=rs.getInt("Appoinment_Id");
      ap.date=rs.getDate("Date");
      ap.time=rs.getString("Time");
      ap.V_No=rs.getString("Vehicle_No");
      data.add(ap);
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
        <td><a href="../Home.jsp">Home</a></td>
        <td><a href="../inventory.jsp">Inventory</a></td>
        <td><a href="job.jsp" style="color:#EE534F">Jobs</a></td>
        <td><a href="../Slot/slot.jsp">Slots</a></td>
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
          <th>Appointment ID</th>
          <th>Date</th>
          <th>Time</th>
          <th>Vehicle No</th>
          <th style="border-style: none;"></th>
        </tr>
        <%
          for(Integer i = 0; i<data.size();i++){
            out.println("<tr><td>"+data.get(i).app_id+"</td><td>"+data.get(i).date+"</td><td>"+data.get(i).time+"</td><td>"+data.get(i).V_No+"</td><td style=\"border-style: none;\"><a href=\"jobadd.jsp?date="+data.get(i).date+"&id="+data.get(i).app_id+"&time="+data.get(i).time+"\"><button class=\"button\">Create Job</button></a> <button class=\"button\" onclick=\"deleteconfirm('"+data.get(i).app_id+"')\">Delete</button></td></tr>");
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
                <form method="post" action="../../ServletDltAppointment">
                    <p id="pop-p1">Do You Want To Delete Appointment of <input type="text" value='' id="v_no" name="v_no" readonly style="border: none;text-align: center"></p>
                    <button class="button" type="button" style="background-color: #dddddd" onclick="popup_close()">Cancel</button>
                    </a><button class="button" type="submit">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    function deleteconfirm(id) {
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