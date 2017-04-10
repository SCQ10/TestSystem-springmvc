<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 让IE以兼容性视图模式打开网页 注意前面不能有任何css或者js否则会影响浏览器解析模式 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">

<title>基本信息填写--问卷系统</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/reg1.css" type="text/css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/style_validation.css"  type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var contextPath="${pageContext.request.contextPath }";
		$("#name").change(function(){
			var val=$(this).val();
			val=$.trim(val);
			var $this=$(this);
			if(val!=""){
				$this.nextAll("font").remove();
				var url=contextPath+"/user-validateName";
				var args={"name":val,"time":new Date()};
				$.post(url,args,function(data){
					if(data=="1"){
						$this.after("<font color='green'>用户名未被注册</font>");
					}else if(data=="0"){
						$this.after("<font color='red'>用户名已被注册</font>");
					}else{
						alert("服务器错误!");
					}
				});
			}else{
				$this.after("<font color='red'>用户名不可为空</font>");
				this.focus();
			}
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
		$("#phone").change(function(){
			$(this).nextAll("font").remove();
			var phone=$("#phone").val();
			var rex=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
			if(!rex.test(phone)){
				$(this).after("<font color='red'>手机格式不正确</font>");
			}
		});
		$("#reg").click(function(){
			var name=$("#name").val();
			var password=$("#password").val();
			var phone=$("#phone").val();
			$.ajax({
				type:"POST",
				url:contextPath+"/user-register",
				data:{"name":name,"password":password,"phone":phone,"time":new Date()},
				cache:false,
				dataType:'json',
				success:function(data){
					if(data=="1"){
						window.location.href= contextPath+"/views/login.jsp";
					}else{
						alert("密码错误!");
						window.location.reload();
					}
				}
			});
		});
	});
</script>

</head>
<body>
	<div class="formwrapper" id="reg_formwrapper">
		<h3 align="center" style="font-size: 35px;">
			欢迎注册
		</h3>
		<p>
			<strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>
		</p>
		<br />
		<form method="post">
			<fieldset>
				<legend id="legend_geren" align="center">
					<span>个人信息</span>
				</legend>
				<br />
				<div>
					<label>用户名</label> <input type="text" id="name" name="name" size="11" />
				</div>
				<div>
					<label>密码</label> <input type="password" id="password" name="password" size="11" maxlength="8"/>
					<span>4-8位英文或者数字,区分大小写</span>
				</div>
				<div>
					<label>再输一次密码</label> <input type="password" id="repassword" name="repassword" size="11" maxlength="8"/>
				</div>
				<div>
					<label>手机号码</label> <input type="text" name="phone"
						id="phone" size="18" maxlength="11" />

				</div>
				<div class="enter">
					<input id="reg" type="button" class="button" value="注册" />
				</div>
			</fieldset>
		</form>
		<fieldset>
			<legend id="legend_copyright" align="center">
				<span>Copyright Information</span>
			</legend>
			<br />
			<center>
				Email:&nbsp; <a href="mailto:984647865@qq.com"><font
					color="black">984647865@qq.com</font></a> <br /> <font size="2px"
					face="楷体">Copyright (c)</font> <br /> <font
					size="2px" face="楷体">All Rights Reserved 谦! 版权所有</font>
			</center>
		</fieldset>
	</div>
</body>
</html>