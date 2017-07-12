package com.gitc.home.controller;

import java.util.*;

import com.gitc.home.model.*;
import com.jfinal.core.Controller;
import com.jfinal.render.Render;
import com.gitc.home.util.MailUtil;

public class DataController extends Controller{
	
//	public void schedules(){
//		int id = getParaToInt();
//		renderJson(Schedule.dao.findSchedulesById(id));
//	}
	
	public void banners(){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<Opt> bs = Opt.dao.getAllBanners();
			List<Object> data = new ArrayList<Object>();
			for(int i=0;i<bs.size();i++){
				Opt b = bs.get(i);
				Map<String, Object> d = new HashMap<String, Object>();
				d.put("id", i+1);
				d.put("img", b.getImage());
				d.put("url", b.getUrl());
				data.add(d);
			}
			result.put("data", data);
			result.put("status", 0);
			result.put("msg", "");
			renderJson(result);
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", -1);
			result.put("msg", e.getMessage());
			renderJson(result);
		}
	}
	
	public void users(){
		int page = getParaToInt("page", 1);
		int count = getParaToInt("count", 10);
		String type = getPara("type", "speaker");
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<Object> data = new ArrayList<Object>();
			if("speaker".equals(type)){
				List<Speaker> sps = Speaker.dao.getAllSpeakers(page,count);
				int i=0;
				for(Speaker b : sps){
					i++;
					Map<String, Object> d = new HashMap<String, Object>();
					d.put("id", (page-1)*count+i);
					d.put("img", b.getImage());
					d.put("name", b.getName());
					d.put("company", b.getCompany());
					d.put("title", b.getJob());
					d.put("info", b.getSumarry());
					data.add(d);
				}
			}else{
				int t = "president".equals(type)?1:0;
				List<Guest> gues = Guest.dao.getAllGuests(t, page, count);
				int i=0;
				for(Guest b : gues){
					i++;
					Map<String, Object> d = new HashMap<String, Object>();
					d.put("id", (page-1)*count+i);
					d.put("img", b.getImage());
					d.put("name", b.getName());
					d.put("company", b.getCompany());
					d.put("title", b.getJob());
					d.put("info", b.getSumarry());
					data.add(d);
				}
			}
			
			result.put("data", data);
			result.put("status", 0);
			result.put("msg", "");
			renderJson(result);
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", -1);
			result.put("msg", e.getMessage());
			renderJson(result);
		}
	}
	
	public void guests(){
		int page = getParaToInt("page", 1);
		int count = getParaToInt("count", 10);
		int type = getParaToInt("type", 1);
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<Object> data = new ArrayList<Object>();
			List<UserSh> gues = UserSh.dao.getAllUserShs(type, page, count);
			int i=0;
			for(UserSh b : gues){
				i++;
				Map<String, Object> d = new HashMap<String, Object>();
				d.put("id", (page-1)*count+i);
				d.put("img", b.getImage());
				d.put("name", b.getName());
				d.put("company", b.getCompany());
				d.put("title", b.getJob());
				d.put("info", b.getSumarry());
				data.add(d);
			}
			
			result.put("data", data);
			result.put("status", 0);
			result.put("msg", "");
			renderJson(result);
		}catch(Exception e){
			e.printStackTrace();
			result.put("status", -1);
			result.put("msg", e.getMessage());
			renderJson(result);
		}
	}

	public void contacts() {
		try {
		    String name = getPara("name");
		    String tel = getPara("tel");
			String email = getPara("email");
			String company = getPara("company");
			String department = getPara("department");
			String position = getPara("position");
			String interest = getPara("interest");
			String interest_other = getPara("interest_other");
			String suggest = getPara("suggest");

			Contact cu = getModel(Contact.class);
			cu.setName(name);
			cu.setTel(tel);
			cu.setEmail(email);
			cu.setCompany(company);
			cu.setDepartment(department);
			cu.setPosition(position);
			cu.setInterest(interest);
			cu.setInterestOther(interest_other);
			cu.setSuggest(suggest);
			cu.setAddTime(new Date());

			Contact.dao.saveContact(cu);

			MailUtil.SendToAdmin("GITC管理员通知:\n", cu.toString());
			renderText("ok");
		}catch (Exception e) {
			e.printStackTrace();
			renderError(400);
		}
	}
}
