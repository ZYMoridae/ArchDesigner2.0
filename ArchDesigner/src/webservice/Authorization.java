package webservice;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import bean.SystemUser;
import restclient.AuthenticationClient;

public class Authorization
{
	public static SystemUser systemUser;
	public static SystemUser tempSystemUser;
	public static String password;
	public static String username;
	public static String userid;
	public static String key;
	public String  authorization()
	{
		InitWorkspaces workspace=new InitWorkspaces();
		System.out.println("Start to set up user");
		util.Constants.ontologyServerURI = "http://aufeef.itu.dk:8080/ArchitectureDesignWorkspace/webresources";
	    AuthenticationClient authenticationClient = new AuthenticationClient();
	    tempSystemUser = (SystemUser)authenticationClient.isSystemUserPresent(SystemUser.class, "abc");
	    systemUser = new SystemUser();
//	 	systemUser = (SystemUser)authenticationClient.createSystemUser_XML(SystemUser.class, systemUser);
	    systemUser.setUserid("test");
	 	systemUser.setName("testname");
	 	systemUser.setPassword("pwd");
	 	password = systemUser.getPassword();
	 	username = systemUser.getName();
	 	userid = systemUser.getUserid();
	 	tempSystemUser = (SystemUser)authenticationClient.getAccessKey_XML(SystemUser.class, systemUser);
	 	key = tempSystemUser.getCurrentAuthKey();
/*		systemUser.setUserid("test");
	 	systemUser.setPassword("pwd");*/
//	 	tempSystemUser = (SystemUser)authenticationClient.isSystemUserPresent(SystemUser.class, "test");
	 	/*writeproperty();
	 	readproperty();*/
	 	Properties prop = new Properties();
		OutputStream output = null;
		try {
			output = new FileOutputStream("\\Users\\alex\\Documents\\ArchDesignerv2.0\\ArchDesigner2.0\\ArchDesigner\\WebContent\\Main\\config.properties");
			// set the properties value
			prop.setProperty("UserID", userid);
			prop.setProperty("UserName", username);
			prop.setProperty("Userpassword", password);
			prop.setProperty("key", key);
			/*System.out.println(key);*/
			// save properties to project root folder
			prop.store(output, null);
	 
		} catch (IOException io) {
			io.printStackTrace();
		} finally {
			if (output != null) {
				try {
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	 
		}
		InputStream input = null;
		try {
			input = new FileInputStream("\\Users\\alex\\Documents\\ArchDesignerv2.0\\ArchDesigner2.0\\ArchDesigner\\WebContent\\Main\\config.properties");
			// load a properties file
			prop.load(input);
			// get the property value and print it out
			System.out.println("User is "+prop.getProperty("UserID"));
			System.out.println("UserName is "+prop.getProperty("UserName"));
			System.out.println("Userpassword is "+prop.getProperty("Userpassword"));
			System.out.println("key is "+prop.getProperty("key"));
	 
		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			if (input != null) {
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	 	System.out.println("You generated a new key"+key);
	 	String returnkey = key;
	 	return returnkey;
	}
	

	
	
	 public static void writeproperty(){
		 	Properties prop = new Properties();
			OutputStream output = null;
			try {
				output = new FileOutputStream("config.properties");
				// set the properties value
				prop.setProperty("UserID", userid);
				prop.setProperty("UserName", username);
				prop.setProperty("Userpassword", password);
				prop.setProperty("key", key);
				/*System.out.println(key);*/
				// save properties to project root folder
				prop.store(output, null);
		 
			} catch (IOException io) {
				io.printStackTrace();
			} finally {
				if (output != null) {
					try {
						output.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
		 
			}
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 public static void readproperty()
	 {
		 	Properties prop = new Properties();
			InputStream input = null;
			try {
				input = new FileInputStream("config.properties");
				// load a properties file
				prop.load(input);
				// get the property value and print it out
				System.out.println("User is "+prop.getProperty("UserID"));
				System.out.println("UserName is "+prop.getProperty("UserName"));
				System.out.println("Userpassword is "+prop.getProperty("Userpassword"));
				System.out.println("key is "+prop.getProperty("key"));
		 
			} catch (IOException ex) {
				ex.printStackTrace();
			} finally {
				if (input != null) {
					try {
						input.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
	 }
}
