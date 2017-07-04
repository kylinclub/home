package com.gitc.home.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

/**
 * 功能概述：<br>
 * 
 */
public class ChineseToPinyinUtil {
	/**   */
	public static final String UNICODE_PINYIN = "unicode_to_hanyu_pinyin.txt";

	/**   */
	public static final String PINYIN = "pinyin.txt";

	/** A hash table contains <Unicode, HanyuPinyin> pairs */
	private static Properties unicode2Pinyin = null;

	/** pingYinSet */
	private static Set<String> pingYinSet = new HashSet<String>(79);

	static {
		// 执行资源加载
		initialize();
	}

	/**
	 * 
	 */
	private static void initialize() {
		try {
			Reader reader = new InputStreamReader(ClassUtil.getClassPathRes(UNICODE_PINYIN), Charset.forName("UTF-8"));
			unicode2Pinyin = new Properties();
			unicode2Pinyin.load(reader);
			reader.close();

			reader = new InputStreamReader(ClassUtil.getClassPathRes(PINYIN), Charset.forName("UTF-8"));
			BufferedReader buffReader = new BufferedReader(reader);
			String line = buffReader.readLine();
			while (line != null) {
				pingYinSet.add(line);
				line = buffReader.readLine();
			}
			buffReader.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @param record
	 *            given record string of Hanyu Pinyin
	 * @return return true if record is not null and record is not "none0" and
	 *         record is not mal-formatted, else return false
	 */
	private static boolean isValidRecord(String record) {
		final String noneStr = "(none0)";

		if ((null != record) && !record.equals(noneStr)) {
			return true;
		} else
			return false;
	}

	/**
	 * @param ch
	 * @return
	 */
	public static String getHanyuPinyinRecordFromChar(char ch) {
		int codePointOfChar = ch;
		String codepointHexStr = Integer.toHexString(codePointOfChar).toUpperCase();
		String foundRecord = unicode2Pinyin.getProperty(codepointHexStr);
		return ChineseToPinyinUtil.isValidRecord(foundRecord) ? foundRecord : null;
	}

	/**
	 * 判断某个字符是否是拼音
	 * 
	 * @param pinyin
	 * @return
	 */
	public static boolean isPinYin(String pinyin) {
		return pingYinSet.contains(pinyin);
	}

	/**
	 * Singleton factory method.
	 * 
	 * @return the one and only MySingleton.
	 */
	public static ChineseToPinyinUtil getInstance() {
		return ChineseToPinyinResourceHolder.theInstance;
	}

	/**
	 * Singleton implementation helper.
	 */
	private static class ChineseToPinyinResourceHolder {
		static final ChineseToPinyinUtil theInstance = new ChineseToPinyinUtil();
	}
	
	public static String getPinyin(String name){
		if(name==null){
			return null;
		}
		char[] chars = name.toCharArray();
		StringBuffer sb = new StringBuffer();
		for(char c : chars){
			String py = getHanyuPinyinRecordFromChar(c);
			if(py!=null){
				if(py.contains(",")){
					sb.append(py.substring(0, py.indexOf(",")));
				}else{
					sb.append(py);
				}
			}else{
				sb.append(c);
			}
		}
		return sb.toString();
	}
}
