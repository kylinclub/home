<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/frontend/commons/header.jsp"%>
<div class="container">
	<%@ include file="/WEB-INF/pages/frontend/commons/menu.jsp"%>
	<div class="sub-body">
		<div class="speakers">
			<div class="speaker-title2"></div>
			<div class="speaker-body">
				<div class="speaker-list" style="width: auto;text-align: left;">
					<c:forEach var="g" items="${speakers }" varStatus="i">
					<a href="/2016shanghai/speaker/${g.id }.html">
						<div class="speaker">
							<div class="speaker-face">
								<img alt="" src="${g.image}">
							</div>
							<div class="speaker-info">
								<div class="speaker-name">${g.name}</div>
								<div class="speaker-company">${g.company}</div>
								<div class="speaker-job">${g.job}</div>
							</div>
						</div>
					</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="push"></div>
</div>
<script type="text/javascript">
$(".nav").slide({type:"menu",  titCell:".m", targetCell:".sub", delayTime:0, triggerTime:0,returnDefault:false  });
</script>
<%@ include file="/WEB-INF/pages/frontend/commons/footer.jsp"%>