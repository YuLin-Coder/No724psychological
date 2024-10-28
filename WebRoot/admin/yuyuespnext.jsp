<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    YuyueService yuyueSrv=BeansUtil.getBean("yuyueService",  YuyueService.class);
    if( id!=null)
    {
         Yuyue temobjyuyue= yuyueSrv.load(" where id="+ id);
          request.setAttribute("yuyue",temobjyuyue);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>预约审批</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
    	   <div class="search-title">
			<h2>预约审批</h2>
			<div class="description">
			</div>
		</div>
			<form name="yuyueform"  method="post" action="${pageContext.request.contextPath}/admin/yuyuemanager.do"  id="yuyueForm">
					    <input type="hidden" name="id" value="<%=id%>" />
						        <input type="hidden" name="actiontype" value="shenpi" />
						         <input type="hidden" name="errorurl" value="/admin/yuyueadd.jsp" />
						        <input type="hidden" name="forwardurl" value="/admin/yuyuemanager.do?actiontype=get&forwardurl=/admin/yuyuesp.jsp" />
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >人员编号:</td>
											   <td>
												   ${requestScope.yuyue.fwyid}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >备注:</td>
											   <td>
												   ${requestScope.yuyue.fwyname}
												</td>
											   </tr>
											   <tr>
											   <td align="right">预约日期:</td>
											   <td>
												   ${requestScope.yuyue.yydate}
												</td>
											   </tr>
											   <tr>
											    <td align="right" >面试方式:</td>
											   <td>
												   ${requestScope.yuyue.msstyle}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >联系电话:</td>
											   <td>
												   ${requestScope.yuyue.mobile}
												</td>
											   </tr>
											   <tr>
										         <td align="right">处理结果</td>
										         <td>
										               <input type="radio"  value="2"  name="state"  checked="checked"/>审批通过
										              <input type="radio"  value="3"  name="state"  />拒绝
										         </td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >会员:</td>
											   <td>
												   ${requestScope.yuyue.hyaccount}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >姓名:</td>
											   <td>
												   ${requestScope.yuyue.hyname}
												</td>
											   </tr>
          <tr>
					                      <td align="right" >预约备注:</td>
					                       <td colspan="3">
											 ${requestScope.yuyue.des}
											   </td>
											  </tr>
					        <tr>
					               <td align="right">处理说明:</td>
					               <td colspan="3"> 
					                       <textarea   name="reply"   id="txtReply" style="width:48%;height:80px;"  ></textarea>
					              </td>
					        </tr>
					        <tr>
					             <td colspan="4">
					                      <button class="orange-button">提交审批</button>
					             </td>
					        </tr>
			</table>
		</form>		
</body>
</html>
