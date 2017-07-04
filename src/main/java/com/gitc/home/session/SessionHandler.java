package com.gitc.home.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

/**
 * @author WangZhongwei
 *
 */
public class SessionHandler extends Handler {

	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		int index = target.indexOf(";jsessionid");
        target = index==-1?target:target.substring(0, index);
        next.handle(target, request, response, isHandled);
	}

}
