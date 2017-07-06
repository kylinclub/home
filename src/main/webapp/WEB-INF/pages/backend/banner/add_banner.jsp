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
.form-horizontal .control-label{width: 150px;}
</style>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-lg-10">
			<h2>${banner.id==null?"新增":"编辑" }banner</h2>
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
                <li><a href="banner_list">banner</a></li>
                <li><a>${banner.id==null?"新增":"编辑" }</a></li>
            </ol>
		</div>
	</div>
	<div class="wrapper wrapper-content animated fadeInDown">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>上传banner</h5>
					</div>
					<div class="ibox-content">
						<form action="save_banner" class="form-horizontal m-t" id="commentForm" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label">图片：</label>
								<div class="col-sm-3">
									<input type="file"  name="image">
								</div>
								<c:if test="${banner.image!=null }">
									<div class="col-sm-6">
										<span class="text-danger">图片已上传，如果不需要修改，无需再次上传</span>
									</div>
								</c:if>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">URL：</label>
								<div class="col-sm-8">
									<textarea name="banner.url" class="form-control"
										required="" aria-required="true">${banner.url }</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-3">
									<input type="hidden" name="banner.id" value="${banner.id }">
									<input type="hidden" name="banner.type" value="${banner.type }">
									<input type="hidden" name="banner.image" value="${banner.image }">
									<button class="btn btn-primary" type="submit">提交保存</button>
									<a class="btn btn-default" href="banner_list">返回列表</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery Validation plugin javascript-->
    <script src="../dist/hp/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="../dist/hp/js/plugins/validate/messages_zh.min.js"></script>
    <script>
        $.validator.setDefaults({
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            success: function (element) {
                element.closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            errorElement: "span",
            errorClass: "help-block m-b-none",
            validClass: "help-block m-b-none"
        });

        $().ready(function () {
            $("#commentForm").validate();
            
            $("#opt").addClass("active");
        	$("#confrence").addClass("active");
        	$("#opt").parent().addClass("in")
        });
	</script>
<%@ include file="/WEB-INF/pages/backend/commons/footer.jsp"%>