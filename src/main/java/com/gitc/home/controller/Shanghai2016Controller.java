package com.gitc.home.controller;

import com.gitc.home.intercepter.MobileIntercepter;
import com.gitc.home.model.Guest;
import com.gitc.home.model.Opt;
import com.gitc.home.model.Schedule;
import com.gitc.home.model.Speaker;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

//@Before(MobileIntercepter.class)
public class Shanghai2016Controller extends Controller{

	public void index(){
		setAttr("guests", Guest.dao.getAllGuests());
		setAttr("speakers", Speaker.dao.getAllSpeakers());
		setAttr("sponsor", Opt.dao.getSponsor());
		setAttr("media", Opt.dao.getMedia());
		setAttr("guide", Opt.dao.getGuide());
		renderJsp("index.jsp");
	}
	
	public void guests(){
		setAttr("guests", Guest.dao.getAllGuests());
		renderJsp("guests.jsp");
	}
	
	public void guest(){
		try{
			int id = getParaToInt();
			Guest guest = Guest.dao.getGuestById(id);
			if(guest==null){
				throw new IllegalArgumentException();
			}
			setAttr("guest", guest);
			renderJsp("guest.jsp");
		}catch(Exception e){
			renderError(404);
		}
		
	}
	
	public void speakers(){
		setAttr("speakers", Speaker.dao.getAllSpeakers());
		renderJsp("speakers.jsp");
	}
	
	public void speaker(){
		try{
			int id = getParaToInt();
			Speaker speaker = Speaker.dao.getSpeakerById(id);
			if(speaker==null){
				throw new IllegalArgumentException();
			}
			setAttr("speaker", speaker);
			renderJsp("speaker.jsp");
		}catch(Exception e){
			renderError(404);
		}
	}
	
	public void view(){
		String viewName = getPara();
		renderJsp(viewName+".jsp");
	}
}
