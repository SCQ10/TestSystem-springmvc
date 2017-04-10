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
<script type="text/javascript">
			function viewList(){
			document.getElementById('list').style.display= ''; 
			document.getElementById('add').style.display= 'none'; 
			}
			function viewAdd(){
			document.getElementById('list').style.display= 'none'; 
			document.getElementById('add').style.display= ''; 
			}
	</script>
</head>
<body onload="viewList()" >
<c:if test="${sessionScope.mark==3 }">
    <form action="${pageContext.request.contextPath}/question-searchBySubject" method="post">
		根据考试科目查询:<input type="text" name="sub"/>
		<input type="submit" value="查询"/>
	</form>
</c:if>
    <div class="main-wrap">


        <div class="result-wrap">
            <form name="myform" id="myform" method="post" >
           		<c:if test="${sessionScope.mark==1 }">
                <div class="result-title">
                    <div class="result-list">
                        <a href="${pageContext.request.contextPath }/paperExam-add" target="mainFrame"><i class="icon-font"></i>新增科目</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>科目编号</th>
                            <th>考试科目</th>
                            <th>考试时间</th>
                            <th>题目数量</th>
                            <th>考试总分</th>
                            <th>操作</th>
                        </tr>
	                   <c:forEach var="bean" items="${paperExams }" >
	   						<tr>
	   							<td>${bean.id }</td>
	   							<td>${bean.subject }</td>
	   							<td>${bean.timeLimit }</td>
	   							<td>${bean.questionCount }</td>
	   							<td>${bean.totalScore }</td>
	   							<td>
	                                <a class="link-del" href="${pageContext.request.contextPath }/paperExam-delete?id=${bean.id }">删除</a>
	                                <a class="link-update" href="${pageContext.request.contextPath }/paperExam-update?id=${bean.id }">修改</a>
	   							</td>
	
	   						</tr>
	   					</c:forEach>
   					</table>
                </div>
                </c:if>
                <c:if test="${sessionScope.mark==2 }">
	                <div class="result-title">
	                    <div class="result-list">
	                    </div>
	                </div>
	                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>手机号码</th>
                            <th>注册日期</th>
                            <th>操作</th>
                        </tr>
	                   <c:forEach var="bean" items="${users }" >
	   						<tr>
	   							<td>${bean.id }</td>
	   							<td>${bean.name }</td>
	   							<td>${bean.phone }</td>
	   							<td>${bean.regDate }</td>
	   							<td>
	                                <a class="link-del" href="${pageContext.request.contextPath }/user-delete?id=${bean.id }">删除</a>
	   							</td>
	
	   						</tr>
	   					</c:forEach>
   					</table>
   					</div>
   				</c:if>
   				<c:if test="${sessionScope.mark==3 }">
   				
   					<div class="result-title">
                    <div class="result-list">
                        <a href="${pageContext.request.contextPath }/question-add" target="mainFrame"><i class="icon-font"></i>新增题目</a>
                    </div>
             	   </div>
             	   <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>题目编号</th>
                            <th>所属科目</th>
                            <th>题干</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>单多选</th> 
                            <th>答案</th>
                          	<th>本题分数</th>
                            <th>操作</th>
                        </tr>
	                   <c:forEach var="bean" items="${questions }" >
	   						<tr>
	   							<td>${bean.id }</td>
	   							<td>${bean.paperExam }</td>
	   							<td>${bean.title }</td>
	   							<td>${bean.options[0] }</td>
	   							<td>${bean.options[1] }</td>
	   							<td>${bean.options[2] }</td>
	   							<td>${bean.options[3] }</td>
	   							<td>${bean.type }</td>
	   							<td>${bean.answers }</td>
	   							<td>${bean.point }</td>
	   							<td>
	                                <a class="link-del" href="${pageContext.request.contextPath }/question-delete?id=${bean.id }">删除</a>
	                                <a class="link-update" href="${pageContext.request.contextPath }/question-update?id=${bean.id }">修改</a>
	   							</td>
	
	   						</tr>
	   					</c:forEach>
   					</table>
   					</div>
   				</c:if>
   				<c:if test="${sessionScope.mark==4 }">
   					<div class="result-title">
                    <div class="result-list">
                    </div>
             	   </div>
             	   <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>编号</th>
                            <th>考试科目</th>
                            <th>用户名</th>
                            <th>得分</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>操作</th>
                        </tr>
	                   <c:forEach var="bean" items="${historyExams }" >
	   						<tr>
	   							<td>${bean.id }</td>
	   							<td>${bean.paperExam }</td>
	   							<td>${bean.user }</td>
	   							<td>${bean.score }</td>
	   							<td>${bean.startTime }</td>
	   							<td>${bean.endTime }</td>
	   							<td>
	                                <a class="link-del" href="${pageContext.request.contextPath }/historyExam-delete?id=${bean.id }">删除</a>
	   							</td>
	
	   						</tr>
	   					</c:forEach>
   					</table>
   					</div>
   				</c:if>
            </form>
        </div>
    </div>

</body>
</html>