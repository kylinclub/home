package com.gitc.home.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gitc.home.model.*;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.gitc.home.intercepter.AdminIntercepter;
import com.gitc.home.util.ChineseToPinyinUtil;
import com.gitc.home.util.MiStringUtil;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.upload.UploadFile;

@Before(AdminIntercepter.class)
public class AdminController extends Controller{

	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	public void index(){
		renderJsp("index.jsp");
	}
	
	@Clear
	public void login(){
		renderJsp("login.jsp");
	}
	
	@Clear
	public void logon(){
		String username = getPara("username");
		String password = getPara("password");
		if(PropKit.get("admin", "admin").equals(username) && PropKit.get("password", "admin").equals(password)){
			getSession().setAttribute("sessionuser", username);
			redirect("/admin/index");
		}else{
			setAttr("msg", "用户名或密码错误");
			renderJsp("login.jsp");
		}
	}

	public void speaker_list(){
		setAttr("speakers", Speaker.dao.getAllSpeakersFromDb());
		renderJsp("speaker/speaker_list.jsp");
	}
	
	public void add_speaker(){
		setAttr("speaker", new Speaker());
		renderJsp("speaker/speaker_add.jsp");
	}
	
	public void save_speaker(){
		//保存前台传递过来的数据
		//首先保存图片
		String path = PathKit.getWebRootPath();
		String pic_url = "/uploadfiles/"+sdf.format(new Date())+"/";
		File root = new File(path+pic_url);
		if(!root.exists()){
			root.mkdir();
		}
		//获取头像
		UploadFile upload = getFile();
		//获取其他参数
		Speaker speaker = getModel(Speaker.class);
		String fileName = speaker.getStr("username")+ MiStringUtil.randomString(4) +".jpg";
		if(upload!=null){
			//头像有变更
			System.out.println("头像有变更");
			try {
				FileUtils.copyFile(upload.getFile(), new File(path + pic_url + fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			speaker.setImage(pic_url+fileName);
		}
		Speaker.dao.saveOrUpdate(speaker);
		redirect("/admin/speaker_list");
	}
	
	public void delete_speaker(){
		int id = getParaToInt("id");
		System.out.println("删除id为 "+id+" 的嘉宾记录");
		Speaker.dao.deleteById(id);
		renderJson("{\"code\":200}");
	}
	
	public void edit_speaker(){
		int id = getParaToInt("id");
		System.out.println("编辑id为 "+id+" 的嘉宾记录");
		setAttr("speaker", Speaker.dao.findById(id));
		renderJsp("speaker/speaker_add.jsp");
	}
	
	public void import_speaker(){
		renderJsp("speaker/speaker_import.jsp");
	}
	
	public void speaker_import(){
		List<Speaker> speakers = new ArrayList<Speaker>();
		UploadFile upload = getFile();
		try {
//			FileUtils.copyFile(upload.getFile(), new File(path + file_url + MiStringUtil.randomString(4)+".xlsx"));
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(upload.getFile()));
			HSSFSheet sheet = workbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();
					Speaker speaker = new Speaker();
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell != null) {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_STRING:
								String ss = cell.getStringCellValue();
								if(j==1){
									speaker.setName(ss);
									speaker.setUsername(ChineseToPinyinUtil.getPinyin(ss));
								}else if(j==2){
									speaker.setCompany(ss);
								}else if(j==3){
									speaker.setJob(ss);
								}
//								else if(j==5){
//									speaker.setTitle(ss);
//								}
								else if(j==4){
									speaker.setSumarry(ss);
								}
//								else if(j==7){
//									speaker.setContent(ss);
//								}
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								int id = (int) cell.getNumericCellValue();
//								if(j == 1){
//									speaker.setRegionId(id);
//									speaker.setRegionName(Region.regions[id]);
//								}else 
								if(j == 0){
									speaker.setId(id);
								}
								break;
							default:
								break;
							}
						}
					}
					speakers.add(speaker);
				}
			}
			setAttr("speakers", speakers);
			setAttr("count", speakers.size());
			Speaker.dao.importAll(speakers);
			renderJsp("speaker/speaker_import_result.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void guest_list(){
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		setAttr("guests", Guest.dao.getAllGuests(t));
		renderJsp("guest/guest_list.jsp");
	}
	
	public void add_guest(){
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		Guest p = new Guest();
		p.setType(t);
		setAttr("guest", p);
		renderJsp("guest/guest_add.jsp");
	}
	
	public void save_guest(){
		//保存前台传递过来的数据
		//首先保存图片
		String path = PathKit.getWebRootPath();
		String pic_url = "/uploadfiles/"+sdf.format(new Date())+"/";
		File root = new File(path+pic_url);
		if(!root.exists()){
			root.mkdir();
		}
		//获取头像
		UploadFile upload = getFile();
		//获取其他参数
		Guest guest = getModel(Guest.class);
		String fileName = guest.getUsername()+ MiStringUtil.randomString(4) +".jpg";
		if(upload!=null){
			//头像有变更
			System.out.println("头像有变更");
			try {
				FileUtils.copyFile(upload.getFile(), new File(path + pic_url + fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			guest.setImage(pic_url+fileName);
		}
		Guest.dao.saveOrUpdate(guest);
		redirect("/admin/guest_list");
	}
	
	public void delete_guest(){
		int id = getParaToInt("id");
		System.out.println("删除id为 "+id+" 的嘉宾记录");
		Guest.dao.deleteById(id);
		renderJson("{\"code\":200}");
	}
	
	public void edit_guest(){
		int id = getParaToInt("id");
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		System.out.println("编辑id为 "+id+" 的嘉宾记录");
		setAttr("guest", Guest.dao.findById(id));
		renderJsp("guest/guest_add.jsp");
	}
	
	public void import_guest(){
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		renderJsp("guest/guest_import.jsp");
	}
	
	public void guest_import(){
		List<Guest> list = new ArrayList<Guest>();
		UploadFile upload = getFile();
		int t = getParaToInt("type", 1);
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(upload.getFile()));
			HSSFSheet sheet = workbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();
					Guest guest = new Guest();
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell != null) {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_STRING:
								String ss = cell.getStringCellValue();
								if(j==1){
									guest.setName(ss);
									guest.setUsername(ChineseToPinyinUtil.getPinyin(ss));
								}else if(j==2){
									guest.setCompany(ss);
								}else if(j==3){
									guest.setJob(ss);
								}else if(j==4){
									guest.setSumarry(ss);
								}
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
//								if(j == 0){
//									int id = (int) cell.getNumericCellValue();
//									guest.setId(id);;
//								}
								break;
							default:
								break;
							}
						}
					}
					guest.setType(t);
					list.add(guest);
				}
			}
			setAttr("guests", list);
			setAttr("count", list.size());
			setAttr("type", t);
			Guest.dao.importAll(list, t);
			renderJsp("guest/guest_import_result.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void schedule_list(){
		setAttr("schedules", Schedule.dao.getAllSchedulesFromDb());
		renderJsp("schedule/schedule_list.jsp");
	}
	
	public void add_schedule(){
		setAttr("schedule", new Schedule());
		renderJsp("schedule/schedule_add.jsp");
	}
	
	public void save_schedule(){
		//保存前台传递过来的数据
		Schedule schedule = getModel(Schedule.class);
		Schedule.dao.saveOrUpdate(schedule);
		redirect("/admin/schedule_list");
	}
	
	public void delete_schedule(){
		int id = getParaToInt("id");
		System.out.println("删除id为 "+id+" 的议程记录");
		Schedule.dao.deleteById(id);
		renderJson("{\"code\":200}");
	}
	
	public void edit_schedule(){
		int id = getParaToInt("id");
		System.out.println("编辑id为 "+id+" 的议程记录");
		setAttr("schedule", Schedule.dao.findById(id));
		renderJsp("schedule/schedule_add.jsp");
	}
	
	public void import_schedule(){
		renderJsp("schedule/schedule_import.jsp");
	}
	
	public void schedule_import(){
		List<Schedule> schedules = new ArrayList<Schedule>();
		UploadFile upload = getFile();
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(upload.getFile()));
			HSSFSheet sheet = workbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();
					Schedule schedule = new Schedule();
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell != null) {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_STRING:
								String ss = cell.getStringCellValue();
								if(j==1){
									schedule.setDateStr(ss);
								}else if(j==2){
									schedule.setTimeStr(ss);
								}else if(j==3){
									schedule.setName(ss);
								}else if(j==4){
									schedule.setCompany(ss);
								}else if(j==5){
									schedule.setJob(ss);
								}else if(j==6){
									schedule.setTitle(ss);
								}
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								int id = (int) cell.getNumericCellValue();
								if(j == 0){
									schedule.setReginId(id);
									schedule.setReginName(Region.regions[id]);
								}
								break;
							default:
								break;
							}
						}
					}
					schedules.add(schedule);
				}
			}
			setAttr("schedules", schedules);
			setAttr("count", schedules.size());
			Schedule.dao.importAll(schedules);
			renderJsp("schedule/schedule_import_result.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void opt_list(){
		setAttr("sponsor", Opt.dao.getSponsor());
		setAttr("media", Opt.dao.getMedia());
		setAttr("guide", Opt.dao.getGuide());
		renderJsp("opt/opt_list.jsp");
	}
	
	public void edit_opt(){
		int id = getParaToInt("id");
		System.out.println("编辑id为 "+id+" 的记录");
		setAttr("p", Opt.dao.findById(id));
		renderJsp("opt/opt_add.jsp");
	}
	
	public void save_opt(){
		//保存前台传递过来的数据
		//首先保存图片
		String path = PathKit.getWebRootPath();
		String pic_url = "/uploadfiles/"+sdf.format(new Date())+"/";
		File root = new File(path+pic_url);
		if(!root.exists()){
			root.mkdir();
		}
		//获取头像
		UploadFile upload = getFile();
		//获取其他参数
		Opt ex = getModel(Opt.class);
		String fileName = MiStringUtil.randomString(10) +".png";
		if(upload!=null){
			System.out.println("图片有变更");
			try {
				FileUtils.copyFile(upload.getFile(), new File(path + pic_url + fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.setImage(pic_url+fileName);
		}
		ex.update();
		redirect("/admin/opt_list");
	}
	
	public void banner_list(){
		setAttr("banners", Opt.dao.getAllBanners());
		renderJsp("banner/banner_list.jsp");
	}
	
	public void add_banner(){
		Opt banner = new Opt();
		banner.setType("banner");
		setAttr("banner", banner);
		renderJsp("banner/add_banner.jsp");
	}
	
	public void edit_banner(){
		int id = getParaToInt("id");
		setAttr("banner", Opt.dao.findById(id));
		renderJsp("banner/add_banner.jsp");
	}
	
	public void save_banner(){
		String path = PathKit.getWebRootPath();
		String pic_url = "/uploadfiles/"+sdf.format(new Date())+"/";
		File root = new File(path+pic_url);
		if(!root.exists()){
			root.mkdir();
		}
		//获取头像
		UploadFile upload = getFile();
		//获取其他参数
		Opt ex = getModel(Opt.class, "banner");
		String fileName = MiStringUtil.randomString(10) +".png";
		if(upload!=null){
			System.out.println("图片有变更");
			try {
				FileUtils.copyFile(upload.getFile(), new File(path + pic_url + fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			ex.setImage(pic_url+fileName);
		}
		if(ex.getId()==null){
			ex.save();
		}else{
			ex.update();
		}
		redirect("/admin/banner_list");
	}
	
	public void delete_banner(){
		int id = getParaToInt("id");
		System.out.println("删除id为 "+id+" 的banner记录");
		Opt.dao.deleteById(id);
		renderJson("{\"code\":200}");
	}
	
	//*******************************
	
	public void user_list(){
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		setAttr("guests", UserSh.dao.getAllUserShs(t));
		renderJsp("user/user_list.jsp");
	}
	
	public void add_user(){
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		UserSh p = new UserSh();
		p.setType(t);
		setAttr("guest", p);
		renderJsp("user/user_add.jsp");
	}
	
	public void save_user(){
		//保存前台传递过来的数据
		//首先保存图片
		String path = PathKit.getWebRootPath();
		String pic_url = "/uploadfiles/"+sdf.format(new Date())+"/";
		File root = new File(path+pic_url);
		if(!root.exists()){
			root.mkdir();
		}
		//获取头像
		UploadFile upload = getFile();
		//获取其他参数
		UserSh guest = getModel(UserSh.class, "guest");
		String fileName = guest.getUsername()+ MiStringUtil.randomString(4) +".jpg";
		if(upload!=null){
			//头像有变更
			System.out.println("头像有变更");
			try {
				FileUtils.copyFile(upload.getFile(), new File(path + pic_url + fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			guest.setImage(pic_url+fileName);
		}
		UserSh.dao.saveOrUpdate(guest);
		redirect("/admin/user_list?type="+guest.getType());
	}
	
	public void delete_user(){
		int id = getParaToInt("id");
		System.out.println("删除id为 "+id+" 的sh嘉宾记录");
		UserSh.dao.deleteById(id);
		renderJson("{\"code\":200}");
	}
	
	public void edit_user(){
		int id = getParaToInt("id");
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		System.out.println("编辑id为 "+id+" 的sh嘉宾记录");
		setAttr("guest", UserSh.dao.findById(id));
		renderJsp("user/user_add.jsp");
	}
	
	public void import_user(){
		int t = getParaToInt("type", 1);
		setAttr("type", t);
		renderJsp("user/user_import.jsp");
	}
	
	public void user_import(){
		List<UserSh> list = new ArrayList<UserSh>();
		UploadFile upload = getFile();
		int t = getParaToInt("type", 1);
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(upload.getFile()));
			HSSFSheet sheet = workbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();
					UserSh guest = new UserSh();
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell != null) {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_STRING:
								String ss = cell.getStringCellValue();
								if(j==1){
									guest.setName(ss);
									guest.setUsername(ChineseToPinyinUtil.getPinyin(ss));
								}else if(j==2){
									guest.setCompany(ss);
								}else if(j==3){
									guest.setJob(ss);
								}else if(j==4){
									guest.setSumarry(ss);
								}
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
//								if(j == 0){
//									int id = (int) cell.getNumericCellValue();
//									guest.setId(id);;
//								}
								break;
							default:
								break;
							}
						}
					}
					guest.setType(t);
					list.add(guest);
				}
			}
			setAttr("guests", list);
			setAttr("count", list.size());
			setAttr("type", t);
			UserSh.dao.importAll(list, t);
			renderJsp("user/user_import_result.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void contact_list() {
		setAttr("contacts", Contact.dao.getAllContactsFromDb());
		renderJsp("contact/contact_list.jsp");
	}

	public void delete_contact() {
		int id = getParaToInt("id");
		Contact.dao.deleteContact(id);
		renderJson("{\"code\":200}");
	}
}
