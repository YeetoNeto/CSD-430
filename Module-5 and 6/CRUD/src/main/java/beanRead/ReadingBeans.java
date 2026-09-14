
package beanRead;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.Serializable;

public class ReadingBeans implements java.io.Serializable {
	private Integer[] id;
	private String[] movie;
	private String[] genre;
	private Integer[] year;
	private Integer[] tomato;
	private String url;
	private String username;
	private String password;

	public ReadingBeans() {
		this.url = "jdbc:mysql://localhost:3306/csd430";
		this.username = "student1";
		this.password = "pass";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(this.url, this.username, this.password);
			java.sql.Statement stmt = conn.createStatement();
			java.sql.ResultSet rs = stmt.executeQuery("SELECT Max(MovieID) FROM Noah_movies_data");
			int count = 0;
			while (rs.next()) {
				count = rs.getInt(1);
			}
			this.id = new Integer[count];
			this.movie = new String[count];
			this.genre = new String[count];
			this.year = new Integer[count];
			this.tomato = new Integer[count];
			int i = 0;
			java.sql.ResultSet rs2 = stmt.executeQuery("SELECT * FROM Noah_movies_data");
			while (rs2.next()) {
				this.id[i] = rs2.getInt("MovieID");
				this.movie[i] = rs2.getString("Title");
				this.genre[i] = rs2.getString("Genre");
				this.year[i] = rs2.getInt("Released");
				this.tomato[i] = rs2.getInt("Tomatoes");
				i++;
			}
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Integer[] getMovieId() {
		return this.id;
	}
	public String[] getMovie() {
		return this.movie;
			
	}
	public String[] getGenre() {
		return this.genre;

	}
	public Integer[] getYear() {
		return this.year;
		
	}
	
	public Integer[] getTomato() {
		return this.tomato;
	}

}

