<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
	
	<input type="hidden" id="register" value="<%= request.getAttribute("status") %>">
	<input type="hidden" id="loggedIn" value="<%= request.getAttribute("statusLogin") %>">

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
	
	<h1>Welcome to Customer Profile page <%= email != null ? email : "Unknown User" %> 
	<script> 
			
	 
	
	</script></h1>
	
	
	 <script type="text/javascript">
	 var status = document.getElementById("register").value;
		console.log(status);
		var session = '<%= email %>';
		 if(status == "registrationSuccess"){
		 		Swal.fire("Registration Successful").then(function() {
					window.location.href = '${pageContext.request.contextPath}/view/Login.jsp';
				});
		}
		 
	 </script>
	 
	 <script type="text/javascript">
	 var status = document.getElementById("loggedIn").value;
		console.log(status);
		 if(status == "LoginSuccess"){
			 Swal.fire("Login Successful").then(function() {
					window.location.href = '${pageContext.request.contextPath}/view/CustomerProfile.jsp';
				});;
		 }
	 </script>
	 

</body>
</html>
