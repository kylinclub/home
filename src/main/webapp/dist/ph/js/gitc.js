$(document).ready(function(){
	var loadSchedules = function(id){
		$.ajax({
			type:"get",
			url:"/data/schedules/"+id+".html",
			async:true,
			success:function(data){
				var html = '';
				$.each(data,function(i,obj){
					if(typeof obj === 'string'){
						html+='<tr class="schedule-thead"><th colspan="3">'+obj+'</th></tr>'
					}else{
						if(i==1){
							html+='<tr class="schedule-ttitle"><td class="schedule-date">时间</td><td class="schedule-content">主题</td><td class="schedule-speaker">嘉宾</td></tr>'
						}
						html+='<tr class="schedule-content"><td>'+obj.time_str+'</td><td>'+obj.title+'</td>';
						html+='<td>'+' '+obj.name+' '+ obj.job +' ' +obj.company+'</td></tr>'
					}
				})
				$('.schedule-table').html(html)
			}
		})
	}
	loadSchedules(1);
	$('.schedule-region').click(function(){
		var _this = $(this),id=_this.data('id');
		_this.siblings().removeClass('on');
		_this.addClass('on');
		loadSchedules(id)
	});
})