package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class PairwiseAlternative
{	
	
	// new 	
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password";
	public void savepairwisealternative(String[] value)
	{
		System.out.print("add alternative");
		try {
		    Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		Connection con = null;
        try {
        	con = DriverManager.getConnection(url, user, password);
        	PreparedStatement pst = con.prepareStatement("INSERT into pairwisealternative VALUES(?,?,?,?,?,?)");
        	
        	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM application WHERE AppName =?");
        	PreparedStatement pstmtquality = con.prepareStatement("SELECT * FROM quality WHERE qualityname =?");
        	PreparedStatement pstmtdecision = con.prepareStatement("SELECT * FROM decision WHERE decisionname =?");
        	PreparedStatement firstpstmtalternative = con.prepareStatement("SELECT * FROM alternative WHERE alternativename =?");
        	PreparedStatement secondpstmtalternative = con.prepareStatement("SELECT * FROM alternative WHERE alternativename =?");
        	
        	ResultSet decision;
    		pstmtdecision.setString(1,value[0]);
    		decision = pstmtdecision.executeQuery();
    		decision.next();
    		Integer decisionid =decision.getInt("decisionid");
    		pst.setInt(1,decisionid);
    		
    		
        	ResultSet rs2;
            pstmt.setString(1,value[4]);
            rs2 = pstmt.executeQuery();
        	rs2.next();
    		Integer applicationid =rs2.getInt("appid");
    	    pst.setInt(5,applicationid);
    	    
        	Integer qualityid =null;
    		ResultSet quality;
    		pstmtquality.setString(1,value[1]);
    		quality = pstmtquality.executeQuery();
    		quality.next();
    		qualityid =quality.getInt("qualityid");
    		pst.setInt(2,qualityid);

    		ResultSet firstalternative;
    		firstpstmtalternative.setString(1,value[2]);
    		firstalternative = firstpstmtalternative.executeQuery();
    		firstalternative.next();
    		Integer firstalternativeid =firstalternative.getInt("alternativeid");
    		pst.setInt(3,firstalternativeid);
    		
    		ResultSet secondalternative;
    		secondpstmtalternative.setString(1,value[3]);
    		secondalternative = secondpstmtalternative.executeQuery();
    		secondalternative.next();
    		Integer secondalternativeid =secondalternative.getInt("alternativeid");
    		pst.setInt(4,secondalternativeid);
            pst.setInt(6, Integer.valueOf(value[5]));
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
	}
	
// old	
	private static ArrayList<String[]> pairwisealternative = new ArrayList<String[]>();
	
	public void SetPairwiseAlternativeValue(String[] value)
	{
		pairwisealternative.add(value);		
//		System.out.print(Arrays.asList(decision));
	}
	public ArrayList<String[]> GetPairwiseAlternativeValue()
	{
//		decision.add(a);
		return pairwisealternative;
	}
	public String getpairwiseweight(int i)
	{
		return pairwisealternative.get(i)[5];
	}
}
