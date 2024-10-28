package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Dajuanitem {
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

	private int dajuanid;

	public int getDajuanid() {
		return dajuanid;
	}

	public void setDajuanid(int dajuanid) {
		this.dajuanid = dajuanid;
	}

	private String shijuantitle;

	public String getShijuantitle() {
		return shijuantitle;
	}

	public void setShijuantitle(String shijuantitle) {
		this.shijuantitle = shijuantitle;
	}

	private int defen;

	public int getDefen() {
		return defen;
	}

	public void setDefen(int defen) {
		this.defen = defen;
	}

	private String dajuanren;

	public String getDajuanren() {
		return dajuanren;
	}

	public void setDajuanren(String dajuanren) {
		this.dajuanren = dajuanren;
	}

	private String daan;

	public String getDaan() {
		return daan;
	}

	public void setDaan(String daan) {
		this.daan = daan;
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

	
}
