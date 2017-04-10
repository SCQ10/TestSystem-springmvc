<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var contextPath="${pageContext.request.contextPath }";
		$("#name").change(function(){
			var val=$(this).val();
			val=$.trim(val);
			var $this=$(this);
			if(val!=""){
				$this.nextAll("font").remove();
				var url="user-validateName";
				var args={"name":val,"time":new Date()};
				$.post(url,args,function(data){
					if(data=="1"){
						$this.after("<font color='red'>用户名不存在</font>");
					}else if(data=="0"){
						$this.after("<font color='green'>用户名存在,可用</font>");
					}else{
						alert("服务器错误!");
					}
				});
			}else{
				alert("lastName不能为空");
				this.focus();
			}
		});
		$("#sub").click(function(){
			var name=$("#name").val();
			var password=$("#pwd").val();
			password=$.trim(password);
			//var $this=$("#pwd");
			$.ajax({
				type:"POST",
				url:contextPath+"/user-validatePassword",
				data:{"name":name,"password":password,"time":new Date()},
				cache:false,
				dataType:'json',
				success:function(data){
					if(data=="1"){
						window.location.href= contextPath+"/user-login";
					}else{
						alert("密码错误!");
						window.location.reload();
					}
				}
			});
		});
	});
</script>
<title>Insert title here</title>

</head>
<body>
	<div class="signin">
	<div class="signin-head"><img src="${pageContext.request.contextPath}/images/test/head_120.png" alt="" class="img-circle"></div>
	<form class="form-signin" role="form" method="post">
		<input type="text" name="name" id="name" class="form-control" placeholder="用户名" required autofocus />
		<input type="password" name="password" id="pwd" class="form-control" placeholder="密码" required />
		<input class="btn btn-lg btn-warning btn-block" type="button" id="sub" value="登录"></input>
		<label class="checkbox">
			<input type="checkbox" value="remember-me"> 记住我
		</label>
	</form>
	<div>
    	<center><a href="${pageContext.request.contextPath }/views/reg.jsp">新用户?注册!</a>&nbsp;<a href="${pageContext.request.contextPath }/views/login(back).jsp">管理员登录</a></center>
    </div>
	</div>
    
</body>
</html>