package seneca.projectManagement.utils;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
* Simple demonstration of using the javax.mail API.
*
* Run from the command line. Please edit the implementation
* to use correct email addresses and host name.
*/
public class Email {
  @Resource(name = "mail/prj666")
  private static Session mailSession;
  private MimeMessage message;

  /**
  * Send a single email.
  */
  public Email(){
    message = new MimeMessage( mailSession );
  }
  
  public void addRecipient( Message.RecipientType aTo, String aToEmailAddr ){
    try{
      message.addRecipient(
        aTo, new InternetAddress(aToEmailAddr)
      );
    }
    catch(Exception e){
      System.err.println("Cannot add email address");
    }
  }
  public boolean sendEmail(
    String aFromEmailAddr, String aSubject, String aBody
  ){
    try {
      message.setFrom( new InternetAddress(aFromEmailAddr) );
      message.setSubject( aSubject );
      message.setText( aBody );
      Transport.send( message );
      return true;
    }
    catch (MessagingException ex){
      System.err.println("Cannot send email. " + ex);
      return false;
    }
  }
} 