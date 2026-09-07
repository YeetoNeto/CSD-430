<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- get bean -->
<jsp:useBean id="dataBean" class="com.example.beanData.beanData" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Favorite Movies</title>
</head>
<body>
<h1>A list of my some of my favorite movies</h1>
<%
 // Get array data from bean
 String[] movies = dataBean.getMovie();
 String[] genre = dataBean.getGenre();
 String[] year =  dataBean.getYear();
%>
<table>
<tr>
<th>Movies</th>
<th>Genre</th>
<th>Year</th>
</tr>
		<!--  Assign the Arrays to rows -->
	<% for (int i = 0; i< movies.length; i++) { %>
		<tr>
			<td><%= movies[i] %></td>
			<td><%= genre[i] %></td>
			<td><%= year[i] %></td>
		</tr>
		<% } %>
		
	
</table>
</body>
</html>