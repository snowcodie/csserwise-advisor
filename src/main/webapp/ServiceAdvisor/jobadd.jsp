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
  <title>Serwise</title>
</head>
<body>


<%
  if (request.getParameter("date") == null & request.getParameter("time") == null) {
    response.sendRedirect("createjob.jsp");
  } else {
    Integer id= Integer.valueOf(request.getParameter("id"));
  }
%>


<header class="navigation">
  <img src="../Assets/SerWise.png" class="navimg">
  <table>
      <td><a href="#">Inventory</a></td>
      <td><a href="Home.jsp" style="color:#EE534F">Jobs</a></td>
      <td><a href="#">Slots</a></td>
      <td><a href="../Login/login.html"><button class="button">Logout</button></a></td>
    </tr>
  </table>
</header>

<div class="two-content-div">
  <div class="two-content-div-one">
    <span class="title">SerWise</span><br>
    <span>Create Job</span>
  </div>
  <div class="two-content-div-form">
    <span class="subtitle">Create Job</span>

    <form method="post" action="../ServletCreateJob">
      <input type="text" placeholder="Type of Service" name="type" id="type"><br>
      <input type="Date" value='<%=request.getParameter("date")%>' name="date" id="date"><br>
      <input type="Time" value="<%=request.getParameter("time")%>" name="time" id="time">
      <input type="number" placeholder="Slot Number" name="slot" id="slot">
      <input type="submit" value="Create Job" class="button">
    </form>
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