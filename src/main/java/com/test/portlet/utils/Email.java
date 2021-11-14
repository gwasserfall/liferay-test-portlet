package com.test.portlet.utils;

import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.repository.model.FileEntry;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.TimeZone;


public class Email {
    public static void sendMail(String to, User user, FileEntry file) throws RuntimeException {
        final String username = "reset@smollan.com";
        final String password = "T[RY:[3GV2!P}A6=";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.office365.com");
        props.put("mail.smtp.port", "587");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        ZonedDateTime zoneNow = ZonedDateTime.now(TimeZone.getTimeZone("Africa/Johannesburg").toZoneId());

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            String fileLink = "http://smintranetdev.northeurope.cloudapp.azure.com/group/cerebra/~/control_panel/manage?p_p_id=com_liferay_document_library_web_portlet_DLAdminPortlet&p_p_lifecycle=0&p_p_state=maximized&p_p_mode=view&_com_liferay_document_library_web_portlet_DLAdminPortlet_mvcRenderCommandName=%2Fdocument_library%2Fedit_file_entry&_com_liferay_document_library_web_portlet_DLAdminPortlet_fileEntryId=" + file.getFileEntryId();

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("reset@smollan.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Cerebra File Uploaded");
            message.setText("A new file is awaiting review on Cerebra." +
                    "\n\n" +
                    "File Name : " + file.getFileName() + "\n\n" +
                    "Cerebra Folder : " + file.getExpandoBridge().getAttribute("Cerebra_Folder") + "\n\n" +
                    "Uploaded By : " + user.getEmailAddress() + "\n\n" +
                    "Uploaded On : " + dtf.format(zoneNow) + "\n\n" +
                    "\n" +
                    "Direct Link to Review : "+ fileLink + "\n\n" +
                    "Set the published field to true to make the file visible in searches\n" +
                    "\n" +
                    "Cerebra\n");

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
