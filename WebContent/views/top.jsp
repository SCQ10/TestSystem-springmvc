<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/modernizr.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
   	<script type="text/javascript">
   	function exit(){
   		var r=confirm("确定退出吗?");
   		if (r==true){
   			return true;
   	  	}else{
   	  		return false;
   	  	}	
   	}
   	</script>
<title>后台新闻发布</title>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on">谦神考试系统</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>欢迎 ${sessionScope.admin.name } </li>
                <li><a onclick="return exit()" href="${pageContext.request.contextPath }/admin-exit" target="_top">退出</a>&nbsp;</li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>