<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dataBean" class="beanMain.beanMain" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Edit Movies</title>
</head>
<body>
<h1>Edit a movie in the list!</h1>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beanRead.ReadingBeans" %>
<%
ArrayList<ReadingBeans> movieData = dataBean.getMovieData();
String Movie = null;
String Genre = null;
Integer Year = null;
Integer Tomatometer = null;
%>
<form method="post">

<select name="idUpdate" id="movieID"  required>
<% for (int i = 0; i < movieData.size(); i++) {%>
 <option value="<%= movieData.get(i).getMovieId() %>"><%= movieData.get(i).getMovieId()  %></option>
 <%
}
 %>
</select>
<input type="text" name="movieUpdate" id="movie" maxlength="250" placeholder="Movie Name" required>
<input type="text" name="genreUpdate" id="genre"  maxlength="250" placeholder="Genre" required>
<select name="yearUpdate" id="year"  required>
<% for (int year = 2026; year >= 1888; year--) {%>
 <option value="<%= year %>"><%= year %></option>
 <%
}
 %>
</select>
<select name="tomatoUpdate" id="tomato"  required>
<% for (int rating = 100; rating >= 0; rating--) {%>
 <option value="<%= rating %>"><%= rating + "%" %></option>
 <%
}
 %>
</select>

<input type="submit" value="Update Selection">
</form>
<%
if (request.getParameter("idUpdate") != null ) {
	Integer idSubmit =  Integer.parseInt(request.getParameter("idUpdate"));
	String movieSubmit = request.getParameter("movieUpdate");
	String genreSubmit = request.getParameter("genreUpdate");
	String yearSubmit = request.getParameter("yearUpdate");
	String tomatoSubmit = request.getParameter("tomatoUpdate");

	if (movieSubmit != null && genreSubmit != null && yearSubmit != null && tomatoSubmit != null) {
    	dataBean.updateMovieData(Integer.parseInt(request.getParameter("idUpdate")), request.getParameter("movieUpdate"), request.getParameter("genreUpdate"), Integer.parseInt(request.getParameter("yearUpdate")), Integer.parseInt(request.getParameter("tomatoUpdate")));
    	
    	for( int i = 0; i < movieData.size(); i++) {
    		if (movieData.get(i).getMovieId() == idSubmit) {
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
		    <td><%= idSubmit %></td>
			<td><%= Movie %></td>
			<td><%= Genre %></td>
			<td><%= Year %></td>
			<td><%= Tomatometer + "%" %></td>
		</tr>	
	
</table>
<%
 }
}
%>
<br><br><br>
<a href="index.jsp">Want to go back? Click Me!</a>
</body>
</html>