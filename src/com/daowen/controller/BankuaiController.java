package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Bankuai;
import com.daowen.entity.Topic;
import com.daowen.service.BankuaiService;
import com.daowen.service.ForumBlockTree;
import com.daowen.service.TopicService;
import com.daowen.ssm.simplecrud.SimpleController;
@Controller
public class BankuaiController extends SimpleController {

	@Autowired
	private BankuaiService bankuaiSrv=null;
	@Autowired
	private TopicService  topicSrv=null;
	@Autowired
	private ForumBlockTree forumblockTree;
	@Override
	@RequestMapping("/admin/bankuaimanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
	

	public void delete() {
		String id = request.getParameter("id");
				
		deleteBlock(new Integer(id));
	}
	
   private  void deleteBlock(int bkid){
	
	   topicSrv.delete("where bkid="+bkid);
	   List<Topic> topicList=topicSrv.getEntity("where bkid='"+bkid+"'");
	   for(Topic t1 : topicList){
		   topicSrv.delete("where replyid='"+t1.getId()+"'");
	   }
	  
	   forumblockTree.deleteLeafNode(bkid);
	
   }
	

	public void save() {
		
		String name = request.getParameter("name");
		String forwardurl=request.getParameter("forwardurl");
		String creator = request.getParameter("creator");
	
		String des = request.getParameter("des");
		
		String parentid = request.getParameter("parentid");
		String isshow=request.getParameter("isshow");
		SimpleDateFormat sdfbankuai = new SimpleDateFormat("yyyy-MM-dd");
		Bankuai bankuai = new Bankuai();
		bankuai.setName(name);
	    bankuai.setCreator(creator);	
		bankuai.setCreatetime(new Date());
		bankuai.setIshow(isshow==null?1:new Integer(isshow));
		bankuai.setDes(des);
		
		bankuai.setIsleaf(1);
		if(parentid!=null)
			bankuai.setParentid(new Integer(parentid));
		forumblockTree.saveTreeNode(bankuai);
	
		redirect(forwardurl);
		
		
		
	}


	public void update() {
		String id = request.getParameter("id");
		String forwardurl=request.getParameter("forwardurl");
		if (id == null)
			return;
		Bankuai bankuai = bankuaiSrv.load(new Integer(id));
		if (bankuai == null)
			return;
		String name = request.getParameter("name");
		String creator = request.getParameter("creator");
		
		String des = request.getParameter("des");
	
		SimpleDateFormat sdfbankuai = new SimpleDateFormat("yyyy-MM-dd");
		String isshow=request.getParameter("ishow");
		bankuai.setName(name);

		bankuai.setDes(des);
		bankuai.setCreator(creator);
		
		bankuai.setIshow(isshow==null?1:new Integer(isshow));

		bankuaiSrv.update(bankuai);
		
		redirect(forwardurl);
		
	}

	public void load(){
       String id = request.getParameter("id");
		
		String parentid = request.getParameter("parentid");
		if (parentid != null) {

			
			int tempid = new Integer(parentid);
            String showtext=forumblockTree.getShowText(tempid);
            System.out.print("showtext="+showtext);
			request.setAttribute("parenttext", showtext);
			request.setAttribute("parentid", parentid);

		} else {
			request.setAttribute("parentid", 0);
			request.setAttribute("parenttext", "板块根分类");
		}
	
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Bankuai bankuai =bankuaiSrv.load("where id=" + id);
			if (bankuai != null) {
				request.setAttribute("bankuai", bankuai);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/bankuaiadd.jsp";
		}
		forward(forwardurl);
	}

	
	public void get(){
		
		ForumBlockTree  blocktree=new ForumBlockTree();
		List<Bankuai> listbankuai=forumblockTree.getTree(0);
		
		request.setAttribute("listbankuai", listbankuai);
		
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/bankuaimanager.jsp";
		}
		forward(forwardurl);
	}

	
}
