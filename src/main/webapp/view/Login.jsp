<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Log in</title>
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
.logoImg{
	position: absolute;
	height: 20vh;
	left: 600px;
  top: 80px;
  right: 20px;
  transform: translateY(-50%);
}
.form{
    background: white;
    max-width: 400px;
    width: 100%;
    border-radius: 10px;
    padding: 30px;
    height: 400px;
    border-color: black;
    border-style:solid;
    margin-right: 10rem;
    margin-bottom: 5rem;
    margin-left: 1.5rem;
    margin-top: 4rem;
    box-shadow:  grey 0px 10px 20px -10px;
    border-width:medium;
    
}
header{
    font-size: 28px;
    font-weight: 600;
    color: #2f2e41;
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
    margin-top: 20px;
    height: 3rem;
    width: 40%;
    margin-left: 6.8rem
}

.form-link{
    text-align: center;
    margin-top: 2rem;
    color: #2f2e41;
   
}
.form-link a{
    font-size: 14px;
    font-weight: 400;
    color: #232836;
    
}
.form a{
    color: #0171d3;
    text-decoration: none;
}

.loginImg{
    width: 50%;
}

.button:hover{
    background-color: #FFA500;
    color: white;
    cursor: pointer;
}
.signup-link:hover{
    text-decoration: none;
    color:#FFA500;
    
}

.slider-frame{
    overflow: hidden;
    height: 500px;
    width: 1200px;
    margin-left: 10rem;
    margin-top: 3rem;
}

/*---------- SLIDE ANIMATION --------------*/


@keyframes slide_animation{
    0% {left:0px;}
    10% {left:0px;}
    20% {left:1200px;}
    30% {left:1200px;}
    40% {left: 2400px;}
    50% {left: 2400px;}
    60% {left: 1200px;}
    70% {left: 1200px;}
    80% {left: 0px;}
    90% {left: 0px;}
    100% {left:0px;}
}

@-webkit-keyframes slide_animation{
    0% {left:0px;}
    10% {left:0px;}
    20% {left:1200px;}
    30% {left:1200px;}
    40% {left: 2400px;}
    50% {left: 2400px;}
    60% {left: 1200px;}
    70% {left: 1200px;}
    80% {left: 0px;}
    90% {left: 0px;}
    100% {left:0px;}
}

.slide-img{
    width: 3600px;
    height: 800px;
    margin: 0 0 0 -2400px;
    position: relative;
    -webkit-animation-name: slide_animation;
    animation-name: slide_animation;
    -webkit-animation-duration: 30s;
    animation-duration: 15s;
    -webkit-animation-iteration-count: infinite;
    animation-iteration-count: infinite;
    -webkit-animation-direction: alternate;
    animation-direction: alternate;
    -webkit-animation-play-state: running;
    animation-play-state: running;
}

.img-container{
    height: 800px;
    width: 1200px;
    position: relative;
    float: left;
}
</style>
<link rel="stylesheet" href="fonts-6/css/all.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
	
	<input type="hidden" id="loggedin" value="<%= request.getAttribute("status") %>">

<div class="container">
	<img class="logoImg" src="img/logo.png" alt="img" />
        <div class="slider-frame">
            <div class="slide-img">
                <div class="img-container">
                    <img class="loginImg" src="./img/1.png" alt="img" />
                </div>
                <div class="img-container">
                    <img class="loginImg" src="./img/2.png" alt="img" />
                </div>
                <div class="img-container">
                    <img class="loginImg" src="./img/3.png" alt="img" />
                </div>
                <div class="img-container">
                    <img class="loginImg" src="./img/4.png" alt="img" />
                </div>
            </div>
        </div>
        <div class="form">
            <div class="form-content">
                <form action="../login" method = "post">
                <header>Welcome</header>
                    
                    <div class="input-field">
                    	<i class="fa-solid fa-user" style="color: #2f2e41;"></i>
                        <input class="inputs" type="email" placeholder="Enter your Email" class="input" name="email" required />
                    </div>
                    

                    <div class="input-field">
                    	<i class="fa-solid fa-lock" style="color: #2f2e41;"></i>
                        <input class="inputs" type="Password" placeholder="Enter your Password" class="Password" name="password" required/>
                        
                    </div>

                    <div class="button-field">
                        <button class="button"   type="submit">Log in</button>
                    </div>

                    <div class="form-link">
                          <span>New Customer? <a href="Signup.jsp" class="signup-link">SignUp</a></span>
                    </div>
                </form>
            </div>
        </div>
      </div>
      
	<script type="text/javascript">
		

		var status = document.getElementById("loggedin").value;
		console.log(status);
		
		
		if(status == "loginError"){
			Swal.fire({
	            title: "Invalid Credentials",
	            icon: "error",
	            confirmButtonText: "OK",
	        }).then(function() {
	           window.location.href = "${pageContext.request.contextPath}/view/Login.jsp";
	       });;
		}
	</script>
</body>
</html>