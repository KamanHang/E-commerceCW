<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/AdminLogin.css">
<link rel="stylesheet" href="fonts-6/css/all.css">

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
    max-width: 400px;
    width: 100%;
    border-radius: 10px;
    padding: 30px;
    height: 450px;
    border-color: black;
    border-style:solid;
    margin-right: 10rem;
    margin-bottom: 5rem;
    margin-left: 8rem;
    margin-top: 4rem;
    box-shadow:  grey 0px 10px 20px -10px;
    border-width:medium;
    padding-top: 6rem;
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
    margin: 1rem 0 0 1rem;
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
    margin-top: 3rem;
    height: 3rem;
    width: 40%;
    margin-left: 6.8rem;
    
}

.form-link{
    text-align: center;
    margin-top: 2rem;
   
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

</style>

<title>Admin Login Page</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>

<input type="hidden" id="loggedin" value="<%= request.getAttribute("status") %>">

	<div class="container">
        <div class="form">
            <div class="form-content">
                <form action="../adminLogin" method = "post">
                
                <header> Admin Login</header>
                    
         
                
                    <div class="input-field">
                    	<i class="fa fa-solid fa-envelope" style="color: #2f2e41;"></i>
                        <input class="inputs" type="email" placeholder="Email" class="input" name="email" required />
                    </div>
                    

                    <div class="input-field">
                    	<i class="fa-solid fa-lock" style="color: #2f2e41;"></i>
                        <input class="inputs" type="Password" placeholder="Password" class="Password" name="password" required />
                        
                    </div>

                    <div class="button-field">
                        <button class="button"   type="submit">Log in</button>
                    </div>
                    
                    <div class="form-link">
                          <span><a href="FirstPage.jsp" class="signup-link">Back</a></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
		
		
		var status = document.getElementById("loggedin").value;
		console.log(status);
		if(status == null){
			Swal.fire({
	            title: "Please fill all the fields",
	            icon: "error",
	            confirmButtonText: "OK",
	        }).then(function() {
	            window.location.href = "${pageContext.request.contextPath}/view/AdminLogin.jsp";
	        });;
		}
		else if(status == "failed"){
			Swal.fire({
	            title: "Please Check your Login Credentials",
	            icon: "error",
	            confirmButtonText: "OK",
	        }).then(function() {
	            window.location.href = "${pageContext.request.contextPath}/view/AdminLogin.jsp";
	        });;
		}
		else if(status == "success") {
			Swal.fire("Login Successful","success");
		}
	</script>
	
</body>
</html>