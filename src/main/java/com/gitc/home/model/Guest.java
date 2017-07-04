package com.gitc.home.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gitc.home.model.base.BaseGuest;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Guest extends BaseGuest<Guest> {
	public static final Guest dao = new Guest();

	public List<Guest> getAllGuestsFromDb() {
		return dao.find("select * from `guest` order by username asc");
	}

	public List<Guest> getAllGuests() {
		return dao.find("select * from `guest` order by username asc");
	}
	
	public List<Guest> getAllGuests(int t) {
		return dao.find("select * from `guest` where type = ? order by username asc", t);
	}
	
	public void saveOrUpdate(Guest guest) {
		if(guest.getId()==null){
			guest.save();
		}else{
			guest.update();
		}
	}

	public void importAll(final List<Guest> list) {
		List<Guest> oldps = getAllGuests();
		final Map<String,String> pic_map = new HashMap<String, String>();
		for(Guest p : oldps){
			pic_map.put(p.getUsername(), p.getImage());
		}
		Db.tx(new IAtom() {
			public boolean run() throws SQLException {
				Db.update("delete from `guest`");
				for(Guest g : list){
					g.setImage(pic_map.get(g.getUsername()));
					g.save();
				}
				return true;
			}
		});
	}

	public Guest getGuestById(int id) {
		return dao.findById(id);
	}

	public void importAll(final List<Guest> list, final int t) {
		List<Guest> oldps = getAllGuests(t);
		final Map<String,String> pic_map = new HashMap<String, String>();
		for(Guest p : oldps){
			pic_map.put(p.getUsername(), p.getImage());
		}
		Db.tx(new IAtom() {
			public boolean run() throws SQLException {
				Db.update("delete from `guest` where type = ?", t);
				for(Guest g : list){
					g.setImage(pic_map.get(g.getUsername()));
					g.save();
				}
				return true;
			}
		});
	}

	public List<Guest> getAllGuests(int t, int page, int count) {
		return dao.find("select * from `guest` where type = ? order by username "
				+ "asc limit ?,?", t, (page-1)*count, count);
	}
}
