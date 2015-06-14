package Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

public class ApplicationServer
{
	// new 
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password";
	public void saveapplication(String[] value)
	{
		Connection con = null;
        try {
        	con = DriverManager.getConnection(url, user, password);
        	PreparedStatement pst = con.prepareStatement("INSERT into application VALUES(?,?)");
            pst.setString(1, value[0]);
	        pst.setString(2,value[1]);
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
	}
	// - old
	private static ArrayList<String[]> a = new ArrayList<String[]>();
	public void SetApplicationValue(String[] value)
	{
		a.add(value);
//		System.out.print(Arrays.asList(value));
		System.out.print(Arrays.asList(a));
	}
	
	
	public ArrayList<ArrayList<String>> GetApplicationFullList()
	{
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		Connection con = null;
        try {
        	con = DriverManager.getConnection(url, user, password);
        	PreparedStatement pst = con.prepareStatement("SELECT * FROM application");
        	ResultSet rs1 = pst.executeQuery();
        	while(rs1.next())
        	{
        		ArrayList<String> temp = new ArrayList<String>();
        		temp.add(rs1.getString("AppName"));
        		temp.add(rs1.getString("remark"));
        		list.add(temp);
        	}
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
		
		return list;
	}
	
	
	public ArrayList<String> GetApplicationList()
	{
		ArrayList<String> list = new ArrayList<String>();
		Connection con = null;
        try {
        	con = DriverManager.getConnection(url, user, password);
        	PreparedStatement pst = con.prepareStatement("SELECT * FROM application");
        	ResultSet rs1 = pst.executeQuery();
        	while(rs1.next())
        	{
        		list.add(rs1.getString("AppName"));
        	}
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
		
		return list;
	}
	
	public ArrayList<String[]> GetApplicationValue()
	{
		return a;
	}
}
