package com.business;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PairwisequalityBusiness
 */
public class PairwisequalityBusiness extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PairwisequalityBusiness() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stakeholderName = request.getParameter("StkName");
		String decisionName = request.getParameter("DecName");
		String quality1Name = request.getParameter("QltName1");
		String quality2Name = request.getParameter("QltName2");
		String appName = request.getParameter("AppName");
		String weight = request.getParameter("WeightName");
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
            pstmt.setString(1,appName);
            rs2 = pstmt.executeQuery();
        	rs2.next();
    		Integer applicationid =rs2.getInt("appid");
    	    pst.setInt(5,applicationid);
        	Integer stakeholderid =null;
    		ResultSet stakeholder;
    		pstmtstakeholder.setString(1,stakeholderName);
    		stakeholder = pstmtstakeholder.executeQuery();
    		if(stakeholder.next())
    		{
    			stakeholderid =stakeholder.getInt("stakeholderid");
    		}
    		pst.setInt(1,stakeholderid);
    		
    		ResultSet decision;
    		pstmtdecision.setString(1,decisionName);
    		decision = pstmtdecision.executeQuery();
    		decision.next();
    		Integer decisionid =decision.getInt("decisionid");
    		pst.setInt(2,decisionid);
    		
    		ResultSet firstquality;
    		firstpstmtquality.setString(1,quality1Name);
    		firstquality = firstpstmtquality.executeQuery();
    		firstquality.next();
    		Integer firstqualityid =firstquality.getInt("qualityid");
    		pst.setInt(3,firstqualityid);
    		
    		ResultSet secondquality;
    		secondpstmtquality.setString(1,quality2Name);
    		secondquality = secondpstmtquality.executeQuery();
    		secondquality.next();
    		Integer secondqualityid =secondquality.getInt("qualityid");
    		pst.setInt(4,secondqualityid);
            pst.setInt(6, Integer.valueOf(weight));
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
        response.sendRedirect("pairwisequality.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
