package com.daowen.service;

import org.springframework.stereotype.Service;

import com.daowen.mapper.BankuaiMapper;


@Service
public class ForumBlockTree extends RecursionTree<BankuaiMapper>  {

	public ForumBlockTree(){
		
		setTextfieldname("name");
		
	}
	
	
}
