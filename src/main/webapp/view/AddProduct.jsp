<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Add Product</title>
<style>
		@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
.container{
    height: 100vh;
    width: 100%;
    background-color: white;
    display: flex;
    align-items: center;
    justify-content: center;
}
.form{
    background: white;
    
    width: 150% ;
    border-radius: 10px;
    padding: 30px;
    height: 600px;
    border-color: black;
    border-style:solid;
    margin-right: 10rem;
    margin-bottom: 5rem;
    margin-left: 10rem;
    margin-top: 4rem;
    box-shadow:  grey 0px 10px 20px -10px;
    border-width:medium;
}
header{
    font-size: 28px;
    font-weight: 600;
    color: #232836;
    text-align: center;
}
/* .field{
    position: relative;
    height: 50px;
    width: 100%;
    margin-top: 20px;
    border-radius: 6px;
} */

.button{
    height: 100%;
    width: 100%;
    border: none;
    font-size: 16px;
    font-weight: 400;
    border-radius: 6px;
    
    
}
.inputs{
    outline: none;
    padding: 0 15px;
    border: 1px #2f2e41;
    background-color: whitesmoke;
    width: 100%;
    height: 7vh;
    margin: 0rem 0 0 1rem;
    border-radius: 7px;
}

.inputs:focus{
    border-bottom-width: 2px;
}

.input-field {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    height: 50px;
    width: 100%;
    margin-top: 20px;
    border-radius: 6px;
    padding-left: 1rem;
}


.input-field .fa-solid {
  position: absolute;
  left: 5px;
  top: 30px;
  transform: translateY(-50%);
}

.button{
    color: white;
    background-color: #2f2e41; 
    transition: all 0.3s ease;
    font-size: 21px;
    margin-top: 20px;
    height: 3rem;
    width: 15%;
    margin-left: 3.5rem;
    margin-right: 2rem;
    
}

.form-link{
    text-align: center;
    margin-top: 1rem;
   
}
.form-link a{
    font-size: 14px;
    font-weight: 400;
    
    
}
.form a{
 
    text-decoration: none;
}
.button:hover{
    background-color: #FFA500;
    color: whitesmoke;
     cursor: pointer;
}

.signup-link:hover{
    text-decoration: none;
    color:#FFA500;
    cursor: pointer;
}

.avatar-img{
	height: 150px;
	border-radius: 50%;
}

.avatar{
	background: white;
	display: flex;
	justify-content: center;
	align-items: center;
	
}

.input-img{
    outline: none;
    padding: 15px;
    border: 1px #2f2e41;
    background-color: whitesmoke;
    width: 100%;
    height: 7vh;
    margin: 0rem 0 0 1rem;
    border-radius: 7px;
}
.division{
	display: flex;
}

.button-field {
    display: flex;
    width: 100%;
    margin-top: 2rem;
    justify-content: center;
  }
  
.view-products {
	color: white;
    background-color: #28a745; 
    transition: all 0.3s ease;
    margin-top: 20px;
    height: 3rem;
    width: 15%;
    margin-left: 0rem;
    margin-right: 0;
    border-radius: 6px;
    padding: 0.7rem 1rem 0.5rem 1.7rem;
}

.view-products:hover {
  background-color: #FFA500;
  color: whitesmoke;
  cursor: pointer;
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
	 <script type="text/javascript">
	 var status = document.getElementById("loggedIn").value;
		console.log(status);
		 if(status == "success"){
		 		Swal.fire({
					icon: 'success',
					title: 'Product Added Succesfully!',
					confirmButtonText: 'OK'
				}).then(function() {
			           window.location.href = "${pageContext.request.contextPath}/adminPanel";
			       });;
		}else if(status == "failed"){
			
			Swal.fire({
				icon: 'error',
				title: 'Product ID already Exists!',
				confirmButtonText: 'OK'
			}).then(function() {
		           window.location.href = "${pageContext.request.contextPath}/view/AddProduct.jsp";
		       });;
			
		}
	
	 </script>

	<div class="container">
        <div class="form">
            <div class="form-content">
                <form action="../addProduct" method = "post" enctype="multipart/form-data">
                <header>Add Product</header>
                
                	<div class="avatar">
                		<img class="avatar-img" id="imageShow" src="./img/addproduct.png" alt="avtar-img" />
                	</div>
                    <div class="division">
	                	<div class="input-field">
	                		<i class="fa-solid fa-id-card" style="color: #2f2e41;"></i>
	                        <input class="inputs" type="text" placeholder="Enter Product ID" class="input" name="productID" required />
	                    </div>
	                
	                    <div class="input-field">
	                   
	                    	 <i class="fa-solid fa-signature" style="color: #2f2e41;"></i>
	                         <input class="inputs" type="text" placeholder="Enter Product Name" class="input" name="productName" required />
	                    </div>
	                    
	                     <div class="input-field">
	             
	                    	 <i class="fa-solid fa-signature" style="color: #2f2e41;"></i>
	                         <input class="inputs" type="text" placeholder="Enter Product Brand" class="input" name="productBrand" required />
	                    </div>
	                    
	
	                    <div class="input-field">
	          
	                    	<i class="fa-solid fa-align-justify" style="color: #2f2e41;"></i>
	                        <input class="inputs" type="text" placeholder="Enter Product Description" class="input" name="description" required />
	                    </div>
	                    
	                </div>
	                 <div class="input-field">
	                   
	                    
	                    	 <i class="fa-solid fa-star"  style="color: #2f2e41;"></i>
	                         <input class="inputs" type="text" placeholder="Enter Product Rating" class="input" name="productRating" required />
	                    </div>
	                
	                <div class="division">
	                    
		                     <div class="input-field">
		                
		                    	<i class="fa-solid fa-money-bill" style="color: #2f2e41;"></i>
		                        <input class="inputs" type="text" placeholder="Enter Product Price" class="input" name="productPrice" required />
		                    </div>
		                    
		                 <div class="input-field">
		                    	<i class="fa-solid fa-venus-mars" style="color: #2f2e41;"></i>
		                        <input class="inputs" type="text" placeholder="Enter Product Category" class="input" name="productCategory" required />
		                    </div>
	                    
	                   
	                    
	                    <div class="input-field">
	                    	<i class="fa-solid fa-image" style="color: #2f2e41;"></i>
							<input class = "input-img" id="imageChooser" onchange="changeImage()" type="file" name="productImage" /> 
						</div>
					 </div>
					 
					 
                    <div class="button-field">
                    	
                        <button class="button"  type="submit">Add</button>
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

</body>


</html>