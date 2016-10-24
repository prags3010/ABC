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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
      <script src="Scripts/jquery-1.3.2.js"
    type="text/javascript"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>
 <script src="http://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
	
<script src="js/app-ajax.js" type="text/javascript"></script>
  
    <script> $(function(){$('#ddlCars2').multiselect({ 
        includeSelectAllOption: true,
        enableFiltering:true         
        
  });
    });</script>
   
<!-- <script>
$(document).ready(function(){

 $("#tbUser").on('click','#remove',function(){
	 var index = btn.id.substr(7);
		var tokenid = document.getElementById('hdnTokenId_'+index);
		//response.redirect("update.jsp");
		
		alert(tokenid.value);
		
      
     });

}); -->

<script>
        function deleteRow(btn) {
        	
        	
           		var index = btn.id.substr(7);
           		var tokenid = document.getElementById('hdnTokenId_'+index);
           		alert(tokenid.value);
           		var abc=tokenid.value;
           	//	document.getElementById("tokenIdvalue").value=abc;
           	//	alert(document.getElementById("tokenIdvalue").value);
           		//alert('123');
           		
           		 document.getElementById("abc").value=abc;
           		document.getElementById("hid").value=abc; 
           		document.getElementById("loginid").submit();
           	 
           		document.getElementById("tbUser").deleteRow(0);
           	 $(this).closest('tr').remove();
           		
           		
        }
        
    </script>
    <script>
   
     $(document).ready(function() {
            $('#remove').click(function() {
                $('tr:nth-child(2)').hide();
                // if your table has header(th), use this
                //$('td:nth-child(2),th:nth-child(2)').hide();
            });
        });
     </script>
</head>
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
<section class="wrapper">
    <!-- Row title -->
    <main class="row title">

	<table class="table table-bordered" id="tbUser" align="center" width="20%" height="%30">
	<thead>
	<tr></tr>
	<tr>
		<td ><b></b>
		<td class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"><b>Token No</b></td>
		<td class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"><b><select id="ddlSport" class="ddlFilterTableRow" multiple="multiple" data-attribute="sports">
		<option value="0">Select All</option>
		<option value="Pani Puri">Pani Puri</option>
		<option value="Mataki Bhel">Mataki Bhel</option>
		<option value="Masala Dosa">Masala Dosa</option>
		<option value="Gulkand">Gulkand</option>
		<option value="Normal Bhel">Normal Bhel</option>
		<option value="SP. Bhel">SP. Bhel</option>
		<option value="Cut Dosa">Cut Dosa</option>
		<option value="Black Coffee">Black Coffee</option>
		<option value="Expresso">Expresso</option>
		<option value="Cafe Mocha">Cafe Mocha</option>
		<option value="Strawberry">Strawberry</option>
		</select></b></td>
		<td class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"><b>Order No</b></td>
		<td class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"><b>Quantity</b></td>
		<td class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"><b>Customer</b></td>
		<td class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"><b>Status</b>
		<td class="product" style="background:#69C7F1; border-top-left-radius: 5px; border-left:0px;"><b>Order State</b></td>
		<td></td>
	</tr>
	
		
		<%
		String name=request.getParameter("name");
		System.out.println(name);
		
		
		try{ 
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="select tokenid ,mi.name, ol.orderid, ol.quantity, od.username,status from token t, orderline ol, menuitem mi, orderinfo od where t.tokenid = ol.orderlineid and mi.itemid = ol.itemid and od.orderid=ol.orderid";
		int i=0;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		<script type="text/javascript">
		function changeColor() {
				var eID = document.getElementById("ddlCars2");
				var colorVal = eID.options[eID.selectedIndex].value;
				var colortxt = eID.options[eID.selectedIndex].text;
				var menuname = $('#ddlCars2').find(":selected").text();
				alert(menuname);
				window.location.replace("NewFinal.jsp?name="+menuname);
				var x=<%=resultSet.getString("name") %>
				alert('x '+x);
				if(menuname==x){
					alert("Panipuri selected");
				}
				
		
		}
</script>




		<tr class="Row" data-sports="<%=resultSet.getString("name") %>">
		
		 <input type="hidden" id="hdnTokenId_<%=i %>" value="<%=resultSet.getString("tokenid")%>"/>
		<td class="info"><%=resultSet.getString("tokenid") %></td>
		<td class="warning"><%=resultSet.getString("name") %></td>
		<td class="active"><%=resultSet.getString("orderid") %></td>
		<td class="danger"><%=resultSet.getString("quantity") %></td>
		
		<td class="success"><%=resultSet.getString("username") %></td>
		<td class="warning"><%=resultSet.getString("status") %></td>
		<input type="hidden" id="tokenIdvalue" name="tokenIdvalue"/>
		<td class="info"><button  id="remove_<%=i %>" class="price-buy"  onclick="deleteRow(this)">Complete<span class="hide-mobile"></span></button></td>
		<%i++; %>
		<td></td>
		</tr>
  
		<%
		}
		
		} catch (Exception e) {
		e.printStackTrace();
		}
		%> 
		</thead>
	</table>
	



	<form action="updates" id="loginid">
	<input type="hidden" id="abc" name="name"/>
	<input type="hidden" id="hid" name="hidname" >
	<input type="submit">
</form>

<script>
$('select.ddlFilterTableRow').bind('change', function () {
    $('select.ddlFilterTableRow').attr('disabled', 'disabled');
    $('#tbUser').find('.Row').hide();
    var critriaAttribute = '';

    $('select.ddlFilterTableRow').each(function () {
        console.log($(this).data('attribute'));
        if ($(this).val() != '0') {
            critriaAttribute += '[data-' + $(this).data('attribute') + '="' + $(this).val() + '"]';
        }
    });
    alert(critriaAttribute);
    $('#tbUser').find('.Row' + critriaAttribute).show();
    $('#headerCount').html($('table#tbUser tr.Row:visible').length + ' Registered Kids');
    $('select.ddlFilterTableRow').removeAttr('disabled');
});
</script>
</body>
</html>