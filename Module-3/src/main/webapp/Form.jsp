<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="style.css">
<head>
<meta charset="UTF-8">
<title>Customer Survey</title>
</head>
<body>
<!-- This uses dependency injection to send the parameters from the this (form) page and display them on the results page. -->
	<form action="Result.jsp" method="post">
		<label for="Satisfaction">How would you rate your experience today?</label><br>
		<input type="radio" name="Satisfaction" value="5" required > 5-The experience was great, no additional notes. <br>
		<input type="radio" name="Satisfaction" value="4" required > 4-The experience was good, light notes.<br>
		<input type="radio" name="Satisfaction" value="3" required > 3-The experience was okay, some notes.<br>
		<input type="radio" name="Satisfaction" value="2" required > 2-The experience was poor, more notes than there should be.<br>
		<input type="radio" name="Satisfaction" value="1" required > 1-The experience was terrible, nothing but notes.<br><br>
		
		<label for="date">When did you visit?</label>
		<input type="date" name="date" required><br><br>
		
		<label for="Cleanliness">How would you rate the cleanliness of the restaurant?</label><br>
		<input type="radio" name="Cleanliness" value="5" required > 5-The store was exceptionally clean. <br>
		<input type="radio" name="Cleanliness" value="4" required > 4-The store was noticeable clean.<br>
		<input type="radio" name="Cleanliness" value="3" required > 3-The store was clean enough for me.<br>
		<input type="radio" name="Cleanliness" value="2" required > 2-The store was noticeably dirty<br>
		<input type="radio" name="Cleanliness" value="1" required > 1-The store should be closed down to poor cleanliness standards<br><br>
		
		<label for="Food">How would you rank the quality of your food?</label><br>
		<input type="radio" name="Food" value="5" required > 5- You guys should go for a michelin! <br>
		<input type="radio" name="Food" value="4" required > 4- The food was gas!<br>
		<input type="radio" name="Food" value="3" required > 3- The food was good.<br>
		<input type="radio" name="Food" value="2" required > 2- The food was sub-par.<br>
		<input type="radio" name="Food" value="1" required > 1- The food was terrible. Do y'all know how to cook?<br><br>
		
		<label for="feedback">Any additional feedback?</label><br>
		<textarea name="feedback" rows="4" cols="50" placeholder="Feel free to shout out an employee!"></textarea><br><br>
		
		<input type="submit" value="Submit">
	</form>
</body>
</html>