package com.gitc.home.controller.mobile;

import com.gitc.home.intercepter.MobileIntercepter;
import com.gitc.home.model.Guest;
import com.gitc.home.model.Speaker;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

@Before(MobileIntercepter.class)
public class MobileController extends Controller{

	public void index(){
		renderJsp("index.jsp");
	}
	
	public void guests(){
		setAttr("guests", Guest.dao.getAllGuests());
		renderJsp("shanghai2016/guests.jsp");
	}
	
	public void guest(){
		try{
			int id = getParaToInt();
			Guest guest = Guest.dao.getGuestById(id);
			if(guest==null){
				throw new IllegalArgumentException();
			}
			setAttr("guest", guest);
			renderJsp("shanghai2016/guest.jsp");
		}catch(Exception e){
			renderError(404);
		}
	}
	
	public void speakers(){
		setAttr("speakers", Speaker.dao.getAllSpeakers());
		renderJsp("shanghai2016/speakers.jsp");
	}
	
	public void speaker(){
		try{
			int id = getParaToInt();
			Speaker speaker = Speaker.dao.getSpeakerById(id);
			if(speaker==null){
				throw new IllegalArgumentException();
			}
			setAttr("speaker", speaker);
			renderJsp("shanghai2016/speaker.jsp");
		}catch(Exception e){
			renderError(404);
		}
		
	}
	
	@ActionKey("/mobile/gitc2016-shanghai")
	public void gitc(){
		setAttr("guests", Guest.dao.getAllGuests());
		setAttr("speakers", Speaker.dao.getAllSpeakers());
		renderJsp("shanghai2016/index.jsp");
	}
}
