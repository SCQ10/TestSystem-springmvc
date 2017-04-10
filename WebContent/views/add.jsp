<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <c:if test="${sessionScope.type==1 }">
                <form action="${pageContext.request.contextPath }/paperExam-addPaperExam" method="post" id="myform" name="myform">
                    <table class="insert-tab" width="100%">
                    
                        <tbody>
                            <tr>
                                <th><i class="require-red"></i>科目：</th>
                                <td>
                                    <input class="common-text required" id="subject" name="subject" size="50" value="" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>考试时间：</th>
                                <td><input class="common-text required" id="timeLimit" name="timeLimit" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th>题目数量：</th>
                                <td><input class="common-text" name="questionCount" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th>考试总分：</th>
                                <td><input class="common-text" name="totalScore" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                </td>
                            </tr>
                        </tbody>
                	</table>
                </form>
               </c:if>
                
                <c:if test="${sessionScope.type==3 }">
                <form action="${pageContext.request.contextPath }/question-addQuestion" method="post">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red"></i>所属科目：</th>
                                <td>
                                    <select name="flag" id="catid" class="required">
                                    <c:forEach var="bean" items="${paperExams }" >
                                    	<option value=${bean.id }>${bean.subject }</option>
                                   	</c:forEach>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <th>题干：</th>
                                <td><input class="common-text required" id="title" name="title" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项A：</th>
                                <td><input class="common-text" name="ca" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项B：</th>
                                <td><input class="common-text" name="cb" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项C：</th>
                                <td><input class="common-text" name="cc" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th>选项D：</th>
                                <td><input class="common-text" name="cd" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th>答案：</th>
                                <td><input class="common-text" name="answers" size="50" value="" type="text"></td>
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
                                <td><input class="common-text" name="point" size="50" value="" type="text"></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                </td>
                            </tr>
                        </tbody>
                        </table>
              		  </form>
                    </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>