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
    <link rel="stylesheet" href="../CSS/content.css">
    <title>Document</title>
</head>
<body>
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.io.IOException"%>

<%
    class slot{
        Integer slot_id;
        String leader;
    }
    List<slot> data = new ArrayList<slot>();

    try{
        Connection con = DatabaseConnection.initializeDatabase();
//      need to write sql q for find the right slots for the branch according
//      to the user using session management.
        PreparedStatement ps = con.prepareStatement("select * from serwise.slot");
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            slot slt = new slot();
            slt.slot_id=rs.getInt("Slot_Id");
            slt.leader=rs.getString("Slot_Leader_Id");
            data.add(slt);
        }
    }
    catch(SQLException sq){
        response.sendRedirect("Errsql.html");
    }
    catch(ClassNotFoundException cq){
        response.sendRedirect("Err.html");
    }
%>

<div id="blur" class="back_g">
        <header class="navigation">
            <img src="../../Assets/SerWise.png" class="navimg">
            <table>
                <tr>
                    <td><a href="../Home.jsp">Home</a></td>
                    <td><a href="../inventory.jsp">Inventory</a></td>
                    <td><a href="../Job/job.jsp">Jobs</a></td>
                    <td><a href="slot.jsp" style="color:#EE534F">Slots</a></td>
                    <td><a href="../../Login/login.html"><button class="button">Logout</button></a></td>
                </tr>
            </table>
        </header>



        <div class="single-content-div center title">
            <span class="title">SerWice &MediumSpace;</span> <span class="subtitle"> - &MediumSpace; Slot Management</span>
        </div>


        <div class="colomn-content">
            <%
                for(Integer i = 0; i<data.size();i++)
                {
                    out.println("<div>" +
                            "<span class=\"subtitle\" >Slot "+ data.get(i).slot_id+"</span><br>" +
                            "<button class=\"slot-button\" onclick=\"editslot("+data.get(i).slot_id+")\">Click Here</button>" +
                            "</div>");
                }
            %>
        </div>
</div>

<div id="popupwin">
    <div class="popup" id="popupid" >
        <div class="popup-content">
            <%
                class slotL{
                    Integer L_id;
                    String name;
                }
                class slotM{
                    Integer M_id;
                    String name;
                }
                List<slotL> data_SL = new ArrayList<slotL>();
                List<slotM> data_M = new ArrayList<slotM>();

                try{
                    Connection con = DatabaseConnection.initializeDatabase();
//      need to write sql q for find the right slots for the branch according
//      to the user using session management.
                    PreparedStatement ps1 = con.prepareStatement("select * from serwise.slot_leader INNER JOIN serwise.employee ON serwise.slot_leader.Employee_Id = serwise.employee.Employee_Id");
                    ResultSet rs1 = ps1.executeQuery();

                    while(rs1.next()){
                        slotL sl = new slotL();
                        sl.L_id=rs1.getInt("Slot_Leader_Id");
                        sl.name=rs1.getString("F_Name");
                        sl.name=sl.name+" ";
                        sl.name=sl.name+rs1.getString("L_Name");
                        data_SL.add(sl);
                    }


                    PreparedStatement ps2 = con.prepareStatement("select * from serwise.mechanic INNER JOIN serwise.employee ON serwise.mechanic.Employee_Id = serwise.employee.Employee_Id");
                    ResultSet rs2 = ps2.executeQuery();
                    while(rs2.next()){
                        slotM sm = new slotM();
                        sm.M_id=rs2.getInt("Employee_Id");
                        sm.name=rs2.getString("F_Name");
                        sm.name=sm.name+" ";
                        sm.name=sm.name+rs2.getString("L_Name");
                        data_M.add(sm);
                    }
                }
                catch(SQLException sq){
                    response.sendRedirect("Errsql.html");
                }
                catch(ClassNotFoundException cq){
                    response.sendRedirect("Err.html");
                }
            %>

            <div>
                <button class="close" onclick="popup_close()" style="background: none; border: none; float: right;">X</button>
            </div>
            <div>
                <p class="subtitle" id="Sname"></p>
                <form method="post" action="../../ServletEditSlot" id="frm_m">
                    <div class="frm-input">
                        <label>Slot Leader</label>
                        <input list="Slotleaders" name="SL" id="SL">
                        <datalist id="Slotleaders">
                            <%
                                for(Integer i = 0; i<data_SL.size();i++)
                                {
                                    out.println("<option value=\""+data_SL.get(i).L_id+" "+data_SL.get(i).name +"\">");
                                }
                            %>
                        </datalist>
                    </div>

                    <div class="frm-input">
                        <label>Slot Member</label>
                        <input list="member" id="M01">
                        <datalist id="member">
                            <%
                                for(Integer i = 0; i<data_M.size();i++)
                                {
                                    out.println("<option value=\""+data_M.get(i).M_id+" "+data_M.get(i).name +"\">");
                                }
                            %>
                        </datalist>
                    </div>

                    <div id="append" class="frm-input">
                    </div>
                    <div>
                        <p id="msg" style="color: #EE534F"></p>
                    </div>
                    <button id="plusbutton" type="button" class="close" onclick="add_member()" style="background: none; border: none; float: right">+</button>
                    <button id="minusbutton" type="button" class="close" onclick="removemember()" style="background: none; border: none; float: right; display: none">-</button>
                    <br>

                    <button class="button" type="button" style="background-color: #dddddd" onclick="popup_close()">Cancel</button>
                    </a><button class="button" type="submit">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    let N_of_m=0;
    function editslot(id)
    {
        var snm = document.getElementById('Sname');
        var bk_g = document.getElementById('blur');
        var popwin = document.getElementById('popupid');
        var ft = document.getElementById('footer');
        snm.innerText='Edit Slot ' + id;
        bk_g.classList.add('active');
        ft.classList.add('active');
        popwin.style.display='block';
    }
    function popup_close(){
        document.getElementById('popupid').style.display='none';
        var bk_g = document.getElementById('blur');
        bk_g.classList.remove('active');
        var input_container=document.getElementById("append");
        input_container.innerHTML="";
        N_of_m=0;
        const msg=document.getElementById("msg");
        msg.innerText="";
    }

    function add_member()
    {
        if(N_of_m<5)
        {
            const label = document.createElement('label');
            const inputM = document.createElement('input');
            const minusbutton=document.getElementById("minusbutton");
            minusbutton.style.display='block';
            label.innerText = 'Slot Member' +" "+ (++N_of_m);
            console.log(N_of_m);
            label.id = 'L' + (N_of_m);
            inputM.id = 'M' + (N_of_m);
            inputM.setAttribute('list','member');
            if(N_of_m==5)
            {
                const plusbutton=document.getElementById("plusbutton");
                plusbutton.style.display='none';
            }


            document.getElementById("append").appendChild(label);
            document.getElementById("append").appendChild(inputM);
            document.getElementById("append").appendChild("<br>");

        }
    }

    function removemember()
    {
        if(N_of_m>0)
        {
            const label = document.getElementById('L'+(N_of_m));
            const inputM = document.getElementById('M'+(N_of_m--));
            label.remove();
            inputM.remove();
            const plusbutton=document.getElementById("plusbutton");
            plusbutton.style.display='block';

        }
        if(N_of_m==0)
        {
            const minusbutton=document.getElementById("minusbutton");
            minusbutton.style.display='none';
        }
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