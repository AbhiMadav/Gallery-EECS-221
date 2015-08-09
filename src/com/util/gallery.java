package com.util;
public class gallery {

	public int gallery_id; // int not null primary key auto_increment,
	public String name; // varchar(30) default null,
	public String description; // text default null
	
	public gallery()
	{
		
	}

	public gallery(int gallery_id, String name, String description) {
		// TODO Auto-generated constructor stub
		this.gallery_id = gallery_id;
		this.name = name;
		this.description = description;
	}
}