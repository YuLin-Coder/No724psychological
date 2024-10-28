package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Ceshiti {
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

	private String choicea;

	public String getChoicea() {
		return choicea;
	}

	public void setChoicea(String choicea) {
		this.choicea = choicea;
	}

	private String choiceb;

	public String getChoiceb() {
		return choiceb;
	}

	public void setChoiceb(String choiceb) {
		this.choiceb = choiceb;
	}

	private String choicec;

	public String getChoicec() {
		return choicec;
	}

	public void setChoicec(String choicec) {
		this.choicec = choicec;
	}

	private String choiced;

	public String getChoiced() {
		return choiced;
	}

	public void setChoiced(String choiced) {
		this.choiced = choiced;
	}

	private String daan;

	public String getDaan() {
		return daan;
	}

	public void setDaan(String daan) {
		this.daan = daan;
	}

	private String kemu;

	public String getKemu() {
		return kemu;
	}

	public void setKemu(String kemu) {
		this.kemu = kemu;
	}
	
	private  int  kmid;

	public int getKmid() {
		return kmid;
	}

	public void setKmid(int kmid) {
		this.kmid = kmid;
	}
}
