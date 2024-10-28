package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Topic {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String pubren;

	public String getPubren() {
		return pubren;
	}

	public void setPubren(String pubren) {
		this.pubren = pubren;
	}

	private Date pubtime;

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	private int bkid;

	public int getBkid() {
		return bkid;
	}

	public void setBkid(int bkid) {
		this.bkid = bkid;
	}

	private String bkname;

	public String getBkname() {
		return bkname;
	}

	public void setBkname(String bkname) {
		this.bkname = bkname;
	}

	private int clickcount;

	public int getClickcount() {
		return clickcount;
	}

	public void setClickcount(int clickcount) {
		this.clickcount = clickcount;
	}

	private int istopic;

	public int getIstopic() {
		return istopic;
	}

	public void setIstopic(int istopic) {
		this.istopic = istopic;
	}

	private String lastreplyor;

	public String getLastreplyor() {
		return lastreplyor;
	}

	public void setLastreplyor(String lastreplyor) {
		this.lastreplyor = lastreplyor;
	}

	private Date lastreplytime;

	public Date getLastreplytime() {
		return lastreplytime;
	}

	public void setLastreplytime(Date lastreplytime) {
		this.lastreplytime = lastreplytime;
	}

	private int replycount;

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	private int replyid;

	public int getReplyid() {
		return replyid;
	}

	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}

	private String dcontent;

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	
	private String tupian;

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	private int fee;

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}
}
