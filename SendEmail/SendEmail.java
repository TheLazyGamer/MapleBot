import java.security.GeneralSecurityException;
import java.util.Properties;
import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.io.StringWriter;
import java.io.PrintWriter;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.sql.DataSource;

public class SendEmail {

	public static void main(String[] argv) throws GeneralSecurityException {

		String userBody = argv[0];
		String subject = argv[1];
		
		final String windowsUser = "TheLazyGamer";
		final String yourEmail = "YOUR_EMAIL@gmail.com";
		final String password = "YOUR_PASSWORD";
		final String numberToText = "5551234567@tmomail.net";

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(yourEmail, password);
					}
				});
		boolean sentMail = false;
		while (!sentMail) {
			try {
				System.out.println("Creating Message");
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(yourEmail));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(numberToText));
				message.setRecipients(Message.RecipientType.CC,
						InternetAddress.parse(yourEmail));
				
				
				if (userBody.contains("CRASH") || userBody.contains("Status")) {
					message.setSubject(subject);
					 // This mail has 2 part, the BODY and the embedded image
			         MimeMultipart multipart = new MimeMultipart("related");

			         // first part (the html)
			         BodyPart messageBodyPart = new MimeBodyPart();
			         String htmlText = "<H1>" + userBody + "</H1><img src=\"cid:image\">";
			         messageBodyPart.setContent(htmlText, "text/html");
			         // add it
			         multipart.addBodyPart(messageBodyPart);

			         // second part (the image)
			         messageBodyPart = new MimeBodyPart();
			         String attachedImage = getLatestFileFromDir("C:/Users/" + windowsUser + "/Documents/Screenshots").toString();
			         FileDataSource fds = new FileDataSource(new File(attachedImage));


			         messageBodyPart.setDataHandler(new DataHandler(fds));
			         messageBodyPart.setHeader("Content-ID", "<image>");

			         // add image to the multipart
			         multipart.addBodyPart(messageBodyPart);

			         // put everything together
			         message.setContent(multipart); }
					 
				else {
					message.setSubject(subject);
					message.setText(userBody); }
				
				System.out.println("About to send message");
				Transport.send(message);
				System.out.println("Message successfully sent");
				sentMail = true; }
			catch (MessagingException e) {
				System.out.println("MessagingException occurred... retrying in 10 seconds");
				sleepMode(10000); }
			catch (Exception ex) {
				System.out.println("Unknown exception occurred. Check log. Shutting Down");
				logError(ex);
				sentMail = true; }
		}
	}

	private static void logError(Exception ex) {
		ex.printStackTrace();
		try {
			File resultFile = new File("EmailErrors.log");
			FileWriter writer = new FileWriter(resultFile, true);

			Writer errorWriter = new StringWriter();
			PrintWriter printWriter = new PrintWriter(errorWriter);
			ex.printStackTrace(printWriter);
			writer.append(errorWriter.toString()).flush();

		} catch (FileNotFoundException e) {

		} catch (IOException e) {

		}
	}
	
	private static File getLatestFileFromDir(String dirPath){
	    File dir = new File(dirPath);
	    File[] files = dir.listFiles();
	    if (files == null || files.length == 0) {
	        return null;
	    }

	    File lastModifiedFile = files[0];
	    for (int i = 1; i < files.length; i++) {
	       if (lastModifiedFile.lastModified() < files[i].lastModified()) {
	           lastModifiedFile = files[i];
	       }
	    }
	    return lastModifiedFile;
	}

	private static void sleepMode(int pauseLen) {
		try {
			Thread.sleep(pauseLen);
		} catch (InterruptedException exx) {
			Thread.currentThread().interrupt();
		}
	}
}