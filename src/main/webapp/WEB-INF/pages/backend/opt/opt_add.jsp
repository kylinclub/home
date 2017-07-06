<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/backend/commons/header.jsp"%>
<style>
.laydate_box *{
	box-sizing:content-box;
}
.tips{
	font-size: 15px;
	margin-top: 10px;
}
.tips .important{
	font-weight: bolder;
	color:#ff0000;
}
</style>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
			<h2>编辑${p.type=='media'?'合作媒体':p.type=='guide'?'参会指南':'合作伙伴' }</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a href="person_list">合作</a></li>
                <li><a>${p.type=='media'?'合作媒体':p.type=='guide'?'参会指南':'合作伙伴' }</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInDown">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>上传${p.type=='media'?'合作媒体':p.type=='guide'?'参会指南':'合作伙伴' }图片，请注意右侧说明</h5>
					</div>
					<div class="ibox-content">
						<form action="save_opt" class="form-horizontal m-t" id="commentForm" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<div class="col-sm-3">
									<input type="file"  name="pic">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8">
									<input type="hidden" name="opt.id" value="${p.id }">
									<input type="hidden" name="opt.image" value="${p.image }">
									<input type="hidden" name="opt.type" value="${p.type }">
									<button class="btn btn-primary" type="submit">提交保存</button>
									<a class="btn btn-default" href="opt_list">返回</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="alert alert-warning">
					<span class="alert-link" style="font-size: 20px;padding-left:25px;">注意事项：</span>
					<br>
					<ol class="tips">
						<li>为了防止图片加载缓慢，建议上传直接压缩图片，图片宽度最为960像素。</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
    <script>
        $().ready(function () {
        	$("#opt").addClass("active");
        	$("#confrence").addClass("active");
        	$("#opt").parent().addClass("in")
        });
	</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>