
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
                

                <form action="registration" method = "get">
                <header>Sign up</header>
                
                	<div class="field input-field">
                        <input type="text" placeholder="Username" class="input" name="username" />
                    </div>
                
                    <div class="field input-field">
                        <input type="email" placeholder="Email" class="input" name="email" />
                    </div>
                    

                    <div class="field input-field">
                        <input type="Password" placeholder="Create a password" class="Password" name="password"/>
                        
                    </div>

                    <div class="field button-field">
                        <button type="submit">Sign up</button>
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