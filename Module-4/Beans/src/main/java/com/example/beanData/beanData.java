
package com.example.beanData;

public class beanData implements java.io.Serializable {
	private String[] movie;
	private String[] genre;
	private String[] year;

	public beanData() {
		 // default constructor fills arrays with data
		this.movie = new String[] {"The Odyssey","Interstellar","Inception","Dune","The Hunger Games", "The Avengers: Endgame", "Project: Hail Mary"};
		this.genre = new String[] {"Epic", "Science Fiction/ Drama", "Science Fiction/ Thriller", "Science Fiction/ Adventure", "Science Fiction/ Action", "Science Fiction/ Action", "Science Fiction/ Adventure"};
		this.year = new String[] {"2026", "2014", "2010", "2021", "2012", "2019", "2026"};
		
	}

	//getters for the arrays
	public String[] getMovie() {
		return this.movie;
			
	}
	public String[] getGenre() {
		return this.genre;

	}
	public String[] getYear() {
		return this.year;
		
	}

}


