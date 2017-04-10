<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath }/css/style.css" media="screen">
<link rel="stylesheet"	href="${pageContext.request.contextPath }/css/admin_login.css" media="screen">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/modernizr.min.js"></script>
<script src="${pageContext.request.contextPath }/scripts/jquery-1.7.1.js"></script>
<script type="text/javascript">
$(function(){
	var contextPath="${pageContext.request.contextPath }";
	var user="<%= session.getAttribute("user")%>";
	if(user=="null"){
		alert("你尚未登录!!");
		window.location.href= contextPath+"/views/login.jsp";
		
	}
});
			function viewList(){
			document.getElementById('list').style.display= ''; 
			document.getElementById('add').style.display= 'none'; 
			
			}
			function viewAdd(){
			document.getElementById('list').style.display= 'none'; 
			document.getElementById('add').style.display= ''; 
			
			}
			function exit(){
		   		var r=confirm("确定退出吗?");
		   		if (r==true){
		   			return true;
		   	  	}else{
		   	  		return false;
		   	  	}	
		   	}
	</script>
<body onload="viewList();">
<div><center><h1>欢迎&nbsp;${sessionScope.user.name }&nbsp;同学参加考试</h1>
			<h6><a onclick="return exit()" href="${pageContext.request.contextPath }/user-exitSystem">忍心离开</a></h6>
</center></div>
<div id="teamcont" >
	<div style="width:780px;margin:30px auto; text-align:center">
			<div class="parinforma cssshadow">
				<div class="closebtn"></div>
				<div class="showLeft">
					<div class="partener">
						<img class="row1" src="${pageContext.request.contextPath }/img/partner/team8.jpg" >
						<div class="pname"></div>
						<div class="pinfo">开始考试</div>
					</div>
				</div>
				<div class="showRight">
					<div class="huncontent">
					<center>考试注意事项</center>	
					<center>你确定要开始进行考试了吗</center>
						<c:forEach var="bean" items="${paperList }" begin="0" end="0">
							<input type="button" tabindex="2" value="${bean.subject }" class="btn btn-primary" id="start0"/>
						</c:forEach>
						<c:forEach var="bean" items="${paperList }" begin="1" end="1">
							<input type="button" tabindex="2" value="${bean.subject }" class="btn btn-primary" id="start1"/>
						</c:forEach>
						<c:forEach var="bean" items="${paperList }" begin="2" end="2">
							<input type="button" tabindex="2" value="${bean.subject }" class="btn btn-primary" id="start2"/>
						</c:forEach>
					<br>
					</div>
				</div>
				<div style="clear:both"></div>
			</div>
			<div class="parinforma cssshadow">
				<div class="closebtn"></div>
				<div class="showLeft">
					<div class="partener">
						<img class="row1" src="${pageContext.request.contextPath }/img/partner/team5.jpg" >
						<div class="pname"></div>
						<div class="pinfo">修改密码</div>
					</div>
				</div>
				<div class="showRight">
					<div class="huncontent">	
						<form action="${pageContext.request.contextPath }/user-updatePassword" method="post">
							用户名:<input type="text" name="name" id="name" readonly="readonly" value="${sessionScope.user.name }"/>
							<br><br>
							密码:<input type="password" name="password" id="password"/>
							<br><br>
							再一次:<input type="password" name="repassword" id="repassword"/>
							<br><br>
							<input type="submit" value="修改密码" />
						</form>
					</div>
				</div>
				<div style="clear:both"></div>
			</div>
			<div class="parinforma cssshadow">
				<div class="closebtn"></div>
				<div class="showLeft">
					<div class="partener">
						<img class="row1" src="${pageContext.request.contextPath }/img/partner/team1.jpg" >
						<div class="pname"></div>
						<div class="pinfo">你的分数</div>
					</div>
				</div>
				<div class="showRight">
					<div class="huncontent">	
						<c:if test="${requestScope.flag==true }">
							<div>
								你还未参加过考试!
							</div>
						</c:if>
						<c:if test="${requestScope.flag==false }">
							<div class="main-wrap">
						        <div class="result-wrap">
						            <form name="myform" id="myform" method="post">
						                <div class="result-content">
						                    <table class="result-tab" width="110%">
						                        <tr>
						                            <th>考试科目</th>
						                            <th>考试分数</th>
						                            <th>考试时间</th>
						                        </tr>
						                       <c:forEach var="bean" items="${historyExams }" >
						   						<tr>
						   							<td>${bean.paperExam }</td>
						   							<td>${bean.score }</td>
						   							<td>${bean.startTime }</td>
						   						</tr>
						   					</c:forEach>
											
						                    </table>
						                    <div class="list-page"></div>
						                </div>
						            </form>
						        </div>
						    </div>
						</c:if>
					</div>
				</div>
				<div style="clear:both"></div>
			</div>
			<div class="parinforma cssshadow">
				<div class="closebtn"></div>
				<div class="showLeft">
					<div class="partener">
						<img class="row1" src="${pageContext.request.contextPath }/img/partner/team4.jpg" >
						<div class="pname"></div>
						<div class="pinfo">牛人榜</div>
					</div>
				</div>
				<div class="showRight">
					<div class="huncontent">
						<div class="main-wrap">
						        <div class="result-wrap">
						            <form name="myform" id="myform" method="post">
						                <div class="result-content">
						                    <table class="result-tab" width="110%">
						                        <tr>
						                       		<th>大神</th>
						                            <th>考试科目</th>
						                            <th>考试分数</th>
						                            <th>封号</th>
						                        </tr>
						                       <c:forEach var="bean" items="${historyHighScore }" >
						   						<tr>
						   							<td>${bean.user }</td>
						   							<td>${bean.paperExam }</td>
						   							<td>${bean.score }</td>
						   							<c:if test="${bean.score>=95 }">
						   								<td><font color='green' size="15px">黑胖级</font></td>
						   							</c:if>
						   							<c:if test="${bean.score>89&&bean.score<95 }">
						   								<td><font color='red'>狗蛋级</font></td>
						   							</c:if>
						   						</tr>
						   					</c:forEach>
											
						                    </table>
						                    <div class="list-page"></div>
						                </div>
						            </form>
						        </div>
						    </div>
					</div>
				</div>
				<div style="clear:both"></div>
			</div>
		
			<div id="pichuan">
				<div class="partener1"><img class="row1" src="${pageContext.request.contextPath }/img/partner/team8.jpg" >
					<div class="pname"></div>
					<div class="pinfo">开始考试</div>
				</div>
				<div  class="partener"><img class="row1" src="${pageContext.request.contextPath }/img/partner/team5.jpg" >
					<div class="pname"></div>
					<div class="pinfo">修改密码</div>
				</div>
				<div  class="partener"><img class="row1" src="${pageContext.request.contextPath }/img/partner/team1.jpg" >
					<div class="pname"></div>
					<div class="pinfo">我的分数</div>
				</div>
				<div class="partener1"><img class="row1" src="${pageContext.request.contextPath }/img/partner/team4.jpg" >
					<div class="pname"></div>
					<div class="pinfo">
						<div id="">牛人榜</div>
					</div>
				</div>
				<div style="clear:both"></div> 
				 
			</div>
	</div>		
</div>	
<script type="text/javascript">
$("#pichuan .partener1").mouseenter(function(){
	$(this).find("div").css("color","red");
	$(this).find("img").delay(200).stop().clearQueue().animate({
		borderRadius: "20",
		opacity: 1
	},"fast");
}).mouseleave(function(){
	$(this).find("div").css("color","black");
	$(this).find("img").delay(200).stop().clearQueue().animate({
		borderRadius: "60",
		opacity: 0.9
	},"fast");
});
$("#pichuan .partener").mouseenter(function(){
	$(this).find("div").css("color","red");
	$(this).find("img").delay(200).stop().clearQueue().animate({
		borderRadius: "20",
		opacity: 1
	},"fast");
}).mouseleave(function(){
	$(this).find("div").css("color","black");
	$(this).find("img").delay(200).stop().clearQueue().animate({
		borderRadius: "60",
		opacity: 0.9
	},"fast");
});
$("#pichuan .row1").click(function(){
	var picIndex=$("#pichuan .row1").index($(this));
	$(".parinforma").hide();
	$("#pichuan").hide();
	$(".parinforma").eq(picIndex).slideDown("normal");
});
$("#teamcont .closebtn").mouseenter(function(){
	$(this).css({'background':'url(img/close-s.png)'});
}).mouseleave(function(){
	$(this).css({'background':'url(img/close-n.png)'});
});
$("#teamcont .closebtn").click(function(){
	$(".parinforma").hide();
	$("#pichuan").show();
});
$("#cancel").click(function(){
	$(".parinforma").hide();
	$("#pichuan").show();
});
$("#wait").click(function(){
	$(".parinforma").hide();
	$("#pichuan").show();
});
$("input[id^='start']").click(function(){
	var contextPath="${pageContext.request.contextPath }";
	var subject=$(this).val();
	subject=$.trim(subject);
	$.ajax({
		type:"POST",
		url:contextPath+"/user-startExam",
		data:{"subject":subject,"time":new Date()},
		cache:false,
		dataType:'json',
		success:function(data){
			if(data=="1"){
				window.location.href= contextPath+"/views/test.jsp";
			}else{
				alert("加载题目失败");
				window.location.reload();
			}
		}
	});
});
$("#exit").click(function(){
	var contextPath="${pageContext.request.contextPath }";
	$.ajax({
		type:"POST",
		url:contextPath+"/user-exitSystem",
		data:{"time":new Date()},
		cache:false,
		dataType:'json',
		success:function(data){
			if(data=="1"){
				window.location.href= contextPath+"/login.jsp";
			}else{
				alert("退出失败!");
				window.location.reload();
			}
		}
	});
});
$("#password").change(function(){
	$(this).nextAll("font").remove();
	var password=$("#password").val();
	if(password.length<4){
		$(this).after("<font color='red'>密码长度少于4位</font>");
	}else if(password.length>8){
		$(this).after("<font color='red'>密码长度多于8位</font>")
	}
});
$("#repassword").change(function(){
	$(this).nextAll("font").remove();
	var password=$("#password").val();
	var repassword=$("#repassword").val();
	if(password!=repassword){
		$(this).after("<font color='red'>两次密码不一致</font>");
	}
});
</script>

</body>
</html>
