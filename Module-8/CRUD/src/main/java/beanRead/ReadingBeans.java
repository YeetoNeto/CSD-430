
package beanRead;

import beanMain.beanMain;
import java.util.ArrayList;
import movieBeans.movieBeans;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.Serializable;

public class ReadingBeans implements java.io.Serializable {
	private Integer id;
	private String movie;
	private String genre;
	private Integer year;
	private Integer tomato;

	public ReadingBeans(int id, String movie, String genre, int year, int tomato) {
		this.id = id;
		this.movie = movie;
		this.genre = genre;
		this.year = year;
		this.tomato = tomato;
		
	}
	
	public Integer getMovieId() {
		return this.id;
	}
	public String getMovie() {
		return this.movie;
			
	}
	public String getGenre() {
		return this.genre;

	}
	public Integer getYear() {
		return this.year;
		
	}
	
	public Integer getTomato() {
		return this.tomato;
	}
	

}

