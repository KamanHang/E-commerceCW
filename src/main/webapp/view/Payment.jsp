<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Checkout</title>
   <style>
   			/* Target the overall layout of the page */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }
  
  /* Style the checkout container */
  .checkout {
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    background-color: #f2f2f2;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  /* Style the heading */
  h2 {
    font-size: 24px;
    margin-bottom: 20px;
    text-align: center;
  }
  
  /* Style the delivery address section */
  .delivery {
    margin-bottom: 30px;
  }
  
  .delivery h3 {
    font-size: 20px;
    margin-bottom: 10px;
    text-align: center;
  }
  
  /* Style the form elements */
  .form-group {
    margin-bottom: 15px;
  }
  
  label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
  }
  
  input[type="text"],
  textarea {
    width: 90%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="number"],
  textarea {
    width: 90%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  /* Style the payment method section */
  .payment {
    margin-bottom: 30px;
  }
  
  .payment h3 {
    font-size: 20px;
    margin-bottom: 10px;
    text-align: center;
  }
  
  /* Style the submit button */
  .submit-button {
    display: block;
    width: 20%;
    padding: 10px;
    margin-top: 20px;
    margin-left: 13rem;
    background-color: black;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  /* Style the link */
  a {
    display: block;
    text-align: center;
    margin-top: 20px;
  }
  .submit-button:hover {
	background-color: orange;
}

.continue-btn{
	text-decoration:none;
}
  
  
   </style>
  
</head>
<body>
  <!-- <h1>Checkout</h1> -->
  
  <div class="checkout">
    <h2>Checkout</h2>
    <form>
    <div class="delivery">
      <h3>Delivery Address</h3>
      <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" id="name" required>
      </div>
      <div class="form-group">
        <label for="name">Phone Number</label>
        <input type="text" id="phonenumber" required>
      </div>
      <div class="form-group">
        <label for="address">Address</label>
        <textarea id="address" required></textarea>
      </div>
    </div>
      <div class="payment">
      <h3>Payment Method</h3>
      <div class="payOpt">
        <div class="form-group">
            <label>
            <input type="radio" name="payment" value="khalti" required>
            Khalti
            </label>
        </div>
        <div class="form-group">
            <label>
            <input type="radio" name="payment" value="esewa" required>
            eSewa
            </label>
        </div>
</div>
    </div>
      <button type="submit" class="submit-button">Place Order</button>
      <a href="${pageContext.request.contextPath}/view/HomePage.jsp"  class="continue-btn">Continue Shopping</a>
    </form>
  </div>
  
  <!-- <button>Place Order</button>
  
  <a href="index.html">Continue Shopping</a>
   -->
  <script>
  const form = document.querySelector('form');
  const inputs = form.querySelectorAll('input, select');

  function showSuccessPopup() {
    // Display a success message popup
    alert('Payment successful!');
  }

  function handleSubmit(event) {
    event.preventDefault();

    // Check if all fields are filled
    let allFieldsFilled = true;
    for (let i = 0; i < inputs.length; i++) {
      if (!inputs[i].value) {
        allFieldsFilled = false;
        break;
      }
    }

    if (allFieldsFilled) {
      // Simulate payment processing delay
      setTimeout(() => {
        showSuccessPopup();
      }, 2000);
    } else {
      // Display error message
      alert('Please fill all fields');
    }
  }

  form.addEventListener('submit', handleSubmit);

  // Add event listeners to the payment options
  const khaltiBtn = document.getElementById('khalti');
  const esewaBtn = document.getElementById('esewa');

  khaltiBtn.addEventListener('click', () => {
    alert('Khalti payment processing...');
  });

  esewaBtn.addEventListener('click', () => {
    alert('eSewa payment processing...');
  });

  </script>
</body>
</html>
