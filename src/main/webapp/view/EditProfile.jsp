<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Edit Profile</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f7f7f7;
}

.form {
  width: 100%;
  max-width: 600px;
  background-color: #ffffff;
  border-radius: 10px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.form-content {
  padding: 40px;
}

form {
  display: flex;
  flex-direction: column;
}

header {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 40px;
}

.avatar {
  display: flex;
  justify-content: center;
  margin-bottom: 40px;
}

.avatar-img {
  width: 150px;
  height: 150px;
  object-fit: cover;
  border-radius: 50%;
  border: 2px solid #cccccc;
}

.division {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.input-field {
  flex: 1;
  margin-right: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.inputs {
  display: block;
  width: 100%;
  padding: 10px;
  border: 1px solid #cccccc;
  border-radius: 5px;
}

.button-field {
  display: flex;
  justify-content: center;
  margin-top: 40px;
}

.button {
  padding: 10px 20px;
  background-color: #2f2e41;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  width:20%;
  padding: 1rem;
}

.button:hover {
  color: white;
  background-color: #218838;
}

.view-products {
  display: flex;
  align-items: center;
  color: #0077cc;
  text-decoration: none;
  font-weight: bold;
  transition: all 0.2s ease-in-out;
}

.view-products:hover {
  color: #ffffff;
  background-color: #0077cc;
  padding: 10px 20px;
  border-radius: 5px;
}

.input-img{
	  display: block;
	  width: 100%;
	  padding: 10px;
	  border: 1px solid #cccccc;
	  border-radius: 5px;
}

.logout{
	 padding: 5px 10px;
  background-color: #2f2e41;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  width:20%;
  padding: 0.5rem;
margin-left:26rem;
}

</style>
<link rel="stylesheet" href="fonts-6/css/all.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>




<input type="hidden" id="loggedIn" value="<%= request.getAttribute("status") %>">

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
					window.location.href = '${pageContext.request.contextPath}/view/FirstPage.jsp';
				});
			</script>
	<%
			return;
		}
	%>
	 

	<div class="container">
        <div class="form">
            <div class="form-content">
            	 <button class="logout"  onclick="logout()" type="submit">Log out</button>
                <form action="${pageContext.request.contextPath}/updateProfile" method = "post" enctype="multipart/form-data">
                <header>Edit Profile</header>
                
               
                
                	<div class="avatar">
                		<img class="avatar-img" id="imageShow" src="images/${customer.imagePath}" alt="avtar-img" />
                	</div>
                    <div class="division">
	                	<div class="input-field">
	                		<label> Username</label>
	                        <input class="inputs" type="text"  class="input" name="username" value="${customer.username}" readonly="readonly" />
	                    </div>
	                    
	                
	                    <div class="input-field">
	                   
	                    	 <label> PhoneNumber </label>
	                         <input class="inputs" type="text" placeholder="Enter Product Name" class="input" name="phoneNumber" value="${customer.phoneNumber}" />
	                    </div>
	               
                  	</div>
                  	<div class="division">
	                    <div class="input-field">
	             
	                    	 <label> Address </label>
	                         <input class="inputs" type="text" placeholder="Enter Product Brand" class="input" name="address" value="${customer.address}" required />
	                    </div>
	                
	                    <div class="input-field">
	          
	                     	<label> Password </label>
	                        <input class="inputs" type="text" placeholder="Enter Product Description" class="input" name="password" value="${customer.password}" required />
	                    </div>
	                </div>
	                <div class="division"> 
	                    <div class="input-field">
	                   
	                    
	                    	 <label> Email </label>
	                         <input class="inputs" type="text" placeholder="Enter Product Rating" class="input" name="email" value="${customer.email}" required />
	                    </div>
                    
                    
                    <div class="input-field">
	                    	<label> Change Image </label>
							<input class = "input-img" id="imageChooser" onchange="changeImage()" type="file" name="image"  /> 
					</div>
                  </div>
					
                    <div class="button-field">
                    	
                        <button class="button"  type="submit">Edit</button>
                        
                        
          
                    </div>

                 
                </form>
                
            </div>
        </div>
    </div>
    <script>
		function changeImage(){
			var imageChooser = document.querySelector("#imageChooser");
			var showImage = document.querySelector("#imageShow");
			showImage.src = URL.createObjectURL(imageChooser.files[0]);
		}
	</script>
	
	<script>
	 var status = document.getElementById("loggedIn").value;
		console.log(status);
		 if(status == "EditSuccess"){
		 		Swal.fire({
					icon: 'success',
					title: 'Edit Success Succesfully!',
					confirmButtonText: 'OK'
				}).then(function() {
			           window.location.href = "${pageContext.request.contextPath}/view/EditProduct.jsp";
			       });;
		}else if(status == "EditFailed"){
			Swal.fire({
				icon: 'error',
				title: 'Edit Failed',
				confirmButtonText: 'OK'
			}).then(function() {
		           window.location.href = "${pageContext.request.contextPath}/view/EditProduct.jsp";
		       });;
		}
	</script>
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
					window.location.href = '${pageContext.request.contextPath}/view/FirstPage.jsp';
				});
			</script>
	<%
			return;
		}
	%>
		
		window.location.href = "${pageContext.request.contextPath}/view/FirstPage.jsp"
	}
	</script>
</body>


</html>