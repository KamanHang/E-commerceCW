<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@page import="java.util.Date" %>  
<!DOCTYPE html>
<html>
<head>
	<title>Add to Cart Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
	
		* {
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table th, table td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
}

table th {
	background-color: #f2f2f2;
}

table td input[type="number"] {
	width: 50px;
	padding: 5px;
}

table td img {
	max-width: 100%;
	height: auto;
}

.total-items, .total-amount {
	font-weight: bold;
}

.buttons {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
}

.buttons button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: black;
	color: #fff;
	cursor: pointer;
	margin-top: 20px;
  font-size: 15px;
}

.buttons button:hover {
	background-color: orange;
}
img {
  width: 100px;
  height: 100px;
  margin: 0 0 0 0;
  object-fit: cover;
}
.checkout-btn{
  /* outline: none;
  border: none; */
  padding: 10px 25px;
  border-radius: 10px;
  font-size: 15px;
  margin: 0 0 0 28rem;
  cursor: pointer;
}
.delete-btn{
background-color: red;
    outline: none;
    border: none;
    border-radius: 5px;
    width: 101%;
    height: 2rem;
    color: white;
    
    
}

input{
	text-align: center;
}
.continue-btn{
	 padding: 10px 25px;
  border-radius: 5px;
  background-color: black;;
  color:white;
   margin: 1rem 0 0 1rem;
   text-decoration: none;
}
		
</style>
</head>
<body>
	<div class="container">
	<h1>Add to Cart</h1>
	<c:set var="time" value="<%=new Date().getTime()%>"/>
	<table border="1" class="table">
		<tr>
			<th>Product Name</th>
			<th>Product Image</th>
			<th>Product Brand</th>
			<th>Product Price (in $.)</th>
			<th>Quantity</th>
			<th>Total Price (in $.)</th>
			<th>Actions</th>
		</tr>
		<tr>
			<td> ${product.productName}</td>
			<td><img src="images/${product.productImage}?v=${time}" height="200px" width="200px"></td>
			<td>${product.productBrand}</td>
			<td id="product-price">${product.productPrice}</td>
			<td>
				<input type="number" min="1" max="10" value="1" class="quantity-field" id="quantity">

			</td>
			<td  id="total-price">${product.productPrice}</td>
			<td>
				<button onclick="" class="delete-btn">Delete</button>
			</td>
		</tr>
	</table>
		
		
		
		
		
	<div class="buttons">
		<a href="${pageContext.request.contextPath}/view/Payment.jsp"  class="continue-btn">Check Out</a>
		<a href="${pageContext.request.contextPath}/view/HomePage.jsp"  class="continue-btn">Continue Shopping</a>
	</div>
</div>

<script>
	const quantityInput = document.getElementById("quantity");
	quantityInput.addEventListener("change", updateTotalPrice);
	function updateTotalPrice() {
		  const quantity = quantityInput.value;
		  const productPrice = document.getElementById("product-price").textContent;
		  const totalPrice = quantity * productPrice;
		  document.getElementById("total-price").textContent = totalPrice;
		}

</script>

<script>
	const minusBtn = document.querySelector(".minus-btn");
	const plusBtn = document.querySelector(".plus-btn");
	const quantityField = document.querySelector(".quantity-field");

	minusBtn.addEventListener("click", () => {
		if (quantityField.value > 1) {
			quantityField.value = parseInt(quantityField.value) - 1;
		}
	});

	plusBtn.addEventListener("click", () => {
		if (quantityField.value < 10) {
			quantityField.value = parseInt(quantityField.value) + 1;
		}
	});
</script>


<script>
const deleteBtns = document.querySelectorAll(".delete-btn");

deleteBtns.forEach((deleteBtn) => {
	deleteBtn.addEventListener("click", () => {
		const row = deleteBtn.parentNode.parentNode;
		row.parentNode.removeChild(row);
	});
});
</script>


	
	
	
	
</body>
</html>
