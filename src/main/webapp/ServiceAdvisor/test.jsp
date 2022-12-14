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
  <title>Document</title>
</head>
<body>
<%
  if (session.getAttribute("auth")==null){
    response.sendRedirect("/Login/login.html");
  }
  else {
    if (!session.getAttribute("auth").toString().equals("GM")) {
      out.println("invalid authentication");
      out.println(session.getAttribute("auth"));
    }
  }
%>
<header class="navigation"></header>


<div class="single-content-div center title">
  <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; Manage Employees</span>
</div>
<div class="single-content-div center title">
  Search By Employee ID : &MediumSpace;
  <form>
    <input type="text" placeholder="Employee ID">
    &MediumSpace;
    <input type="submit" value="Search" class="button">
  </form>
</div>
<div class="single-content-div center title">
  Search By First Name : &MediumSpace;
  <form>
    <input type="text" placeholder="First Name">
    &MediumSpace;
    <input type="submit" value="Search" class="button">
  </form>
</div>

<div class="form-display-table">
  <table class="form-display-table">
    <tr>
      <th>Employee ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Address</th>
      <th>Branch ID</th>
      <th>Role</th>
      <th>Contact</th>
      <th>Joinned Date</th>
      <th colspan="2">Manage Options</th>
    </tr>
    <%
      int noOfRows = (int) request.getAttribute("noOfRows");
      int i = 0;
      while (i<noOfRows){
        out.println("<tr>");
        out.println("<td>");
        String eid = request.getAttribute("EmployeeID"+i).toString();
        out.println(eid);
        out.println("</td>");
        out.println("<td>");
        out.println(request.getAttribute("FirstName"+i));
        out.println("</td>");
        out.println("<td>");
        out.println(request.getAttribute("LastName"+i));
        out.println("</td>");
        out.println("<td>");
        out.println(request.getAttribute("Address"+i));
        out.println("</td>");
        out.println("<td>");
        out.println(request.getAttribute("BranchID"+i));
        out.println("</td>");
        out.println("<td>");
        out.println("Dummy");
        out.println("</td>");
        out.println("<td>");
        out.println(request.getAttribute("Contact"+i));
        out.println("</td>");
        out.println("<td>");
        out.println(request.getAttribute("JoinedDate"+i));
        out.println("</td>");
        out.println("<td>");
        out.println("<a href='/updateEmployee?eid="+eid+"'><button class='button'>Update</button></a>");
        out.println("</td>");
        out.println("<td>");
        out.println("<a href='/deleteEmployee?eid="+eid+"'><button class='button'>Remove</button></a>");
        out.println("</td>");
        out.println("</tr>");
        i=i+1;
      }
    %>
    <%--            <tr>--%>
    <%--                <td>001</td>--%>
    <%--                <td>Thamira</td>--%>
    <%--                <td>Weerakoon</td>--%>
    <%--                <td>Galle</td>--%>
    <%--                <td>002</td>--%>
    <%--                <td>Branch Manager</td>--%>
    <%--                <td>0716895236</td>--%>
    <%--                <td>2020-05-22</td>--%>
    <%--                <td><button class="button">Update</button></td>--%>
    <%--                <td><button class="button">Remove</button></td>--%>
    <%--            </tr>--%>
  </table>
</div>


<footer class="footer">
  <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
  <div class="center"><a href="#"> Contact Us </a> &nbsp|
    &nbsp<a href="#"> About Us </a> &nbsp|
    &nbsp <a href="#"> Legal Stuff </a></div>
  <div class="center">All Rights Recieved</div>
</footer>
<script src="GeneralManager/GeneralManagerHeader.js"></script>
</body>
</html>