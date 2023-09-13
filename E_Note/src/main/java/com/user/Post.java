package com.user;

import java.util.Date;

public class Post {
	private int id;
	private String title;
	private String content;
	private Date date;
	private int uid;
	public Post(int id, String title, String content, Date date, int uid) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.uid = uid;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
		
}
