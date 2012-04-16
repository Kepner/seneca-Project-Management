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

  /**
  * Send a single email.
  */
  public static boolean sendEmail(
    String aFromEmailAddr, String aToEmailAddr,
    String aSubject, String aBody
  ){
    MimeMessage message = new MimeMessage( mailSession );
    try {
      //the "from" address may be set in code, or set in the
      //config file under "mail.from" ; here, the latter style is used
      message.setFrom( new InternetAddress(aFromEmailAddr) );
      message.addRecipient(
        Message.RecipientType.TO, new InternetAddress(aToEmailAddr)
      );
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