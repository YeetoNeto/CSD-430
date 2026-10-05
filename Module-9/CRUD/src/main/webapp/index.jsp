<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dataBean" class="beanMain.beanMain" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Favorite Movies</title>
</head>
<body>

<h1>A list of my some of my favorite movies</h1>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beanRead.ReadingBeans" %>
<%
 ArrayList<ReadingBeans> movieData = dataBean.getMovieData();
 Integer Id = null;
 String Movie = null;
 String Genre = null;
 Integer Year = null;
 Integer Tomatometer = null;
 String selection = null;
%>
<form method="post">


<select id="movieSelect" name="movieSelect">

<% 
	for  (int i = 0; i < movieData.size(); i++) { 
%>
	<option value= "<%=movieData.get(i).getMovieId()%>" > <%=movieData.get(i).getMovieId()%> </option>
<%
    }
%>
</select>
<input type="submit" value="Select">
</form>
<%
selection = request.getParameter("movieSelect");

if (selection != null) {
    int select = Integer.parseInt(selection);
    for( int i = 0; i < movieData.size(); i++) {
		if (movieData.get(i).getMovieId() == select) {
			Id = movieData.get(i).getMovieId();
			Movie = movieData.get(i).getMovie();
			Genre = movieData.get(i).getGenre();
			Year = movieData.get(i).getYear();
			Tomatometer = movieData.get(i).getTomato();
			break;
		}
		}
%>
<table>
<tr>
<th>Id</th>
<th>Movie</th>
<th>Genre</th>
<th>Year</th>
<th>Tomatometer</th>
</tr>
		<tr>
		    <td><%= Id %></td>
			<td><%= Movie %></td>
			<td><%= Genre %></td>
			<td><%= Year %></td>
			<td><%= Tomatometer + "%" %></td>
		</tr>

<% 
}
%>
	
</table>

<br><br><br>
<a href="AddMovie.jsp">Want to add a movie? Click Me!</a> <br>
<a href="EditMovie.jsp">Want to edit a selection in the list? Click Me!</a> <br>
<a href="DeleteMovie.jsp">Want to remove a selection in the list? Click Me!</a>
</body>
</html>