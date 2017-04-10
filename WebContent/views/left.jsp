<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/scripts/modernizr.min.js"></script>
<title>后台新闻发布</title>
</head>
<body>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <ul class="sub-menu">
                    	<li><a href="${pageContext.request.contextPath }/paperExam-manage" target="mainFrame"><i class="icon-font">&#xe008;</i>科目管理</a></li> 
                        <li><a href="${pageContext.request.contextPath }/user-manage" target="mainFrame"><i class="icon-font">&#xe004;</i>用户管理</a></li> 
                        <li><a href="${pageContext.request.contextPath }/question-manage" target="mainFrame"><i class="icon-font">&#xe033;</i>题库管理</a></li>    
                        <li><a href="${pageContext.request.contextPath }/historyExam-manage" target="mainFrame"><i class="icon-font">&#xe052;</i>考试历史</a></li>      
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>