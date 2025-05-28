package net.java_school.commons;

public enum WebContants {

	/*
    //User key
    public final static String USER_KEY = "user";
    //Error Message
    public final static String NOT_LOGIN = "Not Login";
    public final static String AUTHENTICATION_FAILED = "Authentication Failed";
    //Line Separator
    public final static String LINE_SEPARATOR = System.getProperty("line.separator");
    //Upload path
    public final static String UPLOAD_PATH = "/var/lib/tomcat10/logs/upload/";
    */

	USER_KEY("user"),
	UPLOAD_PATH("/var/lib/tomcat10/logs/upload/");
	
	private String value;
	
	WebContants(String value) {
		this.value = value;
	}
	
	public String value() {
		return value;
	}
}
