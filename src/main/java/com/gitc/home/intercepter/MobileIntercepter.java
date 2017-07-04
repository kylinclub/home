package com.gitc.home.intercepter;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

public class MobileIntercepter implements Interceptor{

	public void intercept(Invocation ai) {
		String ua = ai.getController().getRequest().getHeader("user-agent");
		String url = ai.getController().getRequest().getRequestURI();
		if(url.startsWith("/data/")){
			//接口请求，直接返回
			ai.invoke();
		}
		if(!ua.contains("Mobile")){
			//pc访问
			if(url.startsWith("/mobile/")){
				url = url.substring(7);
				ai.getController().redirect(url);
			}else{
				ai.invoke();
			}
		}else{
			if(!url.startsWith("/mobile/")){
				ai.getController().redirect("/mobile"+url);
			}else{
				ai.invoke();
			}
		}
	}

}
