<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/frontend/commons/header.jsp"%>
<script src="/dist/ph/js/gitc.js"></script>
<style>
.btns{
	width: 300px;
	margin: 0 auto;
	height: 32px;
	padding-top: 400px;
}
.live1{
	background-image: url("/dist/ph/img/live1.png");
	width: 139px;
	height: 32px;
	display: inline-block;
}
.live2{
	background-image: url("/dist/ph/img/live2.png");
	width: 139px;
	height: 32px;
	display: inline-block;
}
</style>
<div class="container">
	<%@ include file="/WEB-INF/pages/frontend/commons/menu.jsp"%>
	<div class="sub-banner-pic">
	<div class="btns">
		<a class="live1" href="http://mudu.tv/watch/194909" target="_blank"></a>
		<a class="live2" href="view/vr.html" target="_blank"></a>
	</div>
	</div>
	<div class="sub-body">
		<div class="schedule" id="schedule">
			<div class="schedule-title"></div>
			<div class="schedule-body">
				<div class="schedule-regions schedule-nums-5">
					<div class="schedule-region on" data-id="1">
						主会场
					</div>
					<div class="schedule-region" data-id="2">
						云专场
					</div>
					<div class="schedule-region" data-id="3">
						运维专场
					</div>
					<div class="schedule-region" data-id="4">
						大数据专场
					</div>
					<div class="schedule-region" data-id="5">
						技术&产品专场
					</div>
				</div>
				<table class="schedule-table">
				
				</table>
			</div>
		</div>
	</div>
	<img src="/dist/ph/img/sh-content-1.png" style="width: 100%;" id="strengths"/>
	<img src="/dist/ph/img/sh-content-2.png" style="width: 100%;" id="structure"/>
	<div class="sub-body">
		<div class="guests multipleColumn" id="guest">
			<div class="guest-title"></div>
			<div class="guest-body slide-guest-box">
				<div class="guest-list">
					<c:forEach var="g" items="${guests }" varStatus="i">
					<c:if test="${i.index%18==0 }">
					<ul><!-- 把每次滚动的n个li放到1个ul里面 -->
					</c:if>
						<li>
						<a href="/2016shanghai/guest/${g.id }.html">
							<div class="guest">
									<div class="guest-face">
										<img alt="" src="${g.image}">
									</div>
									<div class="guest-info">
										<div class="guest-name">${g.name}</div>
										<div class="guest-company">${g.company}</div>
										<div class="guest-job">${g.job}</div>
									</div>
							</div>
						</li>
						</a>
					<c:if test="${i.index%18==17}">
					</ul>
					</c:if>
					</c:forEach>
				</div>
				<a class="slide-prev prev" href="javascript:void(0)"></a>
				<a class="slide-next next" href="javascript:void(0)"></a>
			</div>
			<a class="show-more" href="/2016shanghai/guests.html"></a>
		</div>
		<div class="myspeakers multipleColumn" id="speaker">
			<div class="speaker-title"></div>
			<div class="speaker-body slide-guest-box">
				<div class="speaker-list">
					<c:forEach var="g" items="${speakers }" varStatus="i">
					<c:if test="${i.index%18==0 }">
					<ul><!-- 把每次滚动的n个li放到1个ul里面 -->
					</c:if>
						<li>
						<a href="/2016shanghai/speaker/${g.id }.html">
							<div class="guest">
									<div class="guest-face">
										<img alt="" src="${g.image}">
									</div>
									<div class="guest-info">
										<div class="guest-name">${g.name}</div>
										<div class="guest-company">${g.company}</div>
										<div class="guest-job">${g.job}</div>
									</div>
							</div>
						</a>
						</li>
					<c:if test="${i.index%18==17 }">
					</ul>
					</c:if>
					</c:forEach>
				</div>
				<a class="slide-prev prev" href="javascript:void(0)"></a>
				<a class="slide-next next" href="javascript:void(0)"></a>
			</div>
			<a class="show-more" href="/2016shanghai/speakers.html"></a>
		</div>
		<div class="speakers" id="sponsor">
			<div class="sponsor-title"></div>
			<img src="${sponsor.image }" />
		</div>
			
		<div class="speakers" id="media">
			<div class="media-title"></div>
			<img src="${media.image }" />
		</div>
			
		<div class="speakers" id="guide">
			<div class="guide-title"></div>
			<img src="${guide.image }" />
		</div>
	</div>
	<div class="push"></div>
	<div class="push2"></div>
</div>
<script type="text/javascript">
$(".nav").slide({type:"menu",  titCell:".m", targetCell:".sub", delayTime:0, triggerTime:0,returnDefault:false  });
$('.guests').slide({mainCell:".guest-list",effect:"leftLoop",autoPlay:true,vis:1,scroll:1});
$('.myspeakers').slide({mainCell:".speaker-list",effect:"leftLoop",autoPlay:true,vis:1,scroll:1});
</script>
<%@ include file="/WEB-INF/pages/frontend/commons/footer.jsp"%>