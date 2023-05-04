<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Log in</title>
<link rel="stylesheet" href="css/Login.css">
<script src="https://kit.fontawesome.com/fec65740f4.js" crossorigin="anonymous"></script>
</head>
<body>


<div class="container">
	<img class="logoImg" src="./img/logo.png" alt="img" />
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
                          <span>New Customer? <a href="Signup.jsp" class="signup-link">Sign Up</a></span>
                    </div>
                </form>
            </div>
        </div>
      </div>

</body>
</html>