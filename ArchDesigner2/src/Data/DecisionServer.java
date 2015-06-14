package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class DecisionServer
{
// new 	
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password";
	public void savedecision(String[] value)
	{
		System.out.print("add decision");
		try {
		    Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		Connection con = null;
        try {
        	con = DriverManager.getConnection(url, user, password);
        	PreparedStatement pst = con.prepareStatement("INSERT into decision VALUES(?,?,?,?)");
        	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM application WHERE AppName =?");
        	ResultSet rs2;
            pstmt.setString(1,value[1]);
            rs2 = pstmt.executeQuery();
        	rs2.next();
    		Integer applicationid =rs2.getInt("appid");
            pst.setString(1, value[0]);
            pst.setInt(2,Integer.valueOf(value[2]));
            pst.setString(3,value[3]);
            pst.setInt(4,applicationid);
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
	}
	
// old	
	private static ArrayList<String[]> decision = new ArrayList<String[]>();
	
//private static String[] a = {"L","R","3","T"};
	public void SetDecisionValue(String[] value)
	{
		decision.add(value);
		System.out.print(Arrays.asList(value));
//		System.out.print(Arrays.asList(decision));
	}
	public ArrayList<String[]> GetDecisionValue()
	{
//		decision.add(a);
		return decision;
	}
	public String getdecisionweight(int i)
	{
		return decision.get(i)[2];
	}
}
