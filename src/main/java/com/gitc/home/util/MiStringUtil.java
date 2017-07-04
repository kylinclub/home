package com.gitc.home.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class MiStringUtil {

	private static Random randGen = null;
	private static char[] numbersAndLetters = null;

	public static final String randomString(int length) {
		if (length < 1) {
			return null;
		}
		if (randGen == null) {
			randGen = new Random();
			numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" + "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			sb.append(numbersAndLetters[randGen.nextInt(71)]);
		}
		return sb.toString();
	}
	
	public static final String date(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}
}
