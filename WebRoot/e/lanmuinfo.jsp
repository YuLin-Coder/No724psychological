<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.daowen.entity.*" %>
<%@ page import="com.daowen.service.*" %>
<%@ page import="com.daowen.util.*" %>
<%@ page import="com.daowen.uibuilder.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String id=request.getParameter("lanmuid");
            String parentid=request.getParameter("parentid");
            LanmuService lanmuSrv=BeansUtil.getBean("lanmuService", LanmuService.class);
            List<Lanmu> listlm=null;
            if(id!=null){
            
                Lanmu lanmu=lanmuSrv.load("where id="+id);
               
                if(lanmu!=null)
                   request.setAttribute("lanmu",lanmu);
                if(lanmu.getIsleaf()!=1){
                   listlm=lanmuSrv.getEntity("where parentid="+id);
                   parentid=id;
                }else
                {
                	if(parentid!=null)
                	   listlm=lanmuSrv.getEntity("where parentid="+parentid);
                }
               
            }
            
            LanmuBuilder lmb=new LanmuBuilder("box");
            List<Xinxi> xinxilist=lmb.findXinxiByLanmu(new Integer(id));
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${lanmu.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
	<div class="wrap round-block" >
	       <ul class="cate-href">
	     <%if(listlm!=null&&listlm.size()>0) {
	        for(Lanmu temlanmu :listlm){
	     
	     %>
	     
	          
	             <li><a class="item" href="${pageContext.request.contextPath}/e/lanmuinfo.jsp?lanmuid=<%=temlanmu.getId()%>&parentid=<%=parentid%>"><%=temlanmu.getTitle() %></a></li>
	            
	      <%}} %>
	     
	     </ul>
		<div class="directory" style="min-height:500px;">
		  
		     <div class="directory-title">
		          <div class="introduce">${lanmu.title}</div>
     	     </div>
     	     <div class="directory-content">
     	     
     	         <ul>
     	            <% 
     	              for(Iterator it=xinxilist.iterator();it.hasNext();){ 
     	              SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
     	                  Xinxi temxinxi=(Xinxi)it.next();
     	            
     	            %>
     	                 
     	            <li>
     	                <div class="pic">
     	                   <a><img src="<%=temxinxi.getTupian2() %>"/></a>
     	                </div>
     	                <div class="text">
     	                    <div class="text-title"><a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=<%=temxinxi.getId()%>"><%=temxinxi.getTitle() %></a></div>
     	                    <div class="subtitle">
     	                         <i class="fa fa-list-alt"></i>:<span><%=sdf.format(temxinxi.getPubtime()) %></span>
     	                          <i class="fa fa-user"></i>:<span><%=temxinxi.getPubren() %></span>  
     	                          <i class="fa fa-eye"></i>: <span><%=temxinxi.getClickcount() %>次</span>                                     
     	                                                                
     	                    
     	                    </div>
     	                    <div class="text-content">
                                  <%=HTMLUtil.subStringInFilter(temxinxi.getDcontent(),0, 300) %>                                                       
                             </div>
     	                </div>
     	            </li>
     	            <%} %>
     	         </ul>
     	        
     	     </div>
		  
		</div>
		  <div class="fn-left" style="width:310px;">
	          <div class="blue-box" >
                <div class="blue-box-title">推荐资讯</div>
			    <%=lmb.buildTuijianTextContent("blue-box-content") %>
            </div>
            <div class="blue-box" >
                <div class="blue-box-title">最新资讯</div>
			     <%=lmb.buildZuixinTextContent("blue-box-content") %>
            </div>
	     </div>

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>