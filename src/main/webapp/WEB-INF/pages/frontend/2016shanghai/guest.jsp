<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/frontend/commons/header.jsp"%>
<style>
.guest img{
	width: 124px;
	height: 124px;
	border-radius: 62px;
	display: inline-block;
	margin: 10px 4px;
}
</style>
<div class="container">
	<%@ include file="/WEB-INF/pages/frontend/commons/menu.jsp"%>
	<div class="sub-body">
		<div class="guests">
			<div class="guest-title2"></div>
			<div class="guest-body" style='margin-left: 50px;'>
				<div class="guest">
					<img src="${guest.image}">
				</div>
				<div class="guest-detail">
					<div>${guest.name }</div>
					<div>${guest.company} ${guest.job}</div>
				</div>
				<div class="guest-infomation">
					<div class="title">
						个人简介：
					</div>
					<div class="content">
						${guest.sumarry }
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="push"></div>
	<div class="push2"></div>
</div>
<script type="text/javascript">
$(".nav").slide({type:"menu",  titCell:".m", targetCell:".sub", delayTime:0, triggerTime:0,returnDefault:false  });
</script>
<%@ include file="/WEB-INF/pages/frontend/commons/footer.jsp"%>