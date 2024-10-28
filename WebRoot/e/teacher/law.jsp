
<%@ page import="com.daowen.entity.*" %>
<%@ page import="com.daowen.service.*" %>
<%@ page import="com.daowen.util.*" %>
<%@ page import="com.daowen.uibuilder.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
      Teacher tem_teacher=null;
      
      if(request.getSession().getAttribute("teacher")!=null)
      {
         tem_teacher=(Teacher)request.getSession().getAttribute("teacher");
      }
      else
      {
         response.sendRedirect(request.getContextPath()+"/e/login.jsp");
      }  
      
 %>
