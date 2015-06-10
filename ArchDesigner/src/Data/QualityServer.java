package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class QualityServer
{
	// new 	
		private static String url = "jdbc:postgresql://localhost/ArchDB";
		private static String user = "user";
		private static String password = "password";
		public void savequality(String[] value)
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
	        	PreparedStatement pst = con.prepareStatement("INSERT into quality VALUES(?,?,?)");
	        	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM application WHERE AppName =?");
	        	ResultSet rs2;
	            pstmt.setString(1,value[1]);
	            rs2 = pstmt.executeQuery();
	        	rs2.next();
	    		Integer applicationid =rs2.getInt("appid");
	            pst.setString(1, value[0]);
	            pst.setString(3,value[2]);
	            pst.setInt(2,applicationid);
		        pst.execute();
		        pst.close();
	        } catch (SQLException ex) {
	        	ex.printStackTrace();
	        }
		}
		
	// old	
	private static ArrayList<String[]> quality = new ArrayList<String[]>();
	
		public void SetQualityValue(String[] value)
		{
			quality.add(value);
			System.out.print(Arrays.asList(value));
//			System.out.print(Arrays.asList(decision));
		}
		public ArrayList<String[]> GetQualityValue()
		{
//			decision.add(a);
			return quality;
		}	
}
