package webservice;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.xml.ws.BindingProvider;

import bean.SystemUser;
import soapclient.Concept;
import soapclient.DesignOntology;
import soapclient.DesignWorkspaceOntology;
import soapclient.RelationType;
import util.Constants;

public class CallWebService
{	
		public static SystemUser systemUser;
		public static SystemUser tempSystemUser;
		public static String password;
		public static String username;
		public static String userid;
		public static String key;
		public static List<String> relationlists;
		public static Concept parentConcept = new Concept();
		public static Concept childConcept = new Concept();
		public static Concept updateConcept = new Concept();
		public static RelationType Oldrelation = new RelationType();
		public static RelationType Newrelation = new RelationType();
		public static DesignOntology service = new DesignOntology();
		public static ArrayList<Concept> conceptList;
	 	public static DesignWorkspaceOntology port = service.getDesignWorkspaceOntologyPort();
	 	
	 	
	 	public ArrayList<String> getrelationlist(String keyvalue)
		{
	 		/*System.out.println(" success ");*/
		 	String userId = "test";
		 	String authKey = keyvalue;
		/* 	System.out.println("the key is " + authKey);*/
			Map<String, Object> req_ctx = ((BindingProvider)port).getRequestContext();
			Map<String, List<String>> headers = new HashMap();
			headers.put(Constants.userId, Collections.singletonList(userId));
			headers.put(Constants.authKey, Collections.singletonList(authKey));
		    req_ctx.put("javax.xml.ws.http.request.headers", headers);
			// get relation list
			relationlists = new ArrayList<String>();
			relationlists = port.getRelationList("DesignWorkspace");
/*		    System.out.println(port.getRelationList("DesignWorkspace"));*/
			return (ArrayList<String>) relationlists;
		}
	 	
	 	public static ArrayList<String> getConcepts(String keyvalue) { /** add parameter and authkey from session **/
			String userId = "test";
			String authKey = keyvalue;
		/*	System.out.print(authKey);*/
			Map<String, Object> req_ctx = ((BindingProvider) port).getRequestContext();
			Map<String, List<String>> headers = new HashMap();
			headers.put(Constants.userId, Collections.singletonList(userId));
			headers.put(Constants.authKey, Collections.singletonList(authKey));
			req_ctx.put("javax.xml.ws.http.request.headers", headers);

			Concept parentConcept = new Concept();
			parentConcept.setName("ASR");
			/*Concept childConcept = new Concept();
			childConcept.setName("ASR");
			if (port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, childConcept, "specializationOf", parentConcept)) {
				System.out.println("Hello");
			}*/
			
			/*Concept childConcept2 = new Concept();
			childConcept2.setName("Scenario4");
			System.out.println(port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, childConcept2, "specializationOf",parentConcept ));*/
			// System.out.println(conceptList.toString());
			/*Concept parentConcept1 = new Concept();
			parentConcept1.setName("ASR");
			Concept childConcept1 = new Concept();
			childConcept1.setName("Security");
			port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, childConcept1, "specializationOf", parentConcept1);
			Concept parentConcept2 = new Concept();
			parentConcept2.setName("Knowledge");
			Concept childConcept2 = new Concept();
			childConcept2.setName("Patterns");
			port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, childConcept2, "specializationOf", parentConcept2);
			ArrayList<String> list = (ArrayList) port.getRelationList("DesignWorkspace");*/
			// System.out.println(list.toString());
			conceptList = (ArrayList) port.getConceptListOfParents("DesignWorkspace", Constants.knowledgeIdentifier, parentConcept);
			// System.out.println(" The Concepts size is : "+conceptList.size());
			ArrayList<String> Listc=new ArrayList<String>(); 
			for (int i = 0; i <= conceptList.size() - 1; i++) {
				Listc.add(conceptList.get(i).getName());
			}
			return (ArrayList<String>) Listc;
		}
	 	
	 	public boolean addConcept(Map<String, String> parentconcept,Map<String, String> childconcept, String Relation)
		{
	 		String userId = "test";
		 	String authKey = "0e4c30bd11d8474eb39f3ba8565160c4";
			Map<String, Object> req_ctx = ((BindingProvider)port).getRequestContext();
			Map<String, List<String>> headers = new HashMap();
			headers.put(Constants.userId, Collections.singletonList(userId));
			headers.put(Constants.authKey, Collections.singletonList(authKey));
		    req_ctx.put("javax.xml.ws.http.request.headers", headers);
		    Concept parentConcept = new Concept();
		    
			parentConcept.setDisplayName(parentconcept.get("parentName").toString());
			System.out.println("parent is "+ parentconcept.get("parentName").toString());
			parentConcept.setName(parentconcept.get("parentId").toString());
			Concept childConcept = new Concept();
			childConcept.setDisplayName(childconcept.get("childName").toString());
			childConcept.setName(childconcept.get("childId").toString());
			System.out.println(port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, childConcept, "specializationOf", parentConcept));
	
			/*return port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, childConcept, "specializationOf", parentConcept);*/
			return true;
		}
	 	public boolean updateConcept(String conceptname)
		{
	 		String userId = "test";
		 	String authKey = "e8442193a4784506836032dde71de4f2";
			Map<String, Object> req_ctx = ((BindingProvider)port).getRequestContext();
			Map<String, List<String>> headers = new HashMap();
			headers.put(Constants.userId, Collections.singletonList(userId));
			headers.put(Constants.authKey, Collections.singletonList(authKey));
		    req_ctx.put("javax.xml.ws.http.request.headers", headers);
			updateConcept = new Concept();
			updateConcept.setDisplayName(conceptname);
			updateConcept.setName(conceptname);
			return port.updateConcept("DesignWorkspace",Constants.knowledgeIdentifier, updateConcept);
		}
	 	public boolean updateRelation(String parent, String child, String relationold, String relationnew)
		{
	 		String userId = "test";
		 	String authKey = "e8442193a4784506836032dde71de4f2";
			Map<String, Object> req_ctx = ((BindingProvider)port).getRequestContext();
			Map<String, List<String>> headers = new HashMap();
			headers.put(Constants.userId, Collections.singletonList(userId));
			headers.put(Constants.authKey, Collections.singletonList(authKey));
		    req_ctx.put("javax.xml.ws.http.request.headers", headers);
			parentConcept.setDisplayName(parent);
			parentConcept.setName(parent);
			childConcept.setDisplayName(child);
			childConcept.setName(child);
			Oldrelation.setName(relationold);
			Newrelation.setName(relationnew);
			return port.updateRelation("DesignWorkspace", Constants.knowledgeIdentifier, childConcept, parentConcept, Oldrelation, Newrelation);
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
//					System.out.println("User is "+prop.getProperty("UserID"));
//					System.out.println("UserName is "+prop.getProperty("UserName"));
//					System.out.println("Userpassword is "+prop.getProperty("Userpassword"));
//					System.out.println("key is "+prop.getProperty("key"));
			 
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
				System.out.println(prop.getProperty("key"));
				return prop.getProperty("key");
		 }
		 
		 //* modify this code * //
		 public boolean WebServiceAddConcept(Map<String, String> parentconcept,Map<String, String> childconcept, String Relation)
			{
			 	String userId = "test";
			 	String authKey = "e8442193a4784506836032dde71de4f2";
//			 	System.out.println(authKey);
			 	/*DesignOntology service = new DesignOntology();
			 	DesignWorkspaceOntology port = service.getDesignWorkspaceOntologyPort();*/
				Map<String, Object> req_ctx = ((BindingProvider)port).getRequestContext();
				Map<String, List<String>> headers = new HashMap();
				headers.put(Constants.userId, Collections.singletonList(userId));
				headers.put(Constants.authKey, Collections.singletonList(authKey));
			    req_ctx.put("javax.xml.ws.http.request.headers", headers);
			    // test ping
				/*String returnString = port.ping("Hello");
				System.out.println(returnString);*/
//				port.initWorkspace("DesignWorkspace");
				// add concept
				Concept parentConcept = new Concept();
				parentConcept.setDisplayName(parentconcept.get("parentName").toString());
				parentConcept.setName(parentconcept.get("parentId").toString());
				System.out.println("+"+parentconcept.get("parentName").toString());
				Concept childConcept = new Concept();
				childConcept.setDisplayName(childconcept.get("childName").toString());
				childConcept.setName(childconcept.get("childId").toString());
				System.out.println("add"+" "+childconcept.get("childName").toString());
				/*return port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, parentConcept, Relation, childConcept);*/
				return true;
			}
}
