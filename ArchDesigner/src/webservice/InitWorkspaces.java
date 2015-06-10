package webservice;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.xml.ws.BindingProvider;

import soapclient.DesignOntology;
import soapclient.DesignWorkspaceOntology;
import util.Constants;

public class InitWorkspaces
{
	public static DesignOntology service = new DesignOntology();
 	public static DesignWorkspaceOntology port = service.getDesignWorkspaceOntologyPort();
	public boolean initWorkspace(String workspaceanme)
	{
		String userId = "test";
	 	String authKey = readkey();
		Map<String, Object> req_ctx = ((BindingProvider)port).getRequestContext();
		Map<String, List<String>> headers = new HashMap();
		headers.put(Constants.userId, Collections.singletonList(userId));
		headers.put(Constants.authKey, Collections.singletonList(authKey));
	    req_ctx.put("javax.xml.ws.http.request.headers", headers);
		return port.initWorkspace(workspaceanme);
	}
	 public String readkey()
	 {
		 Properties prop = new Properties();
			InputStream input = null;
			try {
				input = new FileInputStream("config.properties");
				// load a properties file
				prop.load(input);
				// get the property value and print it out
//				System.out.println("User is "+prop.getProperty("UserID"));
//				System.out.println("UserName is "+prop.getProperty("UserName"));
//				System.out.println("Userpassword is "+prop.getProperty("Userpassword"));
//				System.out.println("key is "+prop.getProperty("key"));
		 
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
			return prop.getProperty("key");
	 }
	 public static void writeproperty(String workspace){
	 	Properties prop = new Properties();
		OutputStream output = null;
		try {
			output = new FileOutputStream("WorkSpaceConfig.properties");
			// set the properties value
			prop.setProperty("workspaceIdentifier", workspace);
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
}
