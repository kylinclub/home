package com.gitc.home.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

public class FakeStaticHandler extends Handler{

	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		// TODO Auto-generated method stub
		int index = target.lastIndexOf(".html");
		if(index != -1){
			//请求中包含.html后缀
			target = target.substring(0, index) + target.substring(index+5);
		}
		nextHandler.handle(target, request, response, isHandled);
	}
}
