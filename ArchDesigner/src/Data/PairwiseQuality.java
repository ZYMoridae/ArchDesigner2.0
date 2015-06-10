package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class PairwiseQuality
{
	// new 	
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password";
	public void savepairwisequality(String[] value)
	{
		System.out.print("add quality");
		try {
		    Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		Connection con = null;
        try {
        	con = DriverManager.getConnection(url, user, password);
        	PreparedStatement pst = con.prepareStatement("INSERT into pairwisequality VALUES(?,?,?,?,?,?)");
        	
        	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM application WHERE AppName =?");
        	PreparedStatement pstmtstakeholder = con.prepareStatement("SELECT * FROM stakeholder WHERE stakeholdername =?");
        	PreparedStatement pstmtdecision = con.prepareStatement("SELECT * FROM decision WHERE decisionname =?");
        	PreparedStatement firstpstmtquality = con.prepareStatement("SELECT * FROM quality WHERE qualityname =?");
        	PreparedStatement secondpstmtquality = con.prepareStatement("SELECT * FROM quality WHERE qualityname =?");
        	ResultSet rs2;
            pstmt.setString(1,value[4]);
            rs2 = pstmt.executeQuery();
        	rs2.next();
    		Integer applicationid =rs2.getInt("appid");
    	    pst.setInt(5,applicationid);
        	Integer stakeholderid =null;
    		ResultSet stakeholder;
    		pstmtstakeholder.setString(1,value[0]);
    		stakeholder = pstmtstakeholder.executeQuery();
    		if(stakeholder.next())
    		{
    			stakeholderid =stakeholder.getInt("stakeholderid");
    		}
    		pst.setInt(1,stakeholderid);
    		
    		ResultSet decision;
    		pstmtdecision.setString(1,value[1]);
    		decision = pstmtdecision.executeQuery();
    		decision.next();
    		Integer decisionid =decision.getInt("decisionid");
    		pst.setInt(2,decisionid);
    		
    		ResultSet firstquality;
    		firstpstmtquality.setString(1,value[2]);
    		firstquality = firstpstmtquality.executeQuery();
    		firstquality.next();
    		Integer firstqualityid =firstquality.getInt("qualityid");
    		pst.setInt(3,firstqualityid);
    		
    		ResultSet secondquality;
    		secondpstmtquality.setString(1,value[3]);
    		secondquality = secondpstmtquality.executeQuery();
    		secondquality.next();
    		Integer secondqualityid =secondquality.getInt("qualityid");
    		pst.setInt(4,secondqualityid);
            pst.setInt(6, Integer.valueOf(value[5]));
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
	}
	
// old	

	private static ArrayList<String[]> pairwisequality = new ArrayList<String[]>();
	private static ArrayList<String> stakeholder = new ArrayList<String>();
//		System.out.print(Arrays.asList(decision));
	
		public void SetPairwiseQualityValue(String[] value)
		{	
		
			ArrayList<String[]> pairwisequality = new ArrayList<String[]>();
/*			a.put("sadad",pairwisequality);*/
			pairwisequality.add(value);
			System.out.print(Arrays.asList(value));
//			System.out.print(Arrays.asList(decision));
		}
		public ArrayList<String[]> GetPairwiseQualityValue()
		{
//			decision.add(a);
			return pairwisequality;
		}
		public String getpairwiseweight(int i)
		{
			return pairwisequality.get(i)[5];
		}

}
