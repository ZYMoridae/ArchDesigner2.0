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
 * Servlet implementation class AlternativeBusiness
 */
public class AlternativeBusiness extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlternativeBusiness() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String alternativename = request.getParameter("AltName");
		String appName = request.getParameter("appName");
		String decisionName = request.getParameter("DecName");
		String remark = request.getParameter("rmkText");
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
            pstmt.setString(1,appName);
            pstmtdec.setString(1,decisionName);
            rs2 = pstmt.executeQuery();
            rs3 = pstmtdec.executeQuery();
        	rs2.next();
        	rs3.next();
    		Integer applicationid =rs2.getInt("appid");
    		Integer decsionid =rs3.getInt("decisionid");
            pst.setString(1, alternativename);
            pst.setString(4,remark);
            pst.setInt(2,applicationid);
            pst.setInt(3,decsionid);
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
        response.sendRedirect("alternative.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
