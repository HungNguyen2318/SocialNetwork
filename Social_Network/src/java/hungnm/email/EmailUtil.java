/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.email;

import hungnm.account.AccountDTO;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class EmailUtil {

    final static Logger LOG = Logger.getLogger(EmailUtil.class);

    //generate vrification code
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //send email to the user email
    public boolean sendEmail(AccountDTO accountDto, String code) {
        boolean test = false;

        String toEmail = accountDto.getEmail();
        String fromEmail = "nguyenminhhung408@gmail.com";
        String password = "Pin23181999";

        try {

            // your host email smtp server details
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.prot", "465");

            //get session to authenticate the host email address and password
            Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            //set email message details
            Message mess = new MimeMessage(session);
//    		//set from email address
            mess.setFrom(new InternetAddress(fromEmail));
//    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//    		//set email subject
            mess.setSubject("User Email Verification");
//    		//set message text
            mess.setText("Registered successfully.Please verify your account using this code: " + code);
//            //send the message
            Transport.send(mess);
            test = true;
        } catch (MessagingException e) {
            LOG.error("MessagingException at EmailUtil: " + e.getMessage());
        }

        return test;
    }
}
