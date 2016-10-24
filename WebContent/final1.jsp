<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("token_id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://redvelvetdb.czvyaawmcxuy.ap-south-1.rds.amazonaws.com:3306/";
String dbName = "botdb";
String userId = "awsadmin";
String password = "awsadmin";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en">


<head>
<form action=update>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('#lstFruits').multiselect({
            includeSelectAllOption: true
        });
    });
</script>
</head>
<body>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WhyQ</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="NewFinal.jsp">Counter View</a></li>
      <li><a href="final1.jsp">Manager View</a></li>
     <li><button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Cafe List
  <span class="caret"></span></button>
  <ul class="dropdown-menu">
    <li><a href="#">Kalyan Bhel</a></li>
    <li><a href="#">CCD</a></li>
    <li><a href="#">StarBucks</a></li></li>
    </ul>
  
   
  </div>
 
</nav>
  
<h2 align="center"><font><strong>Tokens</strong></font></h2></head>
<table class="table table-bordered" id="tbUser" align="center" width="50%" height="10%">
<tr>

</tr>
<tr>

<td  class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;" align="center"><b>Menu</b></td>
<td  class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"  align="center"><b>Quantity Pending</b></td>



</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select name,sum(quantity) from orderline ol, menuitem mi, orderinfo od where mi.itemid = ol.itemid and od.orderid=ol.orderid GROUP BY name";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
	System.out.println(resultSet.getString("name"));
%>
<tr>

<td class="info" align="center"><%=resultSet.getString("name") %></td>

<td class="warning"  align="center"><%=resultSet.getString("sum(quantity)") %></td>


</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%><script>
$(document).ready(function(){

 $("#tbUser").on('click','#btnDelete',function(){
       $(this).closest('tr').remove();
     });

});

</script>

<script type="text/javascript"> $(function(){$('#ddlCars2').multiselect({ 
        includeSelectAllOption: true,
        enableFiltering:true         
        
  });
    });</script>
</table>
</body>
</html>