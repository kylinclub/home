package com.gitc.home.config;

import com.gitc.home.controller.AdminController;
import com.gitc.home.controller.DataController;
import com.gitc.home.controller.IndexController;
import com.gitc.home.controller.Shanghai2016Controller;
import com.gitc.home.controller.mobile.MobileController;
import com.gitc.home.model._MappingKit;
import com.gitc.home.plugin.QuartzPlugin;
import com.gitc.home.session.SessionHandler;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.ModelRecordElResolver;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

public class MainConfig extends JFinalConfig{
	
	public static String TEMPLATE_PATH = "/WEB-INF/pages/";

	@Override
	public void configConstant(Constants me) {
		PropKit.use("system.properties");
        me.setDevMode(PropKit.getBoolean("devMode", false));
        me.setViewType(ViewType.JSP);
        me.setBaseViewPath(TEMPLATE_PATH);
//        me.setErrorView(401, TEMPLATE_PATH +"error/401.jsp");
//        me.setErrorView(403, TEMPLATE_PATH +"error/403.jsp");
        me.setErrorView(404, TEMPLATE_PATH +"frontend/error/404.jsp");
//        me.setErrorView(500, TEMPLATE_PATH +"error/500.jsp");
	}

	@Override
	public void configRoute(Routes me) {
		me.add("/admin", AdminController.class,"/backend");
		me.add("/data", DataController.class);
//		me.add("/2016shanghai", Shanghai2016Controller.class,"/frontend/2016shanghai");
		me.add("/", IndexController.class, "/frontend");
//		me.add("/mobile", MobileController.class,"/mobile");
	}

	@Override
	public void configPlugin(Plugins me) {
		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("datasource.url"), PropKit.get("datasource.user"), PropKit.get("datasource.password").trim());
		me.add(c3p0Plugin);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		_MappingKit.mapping(arp);
//		me.add(new QuartzPlugin());
	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new SessionInViewInterceptor());
	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new SessionHandler());
//		me.add(new FakeStaticHandler());
	}

	public static void main(String[] args) {
		JFinal.start("src/main/webapp/", 808, "/", 5);
	}
	
	@Override
	public void afterJFinalStart() {
		ModelRecordElResolver.setResolveBeanAsModel(true);
	}
}
