<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/Signup.css">
<script src="https://kit.fontawesome.com/fec65740f4.js" crossorigin="anonymous"></script>
<title>Sign Up</title>
</head>
<body>

	<div class="container">
        <div class="form">
            <div class="form-content">
                <form action="../registration" method = "post">
                <header>Sign up</header>
                    
                	<div class="input-field">
                		<i class="fa-solid fa-user" style="color: #2f2e41;"></i>
                        <input class="inputs" type="text" placeholder="Username" class="input" name="username" required />
                    </div>
                
                    <div class="input-field">
                    	<i class="fa-solid fa-envelope" style="color: #2f2e41;"></i>
                        <input class="inputs" type="email" placeholder="Email" class="input" name="email" required />
                    </div>
                    

                    <div class="input-field">
                    	<i class="fa-solid fa-lock" style="color: #2f2e41;"></i>
                        <input class="inputs" type="Password" placeholder="Create a password" class="Password" name="password" required />
                        
                    </div>

                    <div class="button-field">
                        <button class="button"   type="submit">Sign up</button>
                    </div>

                    <div class="form-link">
                          <span>Already have an account ? <a href="Login.jsp" class="signup-link">Login</a></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
	
</body>
</html>