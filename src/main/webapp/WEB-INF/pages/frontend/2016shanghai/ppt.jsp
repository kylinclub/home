<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/frontend/commons/header.jsp"%>
<style>
.vr{
	width: 100%;
    height: 3217px;
    background: url(/dist/ph/img/pptb.png) no-repeat center;
}
.media{
	width: 1000px;
	height: 2900px;
	margin: 0 auto;
}
.comingsoon{
	text-align: center;
	font-size: 50px;
	background-color: #ccc;
	height: 500px;
	line-height: 500px;
}
</style>
<div class="container">
	<%@ include file="/WEB-INF/pages/frontend/commons/menu.jsp"%>
	<div class="sub-body vr">
		<div class="media">
			<img alt="" src="/dist/ph/img/ppt.jpg">
		</div>
	</div>
</div>
<script type="text/javascript">
$(".nav").slide({type:"menu",  titCell:".m", targetCell:".sub", delayTime:0, triggerTime:0,returnDefault:false  });
</script>
</body>
</html>