import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

public class TwitterBot {

	public static void main(String[] args) throws IOException {

		boolean loopedOnce = false;
		ArrayList<String> statusTimes = new ArrayList<String>();
		long memUsage = -1;
		boolean autoItStarted = false;
		boolean runningKanna = false;
		boolean runningXenon = false;
		
		String windowsUser = "TheLazyGamer";
		String twitterUser = "YOUR_TWITTER_USERNAME";
		String consumerKey = "YOUR_CONSUMER_KEY";
		String consumerSecret = "YOUR_CONSUMER_SECRET";
		String accessToken = "YOUR_ACCESS_TOKEN";
		String accessTokenSecret = "YOUR_ACCESS_TOKEN_SECRET";
		
		File kannaNotRespondingFile = new File("C:/Users/" + windowsUser + "/Documents/Twitter/KannaNotResponding.txt");
		File xenonNotRespondingFile = new File("C:/Users/" + windowsUser + "/Documents/Twitter/XenonNotResponding.txt");
		
		Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Twitter successfully started\" \"MapleBot\"");
		
		if (kannaNotRespondingFile.exists()) {
			Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/KillAutoIt.bat");
			sleepMode(10000);
			Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/RunMaplebotKanna.bat");
			kannaNotRespondingFile.delete();
			System.out.println("Maple autostarted");
			autoItStarted = true;
			runningKanna = true;
			runningXenon = false; }
			
		else if (xenonNotRespondingFile.exists()) {
			Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/KillAutoIt.bat");
			sleepMode(10000);
			Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/RunMaplebotXenon.bat");
			xenonNotRespondingFile.delete();
			System.out.println("Maple autostarted");
			autoItStarted = true;
			runningKanna = false;
			runningXenon = true; }

		while (true) {

			ConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
			configurationBuilder.setOAuthConsumerKey(consumerKey)
					.setOAuthConsumerSecret(consumerSecret)
					.setOAuthAccessToken(accessToken)
					.setOAuthAccessTokenSecret(accessTokenSecret);

			TwitterFactory tf = new TwitterFactory(configurationBuilder.build());

			Twitter twitter = tf.getInstance();

			try {
				List<Status> statuses = twitter.getUserTimeline(twitterUser);
				
				boolean actionTaken = false;
				
				if (!loopedOnce) {
					for (Status status : statuses) {
						statusTimes.add(status.getCreatedAt().toString()); }
						
					loopedOnce = true; }
				
				else {
					for (Status status : statuses) {
						if (status.getText().contains("Schedule") && !statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							String statusText = status.getText();
							
							String botCharacter = "Xenon"; //default to Xenon
							if (statusText.contains("Kanna")) {
								botCharacter = "Kanna"; }
							
							String[] statusTextArr = statusText.split(" ");
							String startDate = statusTextArr[statusTextArr.length - 2];
							String startTime = statusTextArr[statusTextArr.length - 1];
							
							Runtime.getRuntime().exec("cmd /c SCHTASKS /DELETE /tn \"SCHEDULEMAPLEBOT\" /F");
							sleepMode(1000);
							Runtime.getRuntime().exec("cmd /c SCHTASKS /CREATE /SC ONCE /TN SCHEDULEMAPLEBOT /TR C:/Users/" + windowsUser + "/Documents/Twitter/RunMaplebot" + botCharacter + ".bat /SD " + startDate + " /ST " + startTime + " /RL HIGHEST");
							
							Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Job Scheduled\" \"MapleBot\"");
							actionTaken = true; }
							
						else if (status.getText().contains("Delete") && !statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							Runtime.getRuntime().exec("cmd /c SCHTASKS /DELETE /tn \"SCHEDULEMAPLEBOT\" /F");
							Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Job Deleted\" \"MapleBot\"");
							actionTaken = true; }
							
						else if (status.getText().contains("Status") && !statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							BufferedImage image = new Robot().createScreenCapture(new Rectangle(Toolkit.getDefaultToolkit().getScreenSize()));
							ImageIO.write(image, "png", new File("C:/Users/" + windowsUser + "/Documents/Screenshots/Status_" + status.getCreatedAt().toString().replace(":", "").replace(" ", "") + ".png"));
							Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Status\" \"MapleBot\""); }
							
						if (status.getText().contains("Start Kanna") && !statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/KillAutoIt.bat");
							sleepMode(10000);
							Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/RunMaplebotKanna.bat");
							Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Start job received\" \"MapleBot\"");
							autoItStarted = true;
							runningKanna = true;
							runningXenon = false;
							actionTaken = true; }
							
						if (status.getText().contains("Start Xenon") && !statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/KillAutoIt.bat");
							sleepMode(10000);
							Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/RunMaplebotXenon.bat");
							Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Start job received\" \"MapleBot\"");
							autoItStarted = true;
							runningKanna = false;
							runningXenon = true;
							actionTaken = true; }
							
						if (status.getText().contains("Stop") && !statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/KillAutoIt.bat");
							Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Bot stopped\" \"MapleBot\"");
							autoItStarted = false;
							actionTaken = true; }
							
						if (status.getText().contains("Reboot") && !statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/KillAutoIt.bat");
							sleepMode(10000);
							Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/RebootLaptop.bat");
							actionTaken = true; }
							
						else if (!statusTimes.contains(status.getCreatedAt().toString())) {
							statusTimes.add(status.getCreatedAt().toString());
							System.out.println(status.getCreatedAt() + "|@" + status.getUser().getScreenName() + " - " + status.getText());
							Runtime.getRuntime().exec("cmd /c start C:\\Users\\" + windowsUser + "\\Documents\\SendEmail\\SendEmail.bat \"Invalid Command: " + status.getText() + "\" \"MapleBot\"");
							actionTaken = true; }
					}
					
					if (!actionTaken) {
						Process runningCmd = Runtime.getRuntime().exec("tasklist");
						
						BufferedReader programsRunning = new BufferedReader(new InputStreamReader(runningCmd.getInputStream()));
						String runningLog = "";
						boolean autoItCrashed = true;
						
						while ((runningLog = programsRunning.readLine()) != null) {
							runningLog = runningLog.trim();
							if (runningLog.contains("AutoIt3")) {
								autoItStarted = true;
								autoItCrashed = false; }
						}
						
						programsRunning.close();
						
						if (autoItCrashed) {
							Process respondingCmd = Runtime.getRuntime().exec("tasklist /FI \"STATUS eq not responding\"");
							
							BufferedReader programsResponding = new BufferedReader(new InputStreamReader(respondingCmd.getInputStream()));
							String respondingLog = "";
							boolean mapleNotResponding = false;
							
							while ((respondingLog = programsResponding.readLine()) != null) {
								respondingLog = respondingLog.trim();
								if (respondingLog.contains("MapleStory")) {
									mapleNotResponding = true;
									break; }
							}
							
							programsResponding.close();
							
							if (!mapleNotResponding && autoItStarted) { //If AutoIT dead and Maple responding fine, check if last error was Reboot tab missing
								String mostRecentSS = getLatestFileFromDir("C:/Users/" + windowsUser + "/Documents/Screenshots").toString();
								if (mostRecentSS.contains("The Reboot tab was missing")) {
									//Could be from user ID already logged in, hence Reboot
									mapleNotResponding = true; }
							}
							
							if (mapleNotResponding) {
								if (runningKanna) {
									kannaNotRespondingFile.createNewFile(); }
								else if (runningXenon) {
									xenonNotRespondingFile.createNewFile(); }
								else {
									xenonNotRespondingFile.createNewFile(); }
								sleepMode(500);
								Runtime.getRuntime().exec("cmd /c start C:/Users/" + windowsUser + "/Documents/Twitter/RebootLaptop.bat"); }
						}
					}
				}
				
				
				
				
				
			}
			catch (Exception ex) {
				//ex.printStackTrace();
				System.out.println("An exception occurred... relooping in 2 mins"); }
			
			sleepMode(120000);
		}
	}
	
	/**
	* Grabs the most recently used/made file in the passed directry.
	* @param dirPath The directory to be checked
	*/
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
	
	/**
	 * Pauses the current thread for the specified number of milliseconds.
	 * @param pauseLen The length of time to pause in milliseconds
	 */
	private static void sleepMode(int pauseLen) {
		try {
			Thread.sleep(pauseLen); }
		catch(InterruptedException ex) {
			Thread.currentThread().interrupt(); }
	}
}