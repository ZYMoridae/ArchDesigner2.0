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
 * Servlet implementation class StakeholderProcess
 */
public class StakeholderBusiness extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	public static String url = "jdbc:postgresql://localhost/ArchDB";
	public static String user = "user";
	public static String password = "password";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StakeholderBusiness() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stkName = request.getParameter("StkName");
		String stkApp = request.getParameter("StkApp");
		String stkRemark = request.getParameter("StkRemark");
		System.out.println("---------------------------------------");
		System.out.print("Add Stakholder Successfully!");
		try {
		    Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		Connection con = null;
        try {
        	con = DriverManager.getConnection(url, user, password);
        	PreparedStatement pst = con.prepareStatement("INSERT into stakeholder VALUES(?,?,?)");
        	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM application WHERE AppName =?");
        	ResultSet rs2;
            pstmt.setString(1,stkApp);
            rs2 = pstmt.executeQuery();
        	rs2.next();
    		Integer applicationid =rs2.getInt("appid");
            pst.setString(1, stkName);
            pst.setString(3,stkRemark);
            pst.setInt(2,applicationid);
	        pst.execute();
	        pst.close();
        } catch (SQLException ex) {
        	ex.printStackTrace();
        }
        response.sendRedirect("stakeholder.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
