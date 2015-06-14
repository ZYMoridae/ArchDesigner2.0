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
 * Servlet implementation class PairwisealternativeBusiness
 */
public class PairwisealternativeBusiness extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password"; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PairwisealternativeBusiness() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String decisionName = request.getParameter("DecName");
		String qualityName = request.getParameter("QltName");
		String alternative1Name = request.getParameter("Alt1Name");
		String alternative2Name = request.getParameter("Alt2Name");
		String appName = request.getParameter("AppName");
		String weight = request.getParameter("WeightNameTxt");
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
    		pstmtdecision.setString(1,decisionName);
    		decision = pstmtdecision.executeQuery();
    		decision.next();
    		Integer decisionid =decision.getInt("decisionid");
    		pst.setInt(1,decisionid);
    		
    		
        	ResultSet rs2;
            pstmt.setString(1,appName);
            rs2 = pstmt.executeQuery();
        	rs2.next();
    		Integer applicationid =rs2.getInt("appid");
    	    pst.setInt(5,applicationid);
    	    
        	Integer qualityid =null;
    		ResultSet quality;
    		pstmtquality.setString(1,qualityName);
    		quality = pstmtquality.executeQuery();
    		quality.next();
    		qualityid =quality.getInt("qualityid");
    		pst.setInt(2,qualityid);

    		ResultSet firstalternative;
    		firstpstmtalternative.setString(1,alternative1Name);
    		firstalternative = firstpstmtalternative.executeQuery();
    		firstalternative.next();
    		Integer firstalternativeid =firstalternative.getInt("alternativeid");
    		pst.setInt(3,firstalternativeid);
    		
    		ResultSet secondalternative;
    		secondpstmtalternative.setString(1,alternative2Name);
    		secondalternative = secondpstmtalternative.executeQuery();
    		secondalternative.next();
    		Integer secondalternativeid =secondalternative.getInt("alternativeid");
    		pst.setInt(4,secondalternativeid);
            pst.setInt(6, Integer.valueOf(weight));
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
		response.sendRedirect("pairwisealternative.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
