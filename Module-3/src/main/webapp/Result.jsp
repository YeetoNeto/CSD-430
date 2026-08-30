<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="style.css">
<head>
<meta charset="UTF-8">
<title>Survey Submitted</title>
</head>
<body class="results">
<!-- This uses dependency injection to get the request parameters from the form page and display them on the this(results) page. -->
<%
	String feedback;
    if (request.getParameter("feedback") == null || request.getParameter("feedback").trim().isEmpty()) {
		feedback = "No additional feedback provided.";
	} else {
		feedback = request.getParameter("feedback");
	}
%>
<h1>Customer Survey Results</h1>
<p>Satisfaction <%= request.getParameter("Satisfaction") %></p>
<p>Date: <%= request.getParameter("date") %></p>
<p>Cleanliness: <%= request.getParameter("Cleanliness") %></p>
<p>Food: <%= request.getParameter("Food") %></p>
<p>Feedback: <%=feedback%></p>

</body>
</html>