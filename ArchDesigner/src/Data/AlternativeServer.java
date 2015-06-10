package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class AlternativeServer
{
	// new 	
			private static String url = "jdbc:postgresql://localhost/ArchDB";
			private static String user = "user";
			private static String password = "password";
			public void savealternative(String[] value)
			{
				System.out.print("add Alternative");
				try {
				    Class.forName("org.postgresql.Driver");
				} catch (ClassNotFoundException e) {
				    e.printStackTrace();
				}
				Connection con = null;
		        try {
		        	con = DriverManager.getConnection(url, user, password);
		        	PreparedStatement pst = con.prepareStatement("INSERT into alternative VALUES(?,?,?,?)");
		        	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM application WHERE AppName =?");
		        	PreparedStatement pstmtdec = con.prepareStatement("SELECT * FROM decision WHERE decisionname =?");
		        	ResultSet rs2;
		        	ResultSet rs3;
		            pstmt.setString(1,value[1]);
		            pstmtdec.setString(1,value[2]);
		            rs2 = pstmt.executeQuery();
		            rs3 = pstmtdec.executeQuery();
		        	rs2.next();
		        	rs3.next();
		    		Integer applicationid =rs2.getInt("appid");
		    		Integer decsionid =rs3.getInt("decisionid");
		            pst.setString(1, value[0]);
		            pst.setString(4,value[3]);
		            pst.setInt(2,applicationid);
		            pst.setInt(3,decsionid);
			        pst.execute();
			        pst.close();
		        } catch (SQLException ex) {
		        	ex.printStackTrace();
		        }
			}
		private static ArrayList<String[]> alternative = new ArrayList<String[]>();
		
			public void SetAlternativeValue(String[] value)
			{
				alternative.add(value);
//				System.out.print(Arrays.asList(decision));
			}
			public ArrayList<String[]> GetAlternativeValue()
			{
//				decision.add(a);
				return alternative;
			}	
	
}
