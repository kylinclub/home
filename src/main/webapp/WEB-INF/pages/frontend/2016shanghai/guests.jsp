<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/frontend/commons/header.jsp"%>
<div class="container">
	<%@ include file="/WEB-INF/pages/frontend/commons/menu.jsp"%>
	<div class="sub-body">
		<div class="guests">
			<div class="guest-title2"></div>
			<div class="guest-body">
				<div class="guest-list" style="width: auto;text-align: left;">
					<c:forEach var="g" items="${guests }" varStatus="i">
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
					</a>
					</c:forEach>
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