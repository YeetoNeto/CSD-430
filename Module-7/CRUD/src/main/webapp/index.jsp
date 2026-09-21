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
<a href="AddMovie.jsp">Want to add a movie? Click Me!</a>

<h1>A list of my some of my favorite movies</h1>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beanRead.ReadingBeans" %>
<%
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
 String selection = null;
%>
<form method="post">


<select id="movieSelect" name="movieSelect">

<% 
	for  (int i = 0; i < Id.length; i++) { 
%>
	<option value= "<%=Id[i]%>" > <%=Id[i]%> </option>
<%
    }
%>
</select>
<input type="submit" value="Select">
</form>
<%
selection = request.getParameter("movieSelect");

if (selection != null) {
    int select = Integer.parseInt(selection)-1;

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
		    <td><%= select + 1 %></td>
			<td><%= Movie[select] %></td>
			<td><%= Genre[select] %></td>
			<td><%= Year[select] %></td>
			<td><%= Tomatometer[select] + "%" %></td>
		</tr>

<% 
}
%>		
	
</table>
</body>
</html>