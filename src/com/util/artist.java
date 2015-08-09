package com.util;

public class artist {

	public int artist_id; // int primary key auto_increment,
	public String name; // varchar(30) not null,
	public int birth_year; // int not null,
	public String country; // varchar(30) default null,
	public String description; // text default null

	public artist(int id, String name) {
		// TODO Auto-generated constructor stub
		this.artist_id = id;
		this.name = name;
	}

	public artist() {

	}
	
	public artist(int id, String name, int birth, String count, String desc) {
		// TODO Auto-generated constructor stub
		this.artist_id = id;
		this.name = name;
		this.birth_year = birth;
		this.country = count;
		this.description = desc;
	}
}
