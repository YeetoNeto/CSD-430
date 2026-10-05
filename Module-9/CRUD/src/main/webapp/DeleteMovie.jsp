<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dataBean" class="beanMain.beanMain" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Delete Movies</title>
</head>
<body>

<h1>Remove a Movie</h1>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beanRead.ReadingBeans" %>
<%
 ArrayList<ReadingBeans> movieData = dataBean.getMovieData();
 String movieSelect = null;
 String selection = null;
 Integer Id = null;
 String Movie = null;
 String Genre = null;
 Integer Year = null;
 Integer Tomatometer = null;
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
<table>
<thead>
<tr>
<th>Id</th>
<th>Movie</th>
<th>Genre</th>
<th>Year</th>
<th>Tomatometer</th>
</thead>
<tbody>
<% 
if(movieData.isEmpty()) {

}
else {
	for( int i = 0; i < movieData.size(); i++) {
		Id = movieData.get(i).getMovieId();
		Movie = movieData.get(i).getMovie();
		Genre = movieData.get(i).getGenre();
		Year = movieData.get(i).getYear();
		Tomatometer = movieData.get(i).getTomato();
	
%>
		<tr>
		    <td><%= Id %></td>
			<td><%= Movie %></td>
			<td><%= Genre %></td>
			<td><%= Year %></td>
			<td><%= Tomatometer + "%" %></td>
		</tr>
<%
}
}	
%>
</tbody>
</table>
<%
selection = request.getParameter("movieSelect");

if (selection != null) {
    int select = Integer.parseInt(selection);
    for( int i = 0; i < movieData.size(); i++) {
		if (movieData.get(i).getMovieId() == select) {
           movieData.remove(i);
           break;
		}
    }
    dataBean.deleteMovieData(select);
response.sendRedirect("DeleteMovie.jsp"); //refreshes page to show updated list
}
%>
	

<br><br><br>
<a href="index.jsp">Want to go back? Click Me!</a>
</body>
</html>