package com.daowen.uibuilder;

import java.text.MessageFormat;
import java.util.List;

import com.daowen.entity.Bankuai;
import com.daowen.entity.Topic;
import com.daowen.service.BankuaiService;
import com.daowen.service.ForumService;
import com.daowen.service.TopicService;
import com.daowen.util.BeansUtil;


public class ForumBuilder {

	
	private ForumService forumSrv = null;
	private BankuaiService bankuaiSrv=null;
	private TopicService  topicSrv=null;

	public ForumBuilder() {
		forumSrv = BeansUtil.getBean("forumService", ForumService.class);
		bankuaiSrv=BeansUtil.getBean("bankuaiService", BankuaiService.class);
		topicSrv=BeansUtil.getBean("topicService", TopicService.class);
	}
	
	public String buildPicTopic(int bkId){
		StringBuilder sb=new StringBuilder();
		sb.append("<div class=\"pic-container\">");
		sb.append("<ul>");
		List<Topic> topicList= topicSrv.query(MessageFormat.format("SELECT  * from topic where exists( select * from bankuai bk where bk.parentid={0} and (bk.id=topic.bkid or topic.bkid={0}) )",bkId));
		for(Topic t :topicList){
			sb.append("<li>");
			sb.append(MessageFormat.format("<a href=\"topicdetails.jsp?topicid={0}\">",t.getId()));
			sb.append(MessageFormat.format("<img src=\"{0}\" width=\"300\" height=\"220\">",t.getTupian()));
			sb.append("</a>");
			String fee="";
			if(t.getFee()>0){
				fee="("+t.getFee()+"金币)";
			}
				
			sb.append(MessageFormat.format("<div class=\"desc\">{0} {1}</div>",t.getTitle(),fee));
			sb.append("</li>");
		}
		sb.append("</ul>");
		sb.append("</div>");
		return sb.toString();
	}

	public  String buildForum(int parentId) {

		StringBuffer sb = new StringBuffer();
		// 查询符合板块
		List<Bankuai> listbankuai = forumSrv.getBankuais(parentId);
		for (Bankuai tembankuai : listbankuai) {
			sb.append(buildBankuai(tembankuai));
		}
		return sb.toString();
	}
	/**
	 * 构建论坛导航
	 * @param parentId
	 * @return
	 */
	public String buildForumNav(int parentId){
		
		StringBuffer sb = new StringBuffer();
		// 查询符合板块
		List<Bankuai> listbankuai = forumSrv.getBankuais(parentId);
		for (Bankuai tembankuai : listbankuai) {
			sb.append(buildRootNavBankuai(tembankuai));
		}
		return sb.toString();
	}
	/**
	 * 
	 * @param rootBkid
	 * @return
	 */
	public String buildRootNavBankuai(int rootBkid){
		Bankuai  bankuai=bankuaiSrv.load(rootBkid);
		if(bankuai==null)
			return "";
		return buildRootNavBankuai(bankuai);
	}
	/**
	 * 创建根板块
	 * @param rootBankuai
	 * @return
	 */
	private  String buildRootNavBankuai(Bankuai rootBankuai){
		StringBuilder sb=new StringBuilder();
		sb.append("<div class=\"cate-nav-box\">");
		//板块标题
		sb.append(MessageFormat.format("<div class=\"title\"><i class=\"fa fa-cog\"></i>{0}</div>",rootBankuai.getName()));
        List<Bankuai> subforums= forumSrv.getBankuais(rootBankuai.getId());
        sb.append("<div class=\"content\">");
        for(Bankuai  subforum : subforums){
           sb.append("<div class=\"item\">");
           sb.append(MessageFormat.format("<a href=\"topiclist.jsp?bankuaiid={0}\">{1}</a>",subforum.getId(), subforum.getName()));
           sb.append("</div>");
        }
		sb.append("</div>");
		sb.append("</div>");
		return sb.toString();
		
	}
	
	
	public String buildBankuai(int blockId){
		Bankuai  bankuai=bankuaiSrv.load(blockId);
		if(bankuai==null)
			return "";
		return buildBankuai(bankuai);
		
	}
	
	private String buildBankuai(Bankuai tembankuai){
		
		StringBuffer sb = new StringBuffer();
		sb.append("<div class=\"mainbox forumlist\">");
		//展开操作
		sb.append(" <span class=\"headactions\">");
		sb.append(MessageFormat.format(" <img blockid=\"Block{0}\" class=\"collapsed\" title=\"收起/展开\"  alt=\"收起/展开\" src=\"images/collapsed_no.gif\">\r\n",tembankuai.getId()));
               
		sb.append("</span>");
		
		sb.append(MessageFormat.format("<h3>{0}</h3>",tembankuai.getName()));
		
		sb.append(MessageFormat.format(" <table  id=\"Block{0}\" cellspacing=\"0\"  cellpadding=\"0\">",tembankuai.getId()));
		sb.append("<thead class=\"category\">");
		sb.append("<tr>");
		sb.append(" <th>版块</th>");
		sb.append(" <td class=\"nums\">主题</td>");
		sb.append(" <td class=\"nums\">帖数</td>");
		sb.append(" <td class=\"lastpost\"> 最后发表</td>");
		sb.append("</tr>");
		sb.append("</head>");
		
		sb.append("<tbody>");
		
		 List<Bankuai> subforumlist= forumSrv.getBankuais(tembankuai.getId());
         
         for(Bankuai  subforum : subforumlist)
         {
		    sb.append(" <tr>");
		    
		    sb.append(" <th class=\"new\">");
		    sb.append("<h2>");
		    sb.append(MessageFormat.format("<a href=\"topiclist.jsp?bankuaiid={0}\">{1}</a>",subforum.getId(),subforum.getName()));
		    sb.append(MessageFormat.format("<em>(今日: {0})</em>",forumSrv.getTodayPostcount(subforum.getId())));
		    sb.append("</h2>");
		    sb.append("</th>");
		    sb.append(MessageFormat.format("<td class=\"nums\">{0}</td>",forumSrv.getTopiccount(subforum.getId())));
		    
		    sb.append(MessageFormat.format("<td class=\"nums\">{0}</td>",forumSrv.getPostcount(subforum.getId())));
		    
		    Topic lasttopic =forumSrv.getLastTopic(subforum.getId());
            sb.append(" <td class=\"lastpost\">");
            if(lasttopic!=null)
            {  
               
               sb.append(MessageFormat.format("{0}",lasttopic.getTitle()));
               sb.append(MessageFormat.format("<cite>by:{0}-{1}</cite>",lasttopic.getPubren(),lasttopic.getPubtime().toLocaleString()));
            }else {
            	sb.append(" 板块暂无发表主题");
			    
			}
            sb.append("</td>");
            
		    sb.append("</tr>");
         }
         sb.append("</tbody>");
		
		
		sb.append("</table>");
		sb.append("</div>");
		return sb.toString();
		
	}

}
