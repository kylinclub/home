$.simplifyText = function(text) {
	if(text==null){
		return '无';
	}
	var len = text.length;
	if(len <= 10){
		return text;
	}else{
		return text.substring(0,10)+"...";
	}
};
$.download = function(url, data, method){
    if( url && data ){ 
        data = typeof data == 'string' ? data : $.param(data);
        var inputs = '';
        $.each(data.split('&'), function(){ 
            var pair = this.split('=');
            inputs+='<input type="hidden" name="'+ pair[0] +'" value="'+ pair[1] +'" />'; 
        });
        $('<form action="'+ url +'" method="'+ (method||'post') +'">'+inputs+'</form>').appendTo('body').submit().remove();
    };
};
$.deepCopy = function(source){ 
	var result={};
	for(var key in source){
		result[key] = typeof source[key]==='object'?deepCopy(source[key]):source[key];
	}
	return result; 
};
$.longDate = function(value){
	if(value==null){
		return '暂无';
	}
	var value = parseInt(value);	
	var date_d = new Date(value);
	var year = date_d.getFullYear();
	var month = date_d.getMonth()+1;
	var date = date_d.getDate();
	var hour = date_d.getHours();
	var min = date_d.getMinutes();	
	var second = date_d.getSeconds();
	return year+"-"+month+"-"+date+(hour<10?" 0":" ")+hour+(min<10?":0":":")+min+(second<10?":0":":")+second;
};