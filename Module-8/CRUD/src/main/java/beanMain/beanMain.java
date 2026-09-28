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
			conn.close();
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
		
	public ArrayList<ReadingBeans> getMovieData() {
	        return movieData;
	}
	
	public void setMovieData(String movie, String genre, int year, int tomato) {
		String url = "jdbc:mysql://localhost:3306/csd430";
		String username = "student1";
		String password = "pass";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,username, password);
			java.sql.PreparedStatement stmt = conn.prepareStatement("INSERT INTO Noah_movies_data (Title, Genre, Released, Tomatoes) VALUES (?, ?, ?, ?)");
			stmt.setString(1, movie);
			stmt.setString(2, genre);
			stmt.setInt(3, year);
			stmt.setInt(4, tomato);
			if (stmt.executeUpdate() > 0) { // execute returns int so check if greater than 0 to confirm update was successful
				movieData.add(new ReadingBeans(movieData.size() + 1, movie, genre, year, tomato));
			}
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateMovieData(int id, String movie, String genre, int year, int tomato) {
		String url = "jdbc:mysql://localhost:3306/csd430";
		String username = "student1";
		String password = "pass";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,username, password);
			java.sql.PreparedStatement stmt = conn.prepareStatement("UPDATE Noah_movies_data SET Title=?, Genre=?, Released=?, Tomatoes=? WHERE MovieID=?");
			stmt.setString(1, movie);
			stmt.setString(2, genre);
			stmt.setInt(3, year);
			stmt.setInt(4, tomato);
			stmt.setInt(5, id);
			if (stmt.executeUpdate() > 0) {
				for (ReadingBeans rb : movieData) {
					if (rb.getMovieId() == id) {
						movieData.set(id-1, new ReadingBeans(id, movie, genre, year, tomato));
						break;
					}
				}
			}
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
}

