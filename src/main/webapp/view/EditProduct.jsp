<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Edit Product</title>
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
  width: 170px;
  height: 170px;
  
  
 
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
  
}

.button:hover {
  color: #ffffff;
  background-color: #0077cc;
}

.view-products {
  display: flex;
  align-items: center;
  color: #0077cc;
  text-decoration: none;
  transition: all 0.2s ease-in-out;
  margin-left: 1rem;
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
					window.location.href = '${pageContext.request.contextPath}/view/AdminLogin.jsp';
				});
			</script>
	<%
			return;
		}
	%>
	 

	<div class="container">
        <div class="form">
            <div class="form-content">
                <form action="${pageContext.request.contextPath}/updateProduct" method = "post" enctype="multipart/form-data">
                <header>Edit Product</header>
                
                	<div class="avatar">
                		<img class="avatar-img" id="imageShow" src="images/${product.productImage}" alt="avtar-img" />
                	</div>
                    <div class="division">
	                	<div class="input-field">
	                		<label>Product ID</label>
	                
	                        <input class="inputs" type="text"  class="input" name="productID" value="${product.productID}" readonly="readonly" />
	                    </div>
	                
	                    <div class="input-field">
	                   		<label>Product Name</label>
	                    	 
	                         <input class="inputs" type="text" placeholder="Enter Product Name" class="input" name="productName" value="${product.productName}" />
	                    </div>
	                    
	                    <div class="input-field">
	             			<label>Product Brand</label>
	                    	 
	                         <input class="inputs" type="text" placeholder="Enter Product Brand" class="input" name="productBrand" value="${product.productBrand}" required />
	                    </div>
	                </div>
					<div class="division">
	                    <div class="input-field">
	          				 <label>Description</label>
	                    	
	                        <input class="inputs" type="text" placeholder="Enter Product Description" class="input" name="description" value="${product.productDescription}" required />
	                    </div>
	                    
	                    <div class="input-field">
	                   
	                    	<label>Rating</label>
	                    	 
	                         <input class="inputs" type="text" placeholder="Enter Product Rating" class="input" name="productRating" value="${product.productRating}" required />
	                    </div>
                    
                    
                     
	                    <div class="input-field">
	                    			<label>Product Category</label>
			                    	
			                        <input class="inputs" type="text" placeholder="Enter Product Category" class="input" name="productCategory" value="${product.productCategory}" required />
			             </div>
			        
	                 </div>
	                 <div class="division">
	                     <div class="input-field">
	                     	<label>Price</label>
	                    	
	                        <input class="inputs" type="text" placeholder="Enter Product Price" class="input" name="productPrice" value="${product.productPrice}" required />
	                    </div>
	                    
	                 
	                    <div class="input-field">
	                    	<label>Choose Image</label>
							<input class = "input-img" id="imageChooser" onchange="changeImage()" type="file" name="productImage"  /> 
						</div>
					
					</div>
					
                    <div class="button-field">
                    	
                        <button class="button"  type="submit">Edit</button>
                        <a class="view-products" href="${pageContext.request.contextPath}/adminPanel"  >View Products</a>
                        
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

</body>


</html>