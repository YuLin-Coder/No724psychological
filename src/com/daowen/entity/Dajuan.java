package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Dajuan {
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

	private String kemu;

	public String getKemu() {
		return kemu;
	}

	public void setKemu(String kemu) {
		this.kemu = kemu;
	}

	private String dajuanren;

	public String getDajuanren() {
		return dajuanren;
	}

	public void setDajuanren(String dajuanren) {
		this.dajuanren = dajuanren;
	}

	private String stname;

	public String getStname() {
		return stname;
	}

	public void setStname(String stname) {
		this.stname = stname;
	}

	private String shijuanid;

	public String getShijuanid() {
		return shijuanid;
	}

	public void setShijuanid(String shijuanid) {
		this.shijuanid = shijuanid;
	}

	private int defen;

	public int getDefen() {
		return defen;
	}

	public void setDefen(int defen) {
		this.defen = defen;
	}
	
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
