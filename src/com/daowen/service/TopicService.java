package com.daowen.service;

import java.text.MessageFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daowen.entity.Fufei;
import com.daowen.entity.Huiyuan;
import com.daowen.entity.Topic;
import com.daowen.mapper.TopicMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;
@Service
public class TopicService extends SimpleBizservice<TopicMapper>{

    @Autowired
	private HuiyuanService huiyuanSrv=null;
    @Autowired
    private FufeiService fufeiSrv=null;
	public Boolean  koukuan(Huiyuan hy,Topic topic){
		
		Boolean res=fufeiSrv.isExist(MessageFormat.format("where hyaccount=''{0}'' and topicid={1} ",hy.getAccountname(),topic.getId()));
		if(res)
			return true;
		hy.setYue(hy.getYue()-topic.getFee());
		huiyuanSrv.update(hy);
		Fufei ff=new Fufei();
		ff.setCreatetime(new Date());
		ff.setTopicid(topic.getId());
		ff.setTopictitle(topic.getTitle());
		ff.setHyaccount(hy.getAccountname());
		ff.setFee(topic.getFee());
		fufeiSrv.save(ff);
		return true;
		
		
	}
	
}
