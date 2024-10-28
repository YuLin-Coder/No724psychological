package com.daowen.entity;

import javax.persistence.*;

@Entity
public class Teacher {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String tno;

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String sex;

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	private String xiangpian;

	public String getXiangpian() {
		return xiangpian;
	}

	public void setXiangpian(String xiangpian) {
		this.xiangpian = xiangpian;
	}

	private int logintimes;

	public int getLogintimes() {
		return logintimes;
	}

	public void setLogintimes(int logintimes) {
		this.logintimes = logintimes;
	}

	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String zhicheng;

	public String getZhicheng() {
		return zhicheng;
	}

	public void setZhicheng(String zhicheng) {
		this.zhicheng = zhicheng;
	}

	private String xueli;

	public String getXueli() {
		return xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}

	private String jiguan;

	public String getJiguan() {
		return jiguan;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	private int age;

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private String mobile;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	private String jiaoyanshi;

	public String getJiaoyanshi() {
		return jiaoyanshi;
	}

	public void setJiaoyanshi(String jiaoyanshi) {
		this.jiaoyanshi = jiaoyanshi;
	}

	private String lvli;

	public String getLvli() {
		return lvli;
	}

	public void setLvli(String lvli) {
		this.lvli = lvli;
	}

	
}
