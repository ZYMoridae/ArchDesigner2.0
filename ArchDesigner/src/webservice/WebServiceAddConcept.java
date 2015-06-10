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
import restclient.AuthenticationClient;
import soapclient.Concept;
import soapclient.DesignOntology;
import soapclient.DesignWorkspaceOntology;
import util.Constants;

public class WebServiceAddConcept {
	public static SystemUser systemUser;
	public static SystemUser tempSystemUser;
	public static List<String> relationlists;
	public static ArrayList<Concept> conceptList;
	public static String password;
	public static DesignOntology service = new DesignOntology();
	public static DesignWorkspaceOntology port = service.getDesignWorkspaceOntologyPort();

	public static void main(String args[]) {
		try {
			/*InitWorkspaces workspace=new InitWorkspaces();
			 Authorization a = new Authorization();
			 a.authorization();*/
//			System.out.print("SAM");
//			System.out.println(response());
//			// AddConcepts();
			CallWebService b = new CallWebService();
			/*System.out.print(b.getConcepts());*/
		} catch (Exception e) {
			System.out.println("Error reading");
		}
	}

	public static ArrayList<String> AddConcepts() {
		String userId = "test";
		String authKey = "ab6568aec3664bce9323336162fa2c87";
		Map<String, Object> req_ctx = ((BindingProvider) port).getRequestContext();
		Map<String, List<String>> headers = new HashMap();
		headers.put(Constants.userId, Collections.singletonList(userId));
		headers.put(Constants.authKey, Collections.singletonList(authKey));
		req_ctx.put("javax.xml.ws.http.request.headers", headers);

		Concept parentConcept = new Concept();
		parentConcept.setName("Knowledge");
		Concept childConcept = new Concept();
		childConcept.setName("ASR");
		if (port.addConcept("DesignWorkspace", Constants.knowledgeIdentifier, childConcept, "specializationOf", parentConcept)) {
			System.out.println("Hello");
		}
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

	/*public static ArrayList<Concept> GetConcepts() {
		String userId = "test";
		String authKey = "a19b939cad1647c0af546ad4db98e570";
		Map<String, Object> req_ctx = ((BindingProvider) port).getRequestContext();
		Map<String, List<String>> headers = new HashMap();
		headers.put(Constants.userId, Collections.singletonList(userId));
		headers.put(Constants.authKey, Collections.singletonList(authKey));
		req_ctx.put("javax.xml.ws.http.request.headers", headers);
		Concept parentConcept = new Concept();
		parentConcept.setName("Knowledge");
		conceptList = (ArrayList) port.getConceptListOfParents("DesignWorkspace", Constants.knowledgeIdentifier, parentConcept);
		 
		return (ArrayList<Concept>) conceptList;
	}*/

/*	public static void me() {
		String userId = "test";
		String authKey = "1732b9274a634670a5559bf2732a164c";
		Map<String, Object> req_ctx = ((BindingProvider) port).getRequestContext();
		Map<String, List<String>> headers = new HashMap();
		headers.put(Constants.userId, Collections.singletonList(userId));
		headers.put(Constants.authKey, Collections.singletonList(authKey));
		req_ctx.put("javax.xml.ws.http.request.headers", headers);
		Concept parentConcept = new Concept();
		parentConcept.setName("Knowledge");
		conceptList = (ArrayList) port.getConceptListOfParents("DesignWorkspace", Constants.knowledgeIdentifier, parentConcept);
		for (int i = 0; i <= conceptList.size() - 1; i++) {
			System.out.println(conceptList.get(i).getName());
		}
	}*/
	public static String response() {
		String userId = "test";
		String authKey = "1732b9274a634670a5559bf2732a164c";
		System.out.println(authKey);
		DesignOntology service = new DesignOntology();
		DesignWorkspaceOntology port = service.getDesignWorkspaceOntologyPort();
		Map<String, Object> req_ctx = ((BindingProvider) port).getRequestContext();
		Map<String, List<String>> headers = new HashMap();
		headers.put(Constants.userId, Collections.singletonList(userId));
		headers.put(Constants.authKey, Collections.singletonList(authKey));
		req_ctx.put("javax.xml.ws.http.request.headers", headers);
		return port.ping("Hello");
	}
}
