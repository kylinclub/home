# home

### step1： 修改tomcat/conf/conf/server.xml, 增加支持中文URL访问路径

    <Connector port="8080" protocol="HTTP/1.1" 
        connectionTimeout="20000"  
        redirectPort="8443"   
        URIEncoding="utf-8"
        useBodyEncodingForURI="true"/>
    
### step2： 导出mysql数据时需要使用utf8编码
 
    mysqldump -h 127.0.0.1 -P 3307 -u username 
    --default-character-set=utf -p databasename > dumpfile.txt
    
### step3： 导入mysql文件时需要使用utf8编码
    
    1. use database;
    2. set character set utf8
    3. source example.sql (sql文件路径)

### step4: 添加cos-26Dec2008.jar依赖支持文件上传

    copy {project}/lib/cos-26Dec2008.jar
    to tomcat/webapps/home/WEB-INF/lib/

### step5: 开发时使用home/src/main/java/com/gitc/home/generator自动生成model
   
    运行generator包下面主方法即可