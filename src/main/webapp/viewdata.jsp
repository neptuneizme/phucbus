<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Equals" %>
<%@ page import="java.util.Objects" %>
<%
  if(session.getAttribute("name")==null) {
    response.sendRedirect("login.jsp");
  }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>PhucBus</title>
  <link rel="icon" type="image/png" href="assets/images/icons/favicon.ico"/>
  <!-- Google font -->
  <link href="https://fonts.googleapis.com/css?family=PT+Sans:400" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Bootstrap -->
  <link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css" />

  <!-- Custom stlylesheet -->
  <link type="text/css" rel="stylesheet" href="assets/css/style.css" />

  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


</head>
<body>

<%@ include file="views/admin_header.html"%>
<br><br>


  <div class="w3-container">
    <div class="w3-bar w3-pink">
      <button class="w3-bar-item w3-button tablink w3-white" onclick="openCity(event,'fname')">Create new Route</button>
      <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'email')">Add Route to Date</button>
      <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'pass')">Create new ADMIN</button>
    </div>

    <div id="fname" class="w3-container w3-white w3-border city">
      <div class="w3-padding-16">
        <form class="w3-container w3-card-4" method="post" action="usersetting">
          <h2> Create new transit route</h2>
          <p>
            <label class="w3-text-pink"><b>Bus ID number</b></label>
            <input class="w3-input w3-border" name="new_route_busID" type="text"></p>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="w3-text-pink"><b>From</b></label>

                <select name="from" class="w3-select w3-input w3-border">
                  <option value="-1" >Select departure</option>
                  <%
                    try{
                      String Query ="select * from cities";
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","admin");
                      Statement stm =con.createStatement();
                      ResultSet rs=stm.executeQuery(Query);
                      while(rs.next()) {
                  %>
                  <option value="<%=rs.getInt("city_id")%>"><%=rs.getString("city_name")%></option>
                  <%
                      }
                    } catch (Exception e) {
                      e.printStackTrace();
                    }
                  %>>
                </select>
                </label>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="w3-text-pink"><b>To</b></label>
                <select name="to" class="w3-select w3-input w3-border">
                  <option value="-1" class="w3-text-pink">Select destination</option>
                  <%
                    try{
                      String Query ="select * from cities";
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","admin");
                      Statement stm =con.createStatement();
                      ResultSet rs=stm.executeQuery(Query);
                      while(rs.next()) {
                  %>
                  <option value="<%=rs.getInt("city_id")%>"><%=rs.getString("city_name")%></option>
                  <%
                      }
                    } catch (Exception e) {
                      e.printStackTrace();
                    }
                  %>>
                </select>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <p>
                  <label class="w3-text-pink"><b>Number of seat</b></label>
                  <input class="w3-input w3-border" name="new_route_busID" type="text"></p>
              </div>
            </div>
            <div class="col-md-6">
              <label class="w3-text-pink"><b>Seat type</b></label>
              <div class="form-group ">
                <select class="w3-select w3-input w3-border" name="option">
                  <option value="" disabled selected>Choose your option</option>
                  <option value="1">Seating</option>
                  <option value="2">Bed</option>

                </select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3">
              <div class="form-group">
                <p>
                  <label class="w3-text-pink"><b>Start time</b></label>
                  <input class="w3-input w3-border" name="new_route_busID" type="time"></p>
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <p>
                  <label class="w3-text-pink"><b>End time</b></label>
                  <input class="w3-input w3-border" name="new_route_busID" type="time"></p>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <p>
                  <label class="w3-text-pink"><b>Price</b></label>
                  <input class="w3-input w3-border" name="new_route_busID" type="text"></p>
              </div>
            </div>
          </div>
          <p><button class="w3-btn w3-pink w3-round-xxlarge">Create</button></p>
        </form>

      </div>
    </div>

    <div id="email" class="w3-container w3-white w3-border city" style="display:none">
      <div class="w3-padding-16">
        <form class="w3-container w3-card-4" method="post" action="usersetting">
          <h2> Add a route to specific date</h2>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <p>
                  <label class="w3-text-pink"><b>Date</b></label>
                  <input class="w3-input w3-border" name="new_route_busID" type="date"></p>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <p>
                  <label class="w3-text-pink"><b>Bus ID</b></label>
                  <input class="w3-input w3-border" name="new_route_busID" type="text"></p>
              </div>
            </div>
          </div>
          <button class="w3-btn w3-pink w3-round-xxlarge">Add</button></p>
        </form>
      </div>
    </div>
    <div id="pass" class="w3-container w3-white w3-border city" style="display:none">
      <div class="w3-padding-16">
        <form class="w3-container w3-card-4" method="post" action="usersetting">
          <h2>Create new ADMIN account</h2>
          <p>
            <label class="w3-text-pink"><b>Username</b></label>
            <input class="w3-input w3-border" name="old_pass" type="type"></p>
          <p>
            <label class="w3-text-pink"><b>First name</b></label>
            <input class="w3-input w3-border" name="old_pass" type="type"></p>
          <p>
            <label class="w3-text-pink"><b>Last name</b></label>
            <input class="w3-input w3-border" name="old_pass" type="type"></p>
          <p>
            <label class="w3-text-pink"><b>New password</b></label>
            <input class="w3-input w3-border" name="new_pass" type="password"></p>
          <p>
            <label class="w3-text-pink"><b>Repeat new password</b></label>
            <input class="w3-input w3-border" name="new_repass" type="password"></p>
          <p>
            <input name="section" type="hidden" value="password"></p>
          <button class="w3-btn w3-pink w3-round-xxlarge">Create</button></p>
        </form>
      </div>
    </div>

    <script>
      function openCity(evt, cityName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("city");
        for (i = 0; i < x.length; i++) {
          x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < x.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" w3-white", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " w3-white";
      }
    </script>
  </div>


<%@ include file = "views/footer.html" %>
</body>
</html>