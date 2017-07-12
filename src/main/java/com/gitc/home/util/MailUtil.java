package com.gitc.home.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import com.jfinal.kit.PropKit;

public class MailUtil {

    public static void SendMail(String to, String Subject, String body) throws AddressException, MessagingException {
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", PropKit.get("mail.transport.protocol"));// 连接协议
        properties.put("mail.smtp.host", PropKit.get("mail.smtp.host"));// 主机名
        properties.put("mail.smtp.port", PropKit.getInt("mail.smtp.port"));// 端口号
        properties.put("mail.smtp.auth", PropKit.get("mail.smtp.auth"));
        properties.put("mail.smtp.ssl.enable", PropKit.get("mail.smtp.ssl.enable"));//设置是否使用ssl安全连接  ---一般都使用
        properties.put("mail.debug", PropKit.get("mail.debug"));//设置是否显示debug信息  true 会在控制台显示相关信息
        //得到回话对象
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);
        //设置发件人邮箱地址
        message.setFrom(new InternetAddress(PropKit.get("mail.from")));
        //设置收件人地址
        message.setRecipients(RecipientType.TO, new InternetAddress[] {
                new InternetAddress(to)
        });
        //设置邮件标题
        message.setSubject(Subject);
        //设置邮件内容
        message.setText(body);
        //得到邮差对象
        Transport transport = session.getTransport();
        //连接自己的邮箱账户

        transport.connect(PropKit.get("mail.user"), PropKit.get("mail.password"));//密码为刚才得到的授权码
        //发送邮件
        transport.sendMessage(message, message.getAllRecipients());
    }

    public static void SendToAdmin(String Subject, String body) {
        try {
            SendMail(PropKit.get("mail.to"), Subject, body);
        } catch(Exception e ) {
           e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        MailUtil m = new MailUtil();
        System.out.print(m.toString());
    }
}