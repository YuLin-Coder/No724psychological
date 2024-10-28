package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Shijuan {
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

	private String zujuanren;

	public String getZujuanren() {
		return zujuanren;
	}

	public void setZujuanren(String zujuanren) {
		this.zujuanren = zujuanren;
	}

	private int zongfen;

	public int getZongfen() {
		return zongfen;
	}

	public void setZongfen(int zongfen) {
		this.zongfen = zongfen;
	}

	private String kemu;
	
	private int kmid;

	public int getKmid() {
		return kmid;
	}

	public void setKmid(int kmid) {
		this.kmid = kmid;
	}

	public String getKemu() {
		return kemu;
	}

	public void setKemu(String kemu) {
		this.kemu = kemu;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	private String tupian;

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}
}
