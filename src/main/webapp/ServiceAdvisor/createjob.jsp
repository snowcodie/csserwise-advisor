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
<header class="navigation">
  <img src="../Assets/SerWise.png" class="navimg">
  <table>
    <tr>
      <td><a href="../Home/home.html ">Home</a></td>
      <td><a href="#">Inventory</a></td>
      <td><a href="#" style="color:#EE534F">Jobs</a></td>
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
    <span class="subtitle">Login</span>

    <form method="post" action="../ServletCreateJob">
      <input type="text" placeholder="Email" name="Email" id="Email"><br>
      <input type="password" placeholder="Password" name="pass" name="pass"><br>
      <input type="submit" value="Login" class="button"> &MediumSpace;
      <a href="#"><button class="button">Forget Password?</button></a>
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