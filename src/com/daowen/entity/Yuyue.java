package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Yuyue
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private int fwyid ;
   public int getFwyid() 
   {
      return fwyid;
  }
   public void setFwyid(int fwyid) 
   {
      this.fwyid= fwyid;
  }
   private String fwyname ;
   public String getFwyname() 
   {
      return fwyname;
  }
   public void setFwyname(String fwyname) 
   {
      this.fwyname= fwyname;
  }
   private Date yydate ;
   public Date getYydate() 
   {
      return yydate;
  }
   public void setYydate(Date yydate) 
   {
      this.yydate= yydate;
  }
   private String msstyle ;
   public String getMsstyle() 
   {
      return msstyle;
  }
   public void setMsstyle(String msstyle) 
   {
      this.msstyle= msstyle;
  }
   private String mobile ;
   public String getMobile() 
   {
      return mobile;
  }
   public void setMobile(String mobile) 
   {
      this.mobile= mobile;
  }
   private int state ;
   public int getState() 
   {
      return state;
  }
   public void setState(int state) 
   {
      this.state= state;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
   private String hyaccount ;
   public String getHyaccount() 
   {
      return hyaccount;
  }
   public void setHyaccount(String hyaccount) 
   {
      this.hyaccount= hyaccount;
  }
   private String hyname ;
   public String getHyname() 
   {
      return hyname;
  }
   public void setHyname(String hyname) 
   {
      this.hyname= hyname;
  }
}
