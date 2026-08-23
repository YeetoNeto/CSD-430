<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--  This Assignment uses Apache Tomcat and JSP Scriplets to use Java code with HTML -->


<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Favorite Movies</title>
</head>
<body>
<h1>A list of my some of my favorite movies</h1>
<%
// Create a 2D array to store movie information
String[][] movies = {
		{"The Odyssey", "Epic", "2026"},
		{"Interstellar", "Science Fiction/Drama", "2014"},
		{"Inception", "Science Fiction/Thriller", "2010"},
		{"Dune", "Science Fiction/Adventure", "2021"},
		{"The Hunger Games", "Science Fiction/Action", "2012"},
		{"The Avengers: Endgame","Super Herp/Action", "2019"},
		{"Project: Hail Mary","Science Fiction/Adventure", "2026"}
		};
%>
<table>
<tr>
<th>Movies</th>
<th>Genre</th>
<th>Year</th>
</tr>
		<!--  Assign the Array to rows -->
	<% for (int i = 0; i< movies.length; i++) { %>
		<tr>
			<td><%= movies[i][0] %></td>
			<td><%= movies[i][1] %></td>
			<td><%= movies[i][2] %></td>
		</tr>
		<% } %>
		
	
</table>
</body>
</html>