package com.util;

import java.awt.Image;

public class image {
	public int image_id; // int primary key auto_increment,
	public String title; // varchar(30),
	public String link; // text default null,
	public Image upload;
	public int gallery_id; // int,
	public int artist_id; // int,
	public int detail_id; // int,

	public image(int image_id, String title, String link, Image upload,
			int gal_id, int art_id, int det_id) {
		this.image_id = image_id;
		this.title = title;
		this.link = link;
		this.upload = upload;
		this.gallery_id = gal_id;
		this.artist_id = art_id;
		this.detail_id = det_id;
	}

	public image() {

	}
}