<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">系统菜单</li>
       
       
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>测试题目</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
		          <li>
						<a target="main" href="${pageContext.request.contextPath}/admin/ceshitimanager.do?actiontype=get">
						<i class="fa fa-navicon"></i>
						测试题库管理</a>
					</li>
		             <li>
						<a target="main" href="${pageContext.request.contextPath}/admin/kechengmanager.do?actiontype=get">
						<i class="fa fa-plus"></i>
						  测试分类</a>
					</li>
					 <li>
						<a target="main" href="${pageContext.request.contextPath}/admin/shijuanmanager.do?actiontype=get">
						<i class="fa fa-navicon"></i>
						  测试卷管理</a>
					</li>
					
					<li>
						<a target="main" href="${pageContext.request.contextPath}/admin/shijuanmanager.do?actiontype=load">
						<i class="fa fa-plus"></i>
						新增测试卷</a>
					</li>
					
				
		</ul>
        </li>
        
         <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>在线交流</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
		          <li>
						<a target="main" href="${pageContext.request.contextPath}/admin/bankuaimanager.do?actiontype=get">
						<i class="fa fa-navicon"></i>
						板块管理</a>
					</li>
		             <li>
						<a target="main" href="${pageContext.request.contextPath}/admin/topicmanager.do?actiontype=get">
						<i class="fa fa-plus"></i>
						  帖子管理</a>
					</li>
					
					  <li>
						<a target="main" href="${pageContext.request.contextPath}/admin/yuyuemanager.do?actiontype=get&forwardurl=/admin/yuyuesp.jsp">
						<i class="fa fa-plus"></i>
						 预约审核</a>
					</li>
				

		</ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>频道资讯</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">


			
			<li><a target="main"
				href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=get">
					<i class="fa fa-navicon"></i> 频道文章管理
			</a></li>
			<li><a target="main"
				href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load">

					<i class="fa fa-plus"></i>发布文章
			</a></li>
			<li><a target="main"
				href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=get">
					<i class="fa fa-navicon"></i>频道管理
			</a></li>

			<li><a target="main"
				href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=load&parentid=0">
					<i class="fa fa-plus"></i>添加新闻栏目
			</a></li>


		</ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i>
            <span>用户管理</span>
            <span class="pull-right-container">
               <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
              <li>
                  <a target="main"  href="${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=get"><i class="fa fa-male"></i>会员管理</a>
              </li>
             
			  <li>
				<a target="main"  href="${pageContext.request.contextPath}/admin/teachermanager.do?actiontype=get"><i class="fa fa-user"></i>咨询师管理</a>
			  </li>
			    <li>
				<a target="main"  href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get"><i class="fa fa-user"></i>管理员管理</a>
			  </li>
          </ul>
        </li>
         <li class="treeview">
          <a href="#">
            <i class="fa fa-cog"></i>
            <span>网站设置</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           
		    <li >
				<a target="main" href="${pageContext.request.contextPath}/admin/sitenavmanager.do?actiontype=get">
				<i class="fa fa-navicon"></i>网站导航管理</a>
			</li>
			<li>
				<a   target="main" href="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=get">
				 <i class="fa fa-navicon"></i>首页栏目管理</a>
			</li>
			
			 <li>
				<a target="main" href="${pageContext.request.contextPath}/admin/jiaodiantumanager.do?actiontype=get">
				<i class="fa fa-bullhorn"></i>
				首页轮播图管理</a>
			</li>
			
			<li>
				<a target="main" href="${pageContext.request.contextPath}/admin/friendlinkmanager.do?actiontype=get">
				<i class="fa fa-navicon"></i>友情链接管理</a>
			</li>
			
			
		    <li>
				<a target="main" href="${pageContext.request.contextPath}/admin/commentmanager.do?actiontype=get">
				<i class="fa fa-navicon"></i>学生评论管理</a>
			</li>
			 <li>
				<a target="main" href="${pageContext.request.contextPath}/admin/sysconfigmanager.do?actiontype=get">
				<i class="fa fa-navicon"></i>网站介绍</a>
			</li>
			
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>账户设置</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           <li>
				<a  href="${pageContext.request.contextPath}/admin/modifypw.jsp"
					target="main"><i class="fa fa-lock"></i>修改密码</a>
			</li>
			<li>
				<a  href="${pageContext.request.contextPath}/admin/accountinfo.jsp"
					target="main"><i class="fa fa-info"></i>我的账户信息</a>
			</li>
			<li>
				<a  href="${pageContext.request.contextPath}/admin/modifyinfo.jsp"
					target="main"><i class="fa fa-share-alt-square"></i>修改账户信息</a>
			</li>
          </ul>
        </li>
       
      </ul>
