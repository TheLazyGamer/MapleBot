cd C:\Users\TheLazyGamer\Documents\SendEmail
javac -cp commons-email-1.4.jar;javax.mail.jar SendEmail.java
java -cp .;commons-email-1.4.jar;javax.mail.jar SendEmail %1 %2
exit