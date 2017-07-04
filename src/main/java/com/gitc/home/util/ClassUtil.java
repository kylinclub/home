package com.gitc.home.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * 功能概述：<br>
 * Java Class Utility Tools
 * 
 */
public abstract class ClassUtil {
	/**
	 * 取得当前的类加载器
	 * 
	 * @return
	 */
	public static ClassLoader getClassLoader() {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		if (classLoader == null) {
			classLoader = ClassUtil.class.getClassLoader();
		}
		return classLoader;
	}

	/**
	 * 取得类路径下的输入流
	 * 
	 * @param classPath
	 * @return
	 */
	public static InputStream getClassPathRes(String classPath) {
		InputStream in = null;
		ClassLoader classLoader = getClassLoader();
		in = classLoader.getResourceAsStream(classPath);
		return in;
	}

	/**
	 * 从指定的物理路径下，搜索指定软件包名下的所有资源
	 * 
	 * @param classesRootDir
	 *            classPath dir
	 * @param packageName
	 * @return
	 */
	public static List<String> findResources(File classesRootDir, String packageName) {
		String pkgPath = packageName.replace('.', '/');
		List<String> resourcesList = new ArrayList<String>();
		File packageDir = new File(classesRootDir, pkgPath);
		File[] resources = packageDir.listFiles();
		if (resources == null) {
			return resourcesList;
		}
		
		for (File f : resources) {
			if (!f.isDirectory()) {
				resourcesList.add(pkgPath + "/" + f.getName());
			}
		}
		return resourcesList;
	}

	/**
	 * 从文件路径中加载
	 * 
	 * @param classesRootDir
	 * @param packageName
	 * @return
	 */
	public static List<Class<?>> loadClasses(File classesRootDir, String packageName) {
		ClassLoader classLoader = getClassLoader();

		List<Class<?>> klassList = new ArrayList<Class<?>>();
		try {
			List<String> paths = findResources(classesRootDir, packageName);
			for (String klassPath : paths) {
				if (klassPath.endsWith(".class")) {
					String classCanonicalName = klassPath.substring(0, klassPath.lastIndexOf("."));
					classCanonicalName = classCanonicalName.replace('/', '.');
					Class<?> klass = classLoader.loadClass(classCanonicalName);
					klassList.add(klass);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Load Classes Error!");
		}
		return klassList;
	}

	/**
	 * 从jar文件中加载指定包名下所有的资源
	 * 
	 * @param jarFilePath
	 * @param packageName
	 * @return
	 * @throws Exception
	 */
	public static List<String> findResourcesInJar(File jarFile, String packageName) {
		try {
			ZipInputStream in = new ZipInputStream(new FileInputStream(jarFile));
			ZipEntry ze = null;
			List<String> jarClasses = new ArrayList<String>();
			String packagePath = packageName.replace(".", "/");

			while ((ze = in.getNextEntry()) != null) {
				if (ze.getName().startsWith(packagePath) && ze.getName().lastIndexOf("/") == packagePath.length()) {
					if (ze.getName().lastIndexOf(".") != -1) {
						jarClasses.add(ze.getName());
					}
				}
			}
			in.close();
			return jarClasses;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Find Resources In Jar Error!");
		}
	}

	/**
	 * 从jar文件中加载指定包名下所有的类
	 * 
	 * @param jarFile
	 *            jar文件
	 * @param packageName
	 *            包名
	 * @return
	 */
	public static List<Class<?>> loadClassesInJar(File jarFile, String packageName) {
		List<Class<?>> klassList = new ArrayList<Class<?>>();
		ClassLoader classLoader = getClassLoader();

		try {
			List<String> paths = findResourcesInJar(jarFile, packageName);
			for (String klassPath : paths) {
				if (klassPath.endsWith(".class")) {
					String classCanonicalName = klassPath.substring(0, klassPath.lastIndexOf("."));
					classCanonicalName = classCanonicalName.replace('/', '.');
					Class<?> klass = classLoader.loadClass(classCanonicalName);
					klassList.add(klass);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Load Classes In Jar Error!");
		}
		return klassList;
	}

	/**
	 * 直接从目标类的定义中搜索指定注解类
	 * 
	 * @param <A>
	 * @param targetClazz
	 *            目标类
	 * @param annotationClass
	 *            注解类
	 * @return
	 */
	public static <A extends Annotation> A getClassAnnotation(Class<?> targetClazz, Class<A> annotationClass) {
		if (targetClazz.isAnnotationPresent(annotationClass)) {
			A clzzAnn = targetClazz.getAnnotation(annotationClass);
			return clzzAnn;
		}
		return null;
	}

	/**
	 * 从所有的ReadMethod中搜索注解信息
	 * 
	 * @param <A>
	 * @param targetClazz
	 *            目标类
	 * @param annotationClass
	 *            注解类
	 * @return
	 */
	public static <A extends Annotation> List<A> getPropertiesAnnotation(Class<?> targetClazz, Class<A> annotationClass) {
		List<A> configs = new ArrayList<A>();
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(targetClazz);
			PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
			for (PropertyDescriptor pd : pds) {
				Method readMethod = pd.getReadMethod();
				if (readMethod == null) {
					continue;
				}

				if (readMethod.isAnnotationPresent(annotationClass)) {
					A propertyAnn = readMethod.getAnnotation(annotationClass);
					configs.add(propertyAnn);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return configs;
	}

	/**
	 * 
	 * 从目标类的所有的Declared Method中搜索注解信息
	 * 
	 * @param <A>
	 * @param targetClazz
	 *            目标类
	 * @param annotationClass
	 *            注解类
	 * @return
	 */
	public static <A extends Annotation> List<A> getMethodsAnnotation(Class<?> targetClazz, Class<A> annotationClass) {
		List<A> configs = new ArrayList<A>();
		try {
			Method[] delaredMethods = targetClazz.getDeclaredMethods();
			for (Method md : delaredMethods) {
				if (md.isAnnotationPresent(annotationClass)) {
					A propertyAnn = md.getAnnotation(annotationClass);
					configs.add(propertyAnn);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return configs;
	}

	/**
	 * 
	 * 从目标类的所有的Declared Field中搜索注解信息
	 * 
	 * @param <A>
	 * @param targetClazz
	 *            目标类
	 * @param annotationClass
	 *            注解类
	 * @return
	 */
	public static <A extends Annotation> List<A> getFieldsAnnotation(Class<?> targetClazz, Class<A> annotationClass) {
		List<A> configs = new ArrayList<A>();
		try {
			Field[] declaredFields = targetClazz.getDeclaredFields();
			for (Field fd : declaredFields) {
				if (fd.isAnnotationPresent(annotationClass)) {
					A propertyAnn = fd.getAnnotation(annotationClass);
					configs.add(propertyAnn);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return configs;
	}
}
