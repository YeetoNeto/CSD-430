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
<div class="header">
	<a href="index.jsp">Want to go back? Click Me!</a>
</div>
<h1>Add Movies to the list!</h1>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beanRead.ReadingBeans" %>
<%
 String selection = null;
%>
<form method="post">
<input type="text" name="movieInsert" id="movie" maxlength="250" placeholder="Movie Name" required>
<input type="text" name="genreInsert" id="genre"  maxlength="250" placeholder="Genre" required>
<select name="yearInsert" id="year"  required>
<% for (int year = 2026; year >= 1888; year--) {%>
 <option value="<%= year %>"><%= year %></option>
 <%
}
 %>
</select>
<select name="tomatoInsert" id="tomato"  required>
<% for (int rating = 100; rating >= 0; rating--) {%>
 <option value="<%= rating %>"><%= rating + "%" %></option>
 <%
}
 %>
</select>

<input type="submit" value="Add Selection">
</form>
<%
String movieSubmit = request.getParameter("movieInsert");
String genreSubmit = request.getParameter("genreInsert");
String yearSubmit = request.getParameter("yearInsert");
String tomatoSubmit = request.getParameter("tomatoInsert");

if (movieSubmit != null && genreSubmit != null && yearSubmit != null && tomatoSubmit != null) {
    dataBean.setMovieData(request.getParameter("movieInsert"), request.getParameter("genreInsert"), Integer.parseInt(request.getParameter("yearInsert")), Integer.parseInt(request.getParameter("tomatoInsert")));
    ArrayList<ReadingBeans> movieData = dataBean.getMovieData();
    Integer[] Id = new Integer[movieData.size()];
    String[] Movie = new String[movieData.size()];
    String[] Genre = new String[movieData.size()];
    Integer[] Year = new Integer[movieData.size()];
    Integer[] Tomatometer = new Integer[movieData.size()];
    for (int i = 0; i < movieData.size(); i++) {
   	 Id[i] = movieData.get(i).getMovieId();
   	 Movie[i] = movieData.get(i).getMovie();
   	 Genre[i] = movieData.get(i).getGenre();
   	 Year[i] = movieData.get(i).getYear();
   	 Tomatometer[i] = movieData.get(i).getTomato();
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
<%
 for  (int i = 0; i < Id.length; i++) {
%>
		<tr>
		    <td><%= i + 1 %></td>
			<td><%= Movie[i] %></td>
			<td><%= Genre[i] %></td>
			<td><%= Year[i] %></td>
			<td><%= Tomatometer[i] + "%" %></td>
		</tr>

<% 
}
%>		
	
</table>
<%
}
%>
</body>
</html>