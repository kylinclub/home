<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/frontend/commons/header.jsp"%>
<div class="container">
	<div class="banner">
	</div>
	<div class="body">
		<div class="gitc-title"></div>
		<div class="gitc-content">
			GITC全球互联网技术大会由麒麟会主办，iTech Club（互联网技术精英俱乐部）协办。以汇聚行业精英、促进技术交流、加深商务合作、推动行业发展为大会宗旨，致力于打造全球领先的互联网技术交流与商务合作平台。定位为专业、开放、国际化的大型会议会展平台，GITC希望以高品质的会议内容和多元化的展现形式令参会企业及个人能够更加确切的把握互联网行业最新技术走势，促进行业及其技术的交流与发展，构建资源共享，深化宣传与合作，实现多方共赢。 
			<br>GITC全球互联网技术大会始终走在互联网技术交流分享的最前端，是目前国内规模最大、资源最成熟的技术峰会，同时也是中国互联网一年一度的行业盛事。
		</div>
		<div class="slide-box">
			<div class="slide-bd">
				<ul>
					<li><a href="/2016shanghai/index.html"><img src="/dist/ph/img/slide/index-silde-1.png" /></a></li>
					<li><a href="javascript:void(0)" onclick="tips('敬请期待')"><img src="/dist/ph/img/slide/index-silde-2.png" /></a></li>
					<li><a href="javascript:void(0)" onclick="tips('敬请期待')"><img src="/dist/ph/img/slide/index-silde-3.png" /></a></li>
				</ul>
			</div>
			<a class="slide-prev prev" href="javascript:void(0)"></a>
			<a class="slide-next next" href="javascript:void(0)"></a>
		</div>
		<div class="devider"></div>
		<div class="kylin-club">
			<a href="http://www.kylinclub.org/" class="kylin-club-go" target="_blank"></a>
		</div>
	</div>
	<div class="push"></div>
</div>
<script type="text/javascript">
	$(".slide-box").slide({mainCell:".slide-bd ul",effect:"fold",autoPlay:true,delayTime:1500});
	function tips(str){
		layer.msg(str)
	}
</script>
<%@ include file="/WEB-INF/pages/frontend/commons/footer.jsp"%>