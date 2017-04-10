<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/modernizr.min.js"></script>
<title>后台新闻发布</title>
</head>
<body>

<div class="container clearfix">
    <div class="main-wrap">
    	<div class="result-wrap">
            <div class="result-content">
                <form action="${pageContext.request.contextPath }/account-update" method="post">
                    <table class="insert-tab" width="100%">
                   			<tr>
                                <th></th>
                                <td>
                                    <input class="common-text required" id="id" name="id" size="50" value="${sessionScope.account.id }" type="hidden">
                                </td>
                            </tr>
                       		 <tr>
                                <th><i class="require-red"></i>商品名称：</th>
                                <td>
                                    <input class="common-text" name="name" size="50" value="${sessionScope.account.paperExam }" type="text" readonly="readonly">
	                            </tr>
                            <tr>
                                <th>题干：</th>
                                <td><input class="common-text required" id="title" name="title" size="50" value="${sessionScope.account.title }" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项A：</th>
                                <td><input class="common-text" name="ca" size="50" value="${sessionScope.account.options[0] }" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项B：</th>
                                <td><input class="common-text" name="cb" size="50" value="${sessionScope.account.options[1] }" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项C：</th>
                                <td><input class="common-text" name="cc" size="50" value="${sessionScope.account.options[2] }" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项D：</th>
                                <td><input class="common-text" name="cd" size="50" value="${sessionScope.account.options[3] }" type="text"></td>
                            </tr>
                            <tr>
                                <th>答案：</th>
                                <td><input class="common-text" name="answers" size="50" value="${sessionScope.account.answers }" type="text"></td>
                            </tr>
                            <tr>
                                <th>单多选：</th>
                                <td>
                                    <select name="type" id="catid" class="required">
	                                    <option value="0">单选</option>
	                                    <option value="1">多选</option>
                               		</select>
								</td>
                            </tr>
                            <tr>
                                <th>分数：</th>
                                <td><input class="common-text" name="point" size="50" value="${sessionScope.account.point }" type="text"></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                </td>
                            </tr>
                       </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>