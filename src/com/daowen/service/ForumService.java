package com.daowen.service;

import java.text.MessageFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daowen.entity.Bankuai;
import com.daowen.entity.Topic;
import com.daowen.mapper.BankuaiMapper;
import com.daowen.mapper.TopicMapper;

@Service
public class ForumService {
	@Autowired
	private BankuaiMapper bankuaiDao;
	@Autowired
	private TopicMapper   topicDao;
	
	public  List<Bankuai> getBankuais(int bkid){
		
		
		String SQL=MessageFormat.format(" where parentid={0}  ",bkid);
		List<Bankuai> list=bankuaiDao.getEntitys(SQL);
		
		return list;
				
	}
	
    public  int getTopiccount(int blockid){
				 
	    return topicDao.getRecordCount(" where bkid="+blockid+" and  istopic=1");
	    
	}
	
    public  int getPostcount(int blockid){
			     
       return topicDao.getRecordCount(" where bkid="+blockid+" and  istopic=0");
	    
	}
    
    public  Topic getLastTopic(int blockid){
		
    	String nativesql="select   *  from topic where bkid="+blockid+" and  istopic=1  order by pubtime desc limit 1";
    	List result= topicDao.query(nativesql);
		if(result.size()>0)
	      return (Topic)result.get(0);
	    
		return null;
	}
    
    
    public  Topic getLastPost(int topicid){
		
        String nativesql="select   *  from topic where replyid="+topicid+" and  istopic=0  order by pubtime desc limit 1";
    	
    	List result= topicDao.query(nativesql);
		if(result.size()>0)
	      return (Topic)result.get(0);
	    
		return null;
		
		
	}
      
    public int getTodayPostcount(int blockid){
    	
    	
         return topicDao.getRecordCount(" where bkid="+blockid+" and date(pubtime)= curdate() ");
	     
    	
    }
	

}
