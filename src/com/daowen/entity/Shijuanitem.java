package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Shijuanitem {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private int shijuanid;

	public int getShijuanid() {
		return shijuanid;
	}

	public void setShijuanid(int shijuanid) {
		this.shijuanid = shijuanid;
	}

	private int tihao;

	public int getTihao() {
		return tihao;
	}

	public void setTihao(int tihao) {
		this.tihao = tihao;
	}

	
	private String tixing;

	public String getTixing() {
		return tixing;
	}

	public void setTixing(String tixing) {
		this.tixing = tixing;
	}

	private int fenshu;

	public int getFenshu() {
		return fenshu;
	}

	public void setFenshu(int fenshu) {
		this.fenshu = fenshu;
	}
}
