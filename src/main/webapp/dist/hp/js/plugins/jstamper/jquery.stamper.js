/*
 * Title：在网页上模拟现实中的盖章效果的JQuery插件
 * Author：铁木箱子
 * Email：biqiang.ma@gmail.com
 * Version：0.1
 * 
 */
(function($) {
	$.fn.stamper = function(options) {
		var opts = $.extend({
			id : "jquery_stamper_img", // img对象（自动生成）的id
			scale : 5, // 图片初始大小，在原始图片大小上的倍数
			speed : 600 // 动画持续时间，单位毫秒
		}, options);
		
		var target = this;
		var img = new Image();
		img.src = opts.image;
		img.onload = function() {
			var orgiCoor = getImageCoordinate(target, img);
			var initCoor = getStartCoordinate(target, img, opts.scale);
			var imgObj = getImageElement(opts.id).attr("src", img.src)
				.css({
					position : "absolute",
					opacity : "0",
					left : initCoor.x + "px",
					top : initCoor.y + "px",
					width : initCoor.w + "px",
					height : initCoor.h + "px",
					zIndex: '19999'
				})
				.show()
				.animate({
					opacity : "1",
					left : orgiCoor.x + "px",
					top : orgiCoor.y + "px",
					width : orgiCoor.w + "px",
					height : orgiCoor.h + "px"
				}, opts.speed);
		};
	}
	
	/** 获取img的DOM对象 **/
	function getImageElement(id) {
		var img = $("#" + id);
		if (img.length == 0) {
			return $("<img id=\"" + id + "\" />").appendTo($(document.body)).hide();
		} else {
			return img.hide();
		}
	}
	
	/** 获取图片的落脚坐标点（以当前元素为基准）和尺寸信息，格式：{x:10,y:20,h:100,w:200} **/
	function getImageCoordinate(target, image) {
		var offset = $(target).offset();
		var cx = offset.left + $(target).width()/2;
		var cy = offset.top + $(target).height()/2;
		return {
			x : cx - image.width/2,
			y : cy - image.height/2,
			w : image.width,
			h : image.height
		};
	}
	
	/** 给定倍数（multiple）获取图片的开始位置和大小信息，格式：{x:10,y:20,h:100,w:200} **/
	function getStartCoordinate(target, image, multiple) {
		var offset = $(target).offset();
		var cx = offset.left + $(target).width()/2;
		var cy = offset.top + $(target).height()/2;
		var width = image.width * multiple;
		var height = image.height * multiple;
		return {
			x : cx - width/2,
			y : cy - height/2,
			w : width,
			h : height
		};
	}
})(jQuery);