<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    TopicService topicSrv=BeansUtil.getBean("topicService", TopicService.class);
   Topic temobjtopic=null;
    if( id!=null){
      temobjtopic=topicSrv.load(" where id="+ id);
      request.setAttribute("topic",temobjtopic);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>帖子信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看帖子
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >标题:</td>
											   <td>
												   ${requestScope.topic.title}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >发布人:</td>
											   <td>
												   ${requestScope.topic.pubren}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >发布时间:</td>
											   <td>
												   ${requestScope.topic.pubtime}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >备注:</td>
											   <td>
												   ${requestScope.topic.bkid}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >版块名称:</td>
											   <td>
												   ${requestScope.topic.bkname}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >浏览次数:</td>
											   <td>
												   ${requestScope.topic.clickcount}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >主题:</td>
											   <td>
												   ${requestScope.topic.istopic}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >最后回帖人:</td>
											   <td>
												   ${requestScope.topic.lastreplyor}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >最后回帖时间:</td>
											   <td>
												   ${requestScope.topic.lastreplytime}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >回帖次数:</td>
											   <td>
												   ${requestScope.topic.replycount}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >主题编号:</td>
											   <td>
												   ${requestScope.topic.replyid}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >内容:</td>
											   <td>
												   ${requestScope.topic.dcontent}
												</td>
											   </tr>
				        </table>
</body>
</html>
