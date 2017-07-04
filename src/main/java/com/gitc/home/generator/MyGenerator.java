package com.gitc.home.generator;

import javax.sql.DataSource;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.c3p0.C3p0Plugin;

/**
 * MyGenerator
 */
public class MyGenerator {
	
	public static DataSource getDataSource() {
		Prop p = PropKit.use("system.properties");
		C3p0Plugin c3p0Plugin = new C3p0Plugin(p.get("datasource.url"), p.get("datasource.user"), p.get("datasource.password"));
		System.out.println(p.get("datasource.url"));
		c3p0Plugin.start();
		return c3p0Plugin.getDataSource();
	}
	
	public static void main(String[] args) {
		// base model 所使用的包名
		String baseModelPackageName = "com.gitc.home.model.base";
		// base model 文件保存路径
		String baseModelOutputDir = PathKit.getWebRootPath() + "/src/main/java/com/gitc/home/model/base";
//		System.out.println(baseModelOutputDir);
		// model 所使用的包名 (MappingKit 默认使用的包名)
		String modelPackageName = "com.gitc.home.model";
		// model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
		String modelOutputDir = baseModelOutputDir + "/..";
		
		// 创建生成器
		Generator gernerator = new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
		// 添加不需要生成的表名
//		gernerator.addExcludedTable("user","param","project","user_project","item");
		// 设置是否在 Model 中生成 dao 对象
		gernerator.setGenerateDaoInModel(true);
		// 设置是否生成字典文件
		gernerator.setGenerateDataDictionary(false);
//		 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为 "User"而非 OscUser
//		gernerator.setRemovedTableNamePrefixes("t_");
		// 生成
		gernerator.generate();
	}
}




