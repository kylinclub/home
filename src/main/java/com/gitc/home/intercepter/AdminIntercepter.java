package com.gitc.home.intercepter;

import javax.servlet.http.HttpSession;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

public class AdminIntercepter implements Interceptor {

	public void intercept(Invocation in) { 
		HttpSession session = in.getController().getSession();
		Object obj = session.getAttribute("sessionuser");
		if(obj!=null && "admin".equals(obj.toString())){
			in.invoke();
		}else{
			in.getController().redirect("/admin/login");
		}
	}

}
