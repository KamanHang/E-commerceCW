<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Login.css">
</head>
<body>

<div class="container forms">
          <div class="form login">
              <div class="form-content">
                  

                  <form action="#">
                  <header>Login</header>
                      <div class="field input-field">
                        <input type="email" placeholder="Email" class="input" name="email" />
                    </div>
                    

                    <div class="field input-field">
                        <input type="Password" placeholder="Enter your password" class="Password" name="password"/>
                        
                    </div>

                      <div class="field button-field">
                          <button>Login</button>
                      </div>

                      <div class="form-link">
                            <span>Don't have an account ? <a href="signup.jsp" class="signup-link">Sign up</a></span>
                      </div>
                  </form>
              </div>
          </div>
      </div>

</body>
</html>