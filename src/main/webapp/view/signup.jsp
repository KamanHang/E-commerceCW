<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Sign Up</title>
<style>
	@charset "ISO-8859-1";
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
    max-width: 400px;
    width: 100%;
    border-radius: 10px;
    padding: 30px;
    height: 600px;
    border-color: black;
    border-style:solid;
    margin-right: 10rem;
    margin-bottom: 5rem;
    margin-left: 10rem;
    margin-top: 2rem;
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
    margin-top: 10px;
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
    width: 40%;
    margin-left: 6.8rem
}

.form-link{
    text-align: center;
    margin-top: 1rem;
   
}
.form-link a{
    font-size: 14px;
    font-weight: 400;
    color:#232836;
    
}
.form a{
    color: #0171d3;
    text-decoration: none;
}
.button:hover{
    background-color: #FFA500;
    color: whitesmoke;
}

.signup-link:hover{
    text-decoration: none;
    color:#FFA500;
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
</style>
<link rel="stylesheet" href="fonts-6/css/all.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>

<input type="hidden" id="register" value="<%= request.getAttribute("status") %>">

	<div class="container">
        <div class="form">
            <div class="form-content">
                <form action="../registration" method = "post" enctype="multipart/form-data">
                <header>Sign up</header>
                
                	<div class="avatar">
                		<img class="avatar-img" id="imageShow" src="./img/avatar.png" alt="avtar-img" />
                	</div>
                    
                	<div class="input-field">
                		<i class="fa-solid fa-user" style="color: #2f2e41;"></i>
                        <input class="inputs" type="text" placeholder="Username" class="input" name="username" required />
                    </div>
                
                    <div class="input-field">
                    	 <i class="fa fa-solid fa-envelope" style="color: #2f2e41;"></i>
                         <input class="inputs" type="email" placeholder="Email" class="input" name="email" required />
                    </div>
                    

                    <div class="input-field">
                    	<i class="fa-solid fa-lock" style="color: #2f2e41;"></i>
                        <input class="inputs" type="Password" placeholder="Create a password" class="Password" name="password" required />
                        
                    </div>
                    <div class="input-field">
                    	<i class="fa-solid fa-image" style="color: #2f2e41;"></i>
						<input class = "input-img" id="imageChooser" onchange="changeImage()" type="file" name="image" /> 
					</div>

                    <div class="button-field">
                    	
                        <button class="button"  type="submit">Sign up</button>
                    </div>

                    <div class="form-link">
                          <span>Already have an account ? <a href="Login.jsp" class="signup-link">Login</a></span>
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
	<script type="text/javascript">
		
		
		var status = document.getElementById("register").value;
		console.log(status);
		if(status == "registrationError"){
			Swal.fire({
	            title: "User Already Exists!",
	            icon: "error",
	            confirmButtonText: "OK",
	        }).then(function() {
	           window.location.href = "${pageContext.request.contextPath}/view/Signup.jsp";
	       });;
		}
	</script>

</body>


</html>