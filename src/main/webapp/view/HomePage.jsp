<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@page import="java.util.Date" %>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Page</title>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Poppins', sans-serif;
  background-color: #f0f0f0;
}

.header {
  text-align: center;
  margin: 20px 0;
}

.header {
  text-align: center;
  margin: 0px 0;
}

.product-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 20px;
  margin: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  text-align: center;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.product-container:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.product-container img {
  margin-bottom: 10px;
}

.product-name {
  font-size: 18px;
  font-weight: bold;
  margin: 5px 0;
}

.product-brand {
  font-size: 16px;
  color: #888;
  margin: 5px 0;
}

.product-description {
  font-size: 14px;
  margin: 5px 0;
}

.product-price {
  font-size: 16px;
  font-weight: bold;
  margin: 10px 0;
}

.add-to-cart-btn {
  display: inline-block;
  padding: 8px 16px;
  background-color: #007bff;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  transition: all 0.3s ease;
}

.add-to-cart-btn:hover {
  background-color: #0056b3;
}

table th{
	padding: 1rem;
}

.navbar {
  background-color: #fff;
  box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
  height: 80px;
  display: flex;
  justify-content: space-between;
  
}

.navbar h1{
	margin-left: 2rem;
	margin-top: 1rem;
}

ul {
  list-style: none;
  display: flex;
  align-items: center;
  margin: 0;
  padding: 0;
}

li {
  margin: 0 20px;
}

.nav-links{
	margin-left: 15rem;
	margin-top: 2rem;

}

.nav-links ul a {
  color: #333;
  text-decoration: none;
  font-size: 16px;
  font-weight:bold;
  letter-spacing: 1px;
  transition: color 0.2s ease-in-out;
  	padding:0.3rem;
}

.nav-links ul a:hover {
  background-color: #2f2e41;
  
  border-radius:5px;
  color: white;
  transition: color 0.5s ease-in;
}

.search{
	margin-top: 2rem;
	width: 50%;
	display: flex;
	margin-left: 5rem;
}

.inputs{

	width: 25rem;
	height: 2rem;
	margin-left: 0rem;

}

.search-btn{
	margin-left: 1rem;
}

.search-bar{
	display: inline-block;
}




</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>

<input type="hidden" id="register" value="<%= request.getAttribute("status") %>">
	<input type="hidden" id="loggedIn" value="<%= request.getAttribute("statusLogin") %>">

<div class="header">
	<div class="navbar">
		
			<h1>PoShak</h1>
			
				<div class="nav-links">
				  <ul>
				    <li><a href="${pageContext.request.contextPath}/homepage">Home</a></li>
				    <li><a href="view/FirstPage.jsp">Users</a></li>
				    <li><a href="view/AddToCart.jsp">Add to Cart</a></li>
				    <li><a class="edit-link" href="${pageContext.request.contextPath}/editProfile?email=${sessionScope.email}">Edit Profile</a></li>
				    
				  </ul>
				</div>
	</div>
</div>	

	<c:set var="time" value="<%=new Date().getTime()%>"/>
	
	
		<table>
	<tr>
	<c:forEach var="pd" items="${pdList}" varStatus="status">
		<th>
			<div class="product-container">
				<img src="images/${pd.productImage}?v=${time}" height="100px" width="100px">
				<h2 class="product-name">${pd.productName}</h2>
				<h3 class="product-brand">${pd.productBrand}</h3>
				<p class="product-description">${pd.productDescription}</p>
				<p class="product-price">$ ${pd.productPrice}</p>
				<a href="${pageContext.request.contextPath}/addtocart?id=${pd.productID}" class="add-to-cart-btn">Add to Cart</a>
			</div>
		</th>
		<c:if test="${status.count % 5 == 0}">
			</tr><tr> <!-- switch to a new row after printing 5 products -->
		</c:if>
	</c:forEach>
	</tr>
</table>
	 
	 <script type="text/javascript">
	 var status = document.getElementById("loggedIn").value;
		console.log(status);
		 if(status == "LoginSuccess"){
			 Swal.fire("Login Successful").then(function() {
					window.location.href = '${pageContext.request.contextPath}/homePage';
				});;
		 }
	 </script>
	 
	
	
	<script type="text/javascript">
	function logout(){
		
		window.location.href = "${pageContext.request.contextPath}/view/Login.jsp"
	}
	</script>

</body>
</html>

