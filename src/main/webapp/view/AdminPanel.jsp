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

.table {
  margin: 3rem auto;
  width: 95%;
  border-collapse: collapse;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  background-color: #fff;
}

.table th,
.table td {
  padding: 0.5rem;
  text-align: center;
  border: 1px solid #ddd;
}

.table th {
  background-color: #f8f8f8;
}

.table tr{
  background-color: white;
}

.btn {
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: #007bff;
  color: #fff;
  text-decoration: none;
  border-radius: 3px;
  transition: background-color 0.3s ease-in-out;
}

.btn:hover {
  background-color: #0069d9;
}

.add-link-container {
  text-align: center;
}

.add-link {
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: #2f2e41;
  color: #fff;
  text-decoration: none;
  border-radius: 3px;
  transition: background-color 0.3s ease-in-out;
}

.add-link:hover {
  background-color: #218838;
}

.edit-link {
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: #2f2e41;
  color: #fff;
  text-decoration: none;
  border-radius: 3px;
  transition: background-color 0.3s ease-in-out;
}

.edit-link:hover {
  background-color: #218838;
}

.delete-link {
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: #8B0000;
  color: #fff;
  text-decoration: none;
  border-radius: 3px;
  transition: background-color 0.3s ease-in-out;
}

.delete-link:hover {
  background-color: #218838;
}

.header {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 8rem;
  background-color: #343a40;
  color: #fff;
}

.header h1 {
  font-size: 2rem;
  text-align: center;
}

.header a {
  color: #ffc107;
  text-decoration: none;
  margin-left: 0rem;
  transition: color 0.3s ease-in-out;
}

.header a:hover {
  color: #ffdb58;
}

.admin{
	padding-left: 0rem;
}

.login{
	position:absolute;
	display:inline-block;
	margin-left: 80rem;
	margin-top: 4rem;
}

.logout{
	font-size: 15px;
}

.logout {
  display: inline-block;
  padding: 0.5rem;
  margin: 0 0 0 0rem
  background-color: #2f2e41;
  color: #fff;
  text-decoration: none;
  border-radius: 3px;
  transition: background-color 0.3s ease-in-out;
  text-align: right;
}

.logout a:hover {
  color: #fff;
}



</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
		<%
		String email = (String) session.getAttribute("email");
		if (email == null || email.isEmpty()) {
	%>
			<script>
				Swal.fire({
					icon: 'error',
					title: 'Please log in first',
					confirmButtonText: 'OK'
				}).then(function() {
					window.location.href = '${pageContext.request.contextPath}/view/Login.jsp';
				});
			</script>
	<%
			return;
		}
	%>
<div class="header">
	<h1>Admin Panel</h1>
	<div class="login">
		<h5 class="admin">Loggedin as <%= session.getAttribute("email") != null ? session.getAttribute("email") : "Error Please <a href=Login.jsp>Try Again</a>" %></h5>
		<a  href="${pageContext.request.contextPath}/view/AdminLogin.jsp" onclick= "logout()" class="logout">Log Out</a>
	</div>
</div>	
	<c:set var="time" value="<%=new Date().getTime()%>"/>
	<table border = "1" class = "table">
		<tr>
			<th>Product Id</th>
			<th>Product Image</th>
			<th>Product Name</th>
			<th>Product Brand</th>
			<th>Product Description</th>
			<th>Product Category</th>
			<th>Product Rating</th>
			<th>Product Price</th>
			<th>Actions</th>
		</tr>
		<c:forEach var="pd" items="${pdList}">
			<tr>
				<td><c:out value="${pd.productID}"/></td>
				<td><img src="images/${pd.productImage}?v=${time}" height="100px" width="100px"></td>
				<td>${pd.productName}</td>
				<td>${pd.productBrand}</td>
				<td>${pd.productDescription}</td>
				<td>${pd.productCategory}</td>
				<td>${pd.productRating}</td>
				<td>Rs. ${pd.productPrice}</td>
				
				<td><a class="edit-link" href="${pageContext.request.contextPath}/editProduct?id=${pd.productID}">Edit</a>
					<a class="delete-link" href="${pageContext.request.contextPath}/deleteProduct?id=${pd.productID}">Delete</a></td>
			</tr>	
		</c:forEach>
	
	</table>
	
	<div class="add-link-container">
  		<a href="${pageContext.request.contextPath}/view/AddProduct.jsp" class="add-link">Add Product</a>
  		<a href="${pageContext.request.contextPath}/view/AddProduct.jsp" class="add-link">View Order List</a>
	</div>
	
	<script type="text/javascript">
	function logout(){
		
		<%
		session.setAttribute("email", null);
		if (email == null  || email.isEmpty()) {
	%>
			<script>
				Swal.fire({
					icon: 'error',
					title: 'Logging Out',
					confirmButtonText: 'OK'
				}).then(function() {
					window.location.href = '${pageContext.request.contextPath}/view/AdminLogin.jsp.jsp';
				});
			</script>
	<%
			return;
		}
	%>
		
	}
	</script>

</body>
</html>

