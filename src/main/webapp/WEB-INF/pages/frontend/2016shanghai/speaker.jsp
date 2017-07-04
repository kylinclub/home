<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/frontend/commons/header.jsp"%>
<style>
.speaker img{
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
		<div class="speakers">
			<div class="speaker-title2"></div>
			<div class="speaker-body" style='margin-left: 50px;'>
				<div class="speaker">
					<img src="${speaker.image}" />
				</div>
				<div class="speaker-detail">
					<div>${speaker.name }</div>
					<div>${speaker.company} ${speaker.job}</div>
				</div>
				<div class="speaker-infomation">
					<div class="about">
						所属会场：${speaker.region_name }
					</div>
					<div class="about">
						演讲主题：${speaker.title }
					</div> 
					<div class="content" style="margin-top: 20px">
						个人简介：${speaker.sumarry }
					</div>
					<div class="content">
						主题简介：${speaker.content }
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