package com.gitc.home.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUserSh<M extends BaseUserSh<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setUsername(java.lang.String username) {
		set("username", username);
	}

	public java.lang.String getUsername() {
		return get("username");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setCompany(java.lang.String company) {
		set("company", company);
	}

	public java.lang.String getCompany() {
		return get("company");
	}

	public void setJob(java.lang.String job) {
		set("job", job);
	}

	public java.lang.String getJob() {
		return get("job");
	}

	public void setSumarry(java.lang.String sumarry) {
		set("sumarry", sumarry);
	}

	public java.lang.String getSumarry() {
		return get("sumarry");
	}

	public void setConfrenceId(java.lang.Integer confrenceId) {
		set("confrence_id", confrenceId);
	}

	public java.lang.Integer getConfrenceId() {
		return get("confrence_id");
	}

	public void setImage(java.lang.String image) {
		set("image", image);
	}

	public java.lang.String getImage() {
		return get("image");
	}

	public void setType(java.lang.Integer type) {
		set("type", type);
	}

	public java.lang.Integer getType() {
		return get("type");
	}

}
