# MapleBot - AutoIT MapleStory Training Bot Automation Suite
A less-detectable, easy to use MapleStory bot.  Train while you sleep, while at school, while at work, anywhere.


Over 6 months of:
* Constant use
* Improvements
* Updates
* Billions of mesos farmed
* Level 200+ characters
* Level 240+ characters

Features:
* Remote accessibility
* Text and email notifications
* Automatic relog
* Automatic reboot and restart
* Bot status
* Hyper Teleport Rock expiration detection
* HP detection and heal
* Pet detection and feed
* Whisper, player, buddy, guildie, and chat detection (with auto cc or dc)
* Does not hack the game
* Does not change MapleStory files
* Does not edit packets

### Foreward
MapleBot was built, tested, and run on an 8 year old laptop with a screen that is 1280 x 800 (resolution shouldn't make a difference) on a T4200 Pentium Dual Core 2.00GHz with 3Gb ram Windows 7 64bit. If I can run it on that, you can run it.

Supports the new required Nexon Launcher. While the bot is running, you cannot touch or use your computer. Because of pixel detections, Windows 7 may be required unless modifications are made to the code (any other OSes have not been tested). 

Kanna_Flat_MapleBot.au3 is for training at Northwest Heights. Xenon_Arcane_MapleBot.au3 is for training at Hidden Torrent Zone. When building your own MapleBot.au3 code, use Xenon_Arcane_MapleBot.au3 as your reference-- it contains the most up-to-date code.

# Setup and Instructions

Unzip the package into your Documents folder

Your computer must have a single login (or no logins) and no password.

All screenshots are stored in Screenshots. Do not delete this folder.

Set your Nexon Launcher to run when your computer starts. Open up Nexon Launcher, click the dropdown menu in the top right, click Settings, and check the box as shown below:
![alt text](http://i.imgur.com/Ov5yiti.png)

Under Settings > Options, set your MapleStory client to windowed mode 800x600:
![alt text](http://i.imgur.com/IkRRSFc.png)

Change your PIC to any combination of 1s and 7s. Your PIC can only contains 1s and 7s.

Expand your Mini Map to its largest size.

Kanna_Flat_MapleBot.au3 just assumes your last selected character was your Kanna. Xenon_Arcane_MapleBot.au3 assumes your Xenon is on the top-leftmost slot on the first character selection screen as shown below (these are configurable):
![alt text](http://i.imgur.com/VIzUeDw.png)

Your antivirus may affect sending email. You may need to disable your antivirus, or reconfigure it to permit emails/SMTP (as is the case with Avast).

### Installations and Configurations
| Prereq | Action | Purpose |
| ------ | ------ | ------ |
|[AutoIT3](https://www.autoitscript.com/site/autoit/downloads/) | Download | The main engine that drives the bot|
|[Java 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) | Download | What the Twitter and Email functionality use|
|[Javac](https://learn.yancyparedes.net/2012/03/setting-up-javac-command-on-windows-7/) | Configure | Add javac to your PATH to compile Java scripts|
|[UAC](http://imgur.com/a/iT8Jw) | Configure | Disable UAC to start MapleStory without popups|
|[MapleStory  shortcut](http://imgur.com/a/WmJzq) | Create | Create a shortcut for MapleStory on your desktop|
|[Twitter Account](https://twitter.com/signup) | Sign up | Remote control functionality|
|[Twitter Dev Creds](https://apps.twitter.com/app/new) | Create | Create an App for the tokens|
|[Twitter for Android](https://play.google.com/store/apps/details?id=com.twitter.android&hl=en) | Download | Twitter's Android Mobile App for remote controlling the map (if you use Android)|
|[Twitter for iOS](https://itunes.apple.com/us/app/twitter/id333903271?mt=8) | Download | Twitter's iOS Mobile App for remote controlling the map (if you use iOS)|

### Update Code Parameters

**Inside the Twitter folder, update the following:**

Open up MapleBot Twitter.xml and update:
```xml
<Command>C:\Users\TheLazyGamer\Documents\Twitter\RunTwitter.bat</Command>
```
Change **TheLazyGamer** user to your user and save. Open up Task Scheduler. Click Action > Import Task and select MapleBot Twitter.xml and click OK.
&nbsp;
&nbsp;

Open up RunMaplebotKanna.bat and update:
```
AutoIt3.exe C:\Users\TheLazyGamer\Documents\Kanna_Flat_MapleBot.au3
```
Change **TheLazyGamer** user to your user and save.
&nbsp;
&nbsp;

Open up RunMaplebotXenon.bat and update:
```
AutoIt3.exe C:\Users\TheLazyGamer\Documents\Xenon_Arcane_MapleBot.au3
```
Change **TheLazyGamer** user to your user and save.
&nbsp;
&nbsp;

Open up RunTwitter.bat and update:
```
cd C:\Users\TheLazyGamer\Documents\Twitter
```
Change **TheLazyGamer** user to your user and save.
&nbsp;
&nbsp;

Open up TwitterBot.java and update:
```Java
String windowsUser = "TheLazyGamer";
String twitterUser = "YOUR_TWITTER_USERNAME";
String consumerKey = "YOUR_CONSUMER_KEY";
String consumerSecret = "YOUR_CONSUMER_SECRET";
String accessToken = "YOUR_ACCESS_TOKEN";
String accessTokenSecret = "YOUR_ACCESS_TOKEN_SECRET";
```
Change **windowsUser** to your user.   
Change **twitterUser** to your Twitter user you'll be tweeting from.   
Change **consumerKey**, **consumerSecret**, **accessToken**, and **accessTokenSecret** to their respective values from your Twitter Dev App.
&nbsp;
&nbsp;

**Inside the SendEmail folder, update the following:**

Open up SendEmail.bat and update:
```
cd C:\Users\TheLazyGamer\Documents\SendEmail
```
Change **TheLazyGamer** user to your user and save.
&nbsp;
&nbsp;

Open up SendEmail.java and update:
```
final String windowsUser = "TheLazyGamer";
final String yourEmail = "YOUR_EMAIL@gmail.com";
final String password = "YOUR_PASSWORD";
final String numberToText = "5551234567@tmomail.net";
```
Change **windowsUser** to your user.   
Change **yourEmail** to your gmail address.   
Change **password** to your gmail password.  
Change **numberToText** to your phone number and carrier. Valid carriers are below:

| Provider | Email to SMS Address Format |
| ------ | ------ |
| AllTel | number@text.wireless.alltel.com |
| AT&T | number@txt.att.net |
| Boost Mobile | number@myboostmobile.com |
| Cricket | number@sms.mycricket.com |
| Sprint | number@messaging.sprintpcs.com |
| T-Mobile | number@tmomail.net |
| US Cellular | number@email.uscc.net |
| Verizon | number@vtext.com |
| Virgin Mobile | number@vmobl.com |   

**Inside your Documents folder, update the following:**  

Open up RunMaple.bat and update:
```
C:\Users\TheLazyGamer\Desktop\MapleStory.lnk
```
Change **TheLazyGamer** user to your user and save.
&nbsp;
&nbsp;

For both Kanna_Flat_MapleBot.au3 and Xenon_Arcane_MapleBot.au3, open them up and update:
```python
global $windowsUser = "TheLazyGamer"
```
Change **TheLazyGamer** windows username and save.
&nbsp;
&nbsp;

Still in Kanna_Flat_MapleBot.au3 and Xenon_Arcane_MapleBot.au3, update:
```python
MouseClick("left", $x1, $y1, 1, 20)
Sleep(1000)
MouseClick("left", $x1, $y1, 1, 20)
Sleep(1000)
MouseClick("left", $x7, $y7, 1, 20)
Sleep(1000)
MouseClick("left", $x7, $y7, 1, 20)
Sleep(1000)
MouseClick("left", $x1, $y1, 1, 20)
Sleep(1000)
MouseClick("left", $x1, $y1, 1, 20)
```
The above will enter the PIC 117711. Move around the **MouseClick** functions to match your PIC.
&nbsp;
&nbsp;

### Remote Control
With your Twitter account set up, you have several Tweetable commands at your disposal. Each Tweet must be unique, since Twitter does not allow duplicate Tweets. These are listed below:

| Command | Description |
| ------ | ------ |
| Schedule Xenon 01/17/2017 18:50 | Schedules a start time for your bot to begin. The timestamp in the example can be changed to your timestamp, but notice the 24hour format. Xenon can also be replaced with Kanna. |
| Delete asdf | Delete a scheduled start time. asdf can be replaced with any random string. |
| Status asdf | A screenshot is taken and emailed and texted to you. asdf can be replaced with any random string. |
| Start Kanna asdf | Starts the Kanna MapleBot. asdf can be replaced with any random string. |
| Start Xenon asdf | Starts the Xenon MapleBot. asdf can be replaced with any random string. |
| Stop asdf | Stops the currently running MapleBot. asdf can be replaced with any random string. asdf can be replaced with any random string. |
| Reboot asdf | Reboots your computer, shutting off the bot with it. The bot does not auto-start upon rebooting. asdf can be replaced with any random string. |

# Frequently Used Resources

https://www.autoitscript.com/autoit3/docs/functions.htm

https://www.autoitscript.com/autoit3/docs/macros/TimeAndDate.htm

https://www.autoitscript.com/autoit3/docs/intro/lang_operators.htm

https://www.autoitscript.com/wiki/Best_coding_practices

https://www.autoitscript.com/forum/topic/57070-hotkeyset-example-for-the-beginners/

https://www.autoitscript.com/forum/topic/39797-check-pixel-color/

https://www.autoitscript.com/autoit3/docs/functions/PixelGetColor.htm

https://www.autoitscript.com/forum/topic/123156-pixelgetcolor/

https://www.autoitscript.com/forum/topic/64933-howcan-you-detect-a-pixel-color-change/

https://www.autoitscript.com/autoit3/docs/functions/MsgBox.htm

http://brugbart.com/how-to-use-msgbox-autoit

http://stackoverflow.com/questions/22433318/gui-while-running-a-function-in-autoit

http://www.gamersoul.com/forums/archive/index.php/t-196504.html

# License

[Twitter4J is released under Apache License 2.0.](http://twitter4j.org/en/index.html#license)

[Apache Commons Email is under Apache License 2.0.](http://www.apache.org/licenses/)

[JavaMail uses multiple licenses](https://java.net/projects/javamail/pages/License)

The provided MapleBot scripts are released under MIT License.   
Copyright © 2017 TheLazyGamer

For educational purposes only. I am not responsible for any bans or suspensions to your account. Botting is against Nexon's EULA. Use at your own discretion.