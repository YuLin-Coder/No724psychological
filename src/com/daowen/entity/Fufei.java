package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Fufei {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private int topicid;

	public int getTopicid() {
		return topicid;
	}

	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}

	private String hyaccount;

	public String getHyaccount() {
		return hyaccount;
	}

	public void setHyaccount(String hyaccount) {
		this.hyaccount = hyaccount;
	}

	private int fee;

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	private Date createtime;

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	private String topictitle;

	public String getTopictitle() {
		return topictitle;
	}

	public void setTopictitle(String topictitle) {
		this.topictitle = topictitle;
	}
}
