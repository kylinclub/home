<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="footer">
	<div>
		<strong>Copyright</strong> 麒麟会 &copy; 2016
	</div>
</div>
</div>
</div>
<script>
	var url = window.location.href;
	var host = window.location.host;
	url = url.substring(url.indexOf(host) + host.length);
	if (url != '') {
		var us = url.split('/');
		$("#" + us[1]).addClass("active")
		if(typeof us[2] != 'undefined'  &&us[2]!='index' && us[2].indexOf('?')==-1)
			$("#" + us[2]).addClass("active")
	}

	$.ajaxSetup({
		//{"readyState":0,"status":0,"statusText":"abort"}
		//{"readyState":0,"status":0,"statusText":"error"}
		error : function(jqXHR, textStatus, errorThrown) {
			alert(JSON.stringify(jqXHR))
			switch (jqXHR.status) {
			case (500):
				layer.alert('服务器系统内部错误', {
					title : '500',
					icon : 2
				});
				break;
			case (401):
				layer.alert('权限不足', {
					title : '401',
					icon : 2
				});
				break;
			case (403):
				layer.alert('权限不足', {
					title : '403',
					icon : 2
				});
				break;
			case (404):
				layer.alert('页面找不到了', {
					title : '404',
					icon : 2
				});
				break;
			case (0):
				if(jqXHR.statusText!='abort'){
					layer.alert('登陆失效，请刷新页面或者重新登陆', {
						title : 'ajax error',
						icon : 2
					});
				}
				break;
			default:
				break;
			}
		}
	});
</script>
</body>
</html>