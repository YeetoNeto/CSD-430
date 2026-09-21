package beanMain;

import beanRead.ReadingBeans;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.sql.ResultSet;
import java.io.Serializable;
public class beanMain {
	private ArrayList<ReadingBeans> movieData;
	
	public beanMain() {
		movieData = new ArrayList<>();
		String url = "jdbc:mysql://localhost:3306/csd430";
		String username = "student1";
		String password = "pass";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,username, password);
			java.sql.Statement stmt = conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM Noah_movies_data");
			while (rs.next()) {
				ReadingBeans readingBean = new ReadingBeans(rs.getInt("MovieID"), rs.getString("Title"), rs.getString("Genre"), rs.getInt("Released"), rs.getInt("Tomatoes"));
				movieData.add(readingBean);
			}
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
		
	public ArrayList<ReadingBeans> getMovieData() {
	        return movieData;
	}
		
}

