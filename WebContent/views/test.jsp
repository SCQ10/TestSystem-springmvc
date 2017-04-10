<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="${pageContext.request.contextPath }/style/style1.css" media="all" rel="stylesheet" title="主样式" />
<link rel="stylesheet"	href="${pageContext.request.contextPath }/css/admin_login.css" media="screen">
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.8.3.js"></script> 
<script language="JavaScript" type="text/javascript">
$(document).ready(function(){	
	var i=0;
	var sld=0;
	var res=0;
	var len=$("#issue").find("div.cnt").length;	
	var prog=100;  //$("#prog").css("width");
	var ht=420;
	var speed=500;
	var contextPath="${pageContext.request.contextPath }";
	var point=parseInt($("#point").val());
	function setporogress(j){			
		i+=j;
		i=(i<0)? 0:i;
		checkbtn();
		if(!$("#info").is(":animated")){			
			$("#tips span").html((i+1>len?len:i+1)+"\/"+len+"题");		
			var wh=$("#tips").get(0).offsetWidth;		
			var ress=Math.round(i*prog/len);		
			$("#ress").css({"width": ress+"px"});		
			$("#tips").css({"left":ress-Math.round(wh/2)+"px"});
			$("#issue").animate({"top": -i*ht + "px"},500);
			}
		}
	/**
	 * 计算分数
	 */
	function selec(ele){			
		sld++;
		ele= $(ele)? $(ele):ele;
		ele.parents("div.cnt").addClass("selected");
		ele.addClass("sel");
		var userAnswer=ele.find("input").val();
		$.ajax({
			type:"POST",
			url:contextPath+"/user-checkAnswer",
			data:{"sld":sld,"userAnswer":userAnswer,"time":new Date()},
			cache:false,
			dataType:'json',
			success:function(data){
				if(data=="1"){
					res+=point;
				}
			}
		});
		if(sld<len){
			$("#temp").html("您目前得分是: "+res);		
		}else if(sld==len){
			$("#temp").html("您最终得分是: "+res);		
		}
	}
	$("#submit").click(function(){
		$.post(contextPath+"/user-saveExamRecord",{"score":res,"time":new Date()},function(data){
			if(data=="1"){
				window.location.href= contextPath+"/user-login";
			}else{
				alert("加载题目失败");
			}
		});
	});
	$("#exit").click(function(){
		var r=confirm("确定退出吗?");
   		if (r==true){
   			$.post(contextPath+"/user-exitExam",{"time":new Date()},function(data){
   				if(data=="1"){
   					window.location.href= contextPath+"/user-login";
   				}
   			});
   	  	}else{
   	  		return false;
   	  	}
	});
	$("#prev").click(function(){
		checkbtn();					  
		if(i>0) {
			setporogress(-1);
			}
		});	
	$("#next").click(function(){
		checkbtn();					  
		if(sld>i) {
			setporogress(1);
			}
		});	
	
	$("#issue").find("li").click(function(){								  
			if(!$(this).parents("div.cnt").hasClass("selected")){							
				selec(this);				
				}			
			setporogress(1);
			
			if(i==len){
				result(res);
				}	
			return false;	
		})
	.hover(
		function(){$(this).addClass("hover");},
		function(){$(this).removeClass("hover");}
		);
	
	function result(k){
		var toload;
		if(k>=12 && k<=18) toload=page+" #re0";
		if(k>18 && k<=24) toload=page+" #re1";
		if(k>24 && k<=48) toload=page+" #re2";		
		$("#result").load(toload);		
		}
	function warn(txt){
		$("#war").html(txt).fadeIn(500,function(){$("#war").html("").fadeOut(500);});		
		}
	function checkbtn(){
		if(i<=0){
			$("#prev").addClass("noprev");
			}else{
				$("#prev").removeClass("noprev");
				}
		if(sld<=i){
			$("#next").addClass("nonext");
			}else{
				$("#next").removeClass("nonext");
				}	
		}
	setporogress(i);
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
      <div class="warp">
      	<div class="issue" id="issue">
      	<h1>欢迎参加${sessionScope.paperQuestions[0].paperExam } 考试</h1>
      		<c:forEach var="bean" items="${paperQuestions }">
	            <div class="cnt">
	            	<input type="hidden" name="answer" value="${bean.paperExam }" id="subject"/>
	            	<input type="hidden" name="answer" value="${bean.point }" id="point"/>
	            	<h3>${bean.title }</h3>
	                <ul>
	                	<li><span>&nbsp;</span><label><input type="radio" name="ca" value="0" />${bean.options[0] }</label></li>
	                    <li><span>&nbsp;</span><label><input type="radio" name="cb" value="1" />${bean.options[1] }</label></li>
	                    <li><span>&nbsp;</span><label><input type="radio" name="cc" value="2" />${bean.options[2] }</label></li> 
	                    <li><span>&nbsp;</span><label><input type="radio" name="cd" value="3" />${bean.options[3] }</label></li> 
	                </ul>
	            </div>
            </c:forEach>
            <div class="result" id="result">
            	
            </div>
        </div>
        
        <div class="ctrl">
	        <div class="temp" id="temp">
	        	您的分数
	        </div>
        	<div class="btns">
            	<span title="Previous" class="prev" id="prev">Previous</span>
                <span title="Next" class="next" id="next">Next</span>
            </div>
            <div class="prog" id="prog">
            	<div class="ptip" id="tips"><span></span></div>
            	<div class="ress" id="ress"></div>
            </div>
        </div>
        <div class="war" id="war"></div>
      </div>
      <div class="info">
      		<div class="showRight">
				<div class="huncontent">
					<input type="button" tabindex="2" value="交卷" class="btn btn-primary" id="submit"/>
					<input type="button" tabindex="2" value="放弃本次考试" class="btn btn-primary" id="exit"/>
				</div>
      		</div>
      </div> 
    </div>
</body>
</html>