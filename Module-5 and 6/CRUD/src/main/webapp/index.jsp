<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dataBean" class="beanRead.ReadingBeans" scope="session" />
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Favorite Movies</title>
</head>
<body>
<h1>A list of my some of my favorite movies</h1>
<%
 Integer[] Id = dataBean.getMovieId();
 String[] movies = dataBean.getMovie();
 String[] genre = dataBean.getGenre();
 Integer[] year =  dataBean.getYear();
 Integer[] tomatometer = dataBean.getTomato();
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
			<td><%= movies[select] %></td>
			<td><%= genre[select] %></td>
			<td><%= year[select] %></td>
			<td><%= tomatometer[select] + "%" %></td>
		</tr>

<% 
}
%>		
	
</table>
</body>
</html>