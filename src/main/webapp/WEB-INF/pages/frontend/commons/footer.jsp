<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<p id="back-to-top" class="back-to-top"><a href="#top"><span></span>返回顶部</a></p>  
<div class="foot">
	<div class="foot-content" id="contact">
		<div class="left">
			<div id="support">
				赞助大会&展览展示咨询：bussiness@kylinclub.org
			</div>
			<div id="partner">
				合作单位&合作媒体咨询：gitc@kylinclub.org
			</div>
			<div id="contact">
				致电我们：010-88323888 | 京ICP备14035833号 | 京公网安备11010200322
			</div>
		</div>
		<div class="right">
			<div class="weixin">
				<img src="/dist/ph/img/weixin.png"/>
				<div class="text">麒麟会微信</div>
			</div>
			<div class="weibo">
				<img src="/dist/ph/img/weibo.png"/>
				<div class="text">麒麟会微博</div>
			</div>
		</div>
	</div>
</div>
<script>
$(window).bind("scroll", function() {
	if(document.documentElement.scrollTop + document.body.scrollTop > 100){
		$('.back-to-top').css('display','block')
	}else{
		$('.back-to-top').css('display','none')
	}
});
</script>
</body>
</html>