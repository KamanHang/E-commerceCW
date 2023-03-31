<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="signup.css">
</head>
<body>
<div class="container forms">
        <div class="form signup">
            <div class="form-content">
                

                <form action="#">
                <header>Signup</header>
                    <div class="field input-field">
                        <input type="email" placeholder="Email" class="input"/>
                    </div>

                    <div class="field input-field">
                        <input type="Password" placeholder=" Create Password" class="Password"/>
                        
                    </div>

                    <div class="field input-field">
                        <input type="Password" placeholder=" Confirm Password" class="Password"/>
                       
                    </div>

                    <div class="field button-field">
                        <button>Signup</button>
                    </div>

                    <div class="form-link">
                          <span>Already have an account ? <a href="/login" class="signup-link">Login</a></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>