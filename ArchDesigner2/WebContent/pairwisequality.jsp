<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>	
<%@ page language="java" import="java.sql.*"%>
<%try {
    Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
    out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
}
	Connection conn = DriverManager.getConnection (
	    "jdbc:postgresql://localhost/ArchDB",
		"user", "password" );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pairwise Quality</title>
<script type='text/javascript' src='/ArchDesigner/dwr/engine.js'></script>
<script type='text/javascript' src='/ArchDesigner/dwr/util.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/DecisionServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/StakeholderServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/QualityServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ApplicationServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/PairwiseQuality.js'></script>
<script type="text/javascript"
	src="/ArchDesigner/js/jquery-1.3.2-vsdoc2.js"></script>
</head>
<body>

	<div id="container">
		
                    <%@include  file="dashboard.html" %>


		<div id="page-wrapper">
			<br>
			<div style="font-weight: bold; width: 300px;" id="divPwqList">
				<h2>Pairwise Quality List</h2></div>

			<div style="text-align: center; display: inline;" id="divPwqtable">
				<table id="Pwqtable" style="border: none;">
					<tbody>
						<tr>
							<td style="border: none;">&nbsp;</td>
							<td style="border: none;">&nbsp;</td>
						</tr>
			<%-- 	have bugs		<tr>
							<td style="border: none;"><label>Show Only</label></td>
							<td style="border: none;"><select id="select_info"
								style="width: 250px;">
								<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmta = conn.createStatement();
						    	ResultSet rsa;
					            rsa = stmta.executeQuery("SELECT * FROM application" );
					            while ( rsa.next() ) {
					                String appname = rsa.getString("AppName");
					                out.write("<OPTION VALUE=\"" + appname  + "\">" + appname  + "</OPTION>\n");
					            }
							%>
							</select></td>
						</tr> --%>
						<tr>
							<td style="border: none;">&nbsp;</td>
							<td style="border: none;">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<%
        try {
 	    Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
        }
		try {
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM application WHERE AppID =?");
            PreparedStatement pstmtstakeholder = conn.prepareStatement("SELECT * FROM stakeholder WHERE stakeholderid =?");
            PreparedStatement pstmtdecision = conn.prepareStatement("SELECT * FROM decision WHERE decisionid =?");
            PreparedStatement pstmtfquality = conn.prepareStatement("SELECT * FROM quality WHERE qualityid =?");
            PreparedStatement pstmtsquality = conn.prepareStatement("SELECT * FROM quality WHERE qualityid =?");
            
            ResultSet rs1;
            rs1 = stmt.executeQuery("SELECT * FROM pairwisequality" );
        	out.println( "<table class=\"table table-bordered table-hover table-striped\">" );
        	final ArrayList<Integer> stakeholderlist = new ArrayList<Integer>();
			final ArrayList<Integer> decisionlist = new ArrayList<Integer>();
			final ArrayList<Integer> fqualitylist = new ArrayList<Integer>();
			final ArrayList<Integer> squalitylist = new ArrayList<Integer>();
			ArrayList<Integer> applicationID = new ArrayList<Integer>();
			final ArrayList<String> weight = new ArrayList<String>();
			String applicationname=null;
			String stakeholdername=null;
			String decisionname=null;
			String fqualityname=null;
			String squalityname=null;
			int i=0;
            while ( rs1.next() ) {
            	i++;
            	weight.add(rs1.getString("weight"));
            	stakeholderlist.add(rs1.getInt("stakeholderid"));
            	decisionlist.add(rs1.getInt("decisionid"));
            	fqualitylist.add(rs1.getInt("firstqualityid"));
            	squalitylist.add(rs1.getInt("secondqualityid"));
            	applicationID.add(rs1.getInt("ApplicationID"));
            }
            out.println("<tr><td>"+"StakeholderName"+"</td> <td>"+ "DecisionName"+"</td>    <td>"+ "Quality1"+"</td>   <td>"+ "Quality2"+"</td>  <td>"+ "ApplicationName"+"</td> <td>"+ "Weight"+"</td> </tr>" );
            for(int j=0;j<i;j++)
            {	
            	 ResultSet stakeholder;
            	pstmtstakeholder.setInt(1, stakeholderlist.get(j));
            	stakeholder=pstmtstakeholder.executeQuery();
            	stakeholder.next();
            	stakeholdername =stakeholder.getString("stakeholdername");
            	
            	ResultSet decision;
            	pstmtdecision.setInt(1, decisionlist.get(j));
            	decision=pstmtdecision.executeQuery();
            	decision.next();
            	decisionname =decision.getString("decisionname");
            	
            	ResultSet fquality;
            	pstmtfquality.setInt(1, fqualitylist.get(j));
            	fquality=pstmtfquality.executeQuery();
            	fquality.next();
            	fqualityname =fquality.getString("qualityname");
            	
            	ResultSet squality;
            	pstmtsquality.setInt(1, squalitylist.get(j));
            	squality=pstmtsquality.executeQuery();
            	squality.next();
            	squalityname =squality.getString("qualityname");
            
            	ResultSet app;
            	pstmt.setInt(1, applicationID.get(j));
            	app = pstmt.executeQuery();
            	app.next();
            	applicationname =app.getString("appname");
     /*        	ResultSet rs2;
                pstmt.setInt(1, applicationID.get(j));
                rs2 = pstmt.executeQuery();
            	rs2.next();
        		applicationname =rs2.getString("AppName"); */
        		
            	out.println("<tr><td>"+stakeholdername+"</td> <td>"+ decisionname+"</td>     <td>"+ fqualityname+"</td>  <td>"+ squalityname+"</td> <td>"+ applicationname+"</td> <td>"+ weight.get(j)+"</td> </tr>" );
            }
	    out.println( "</table>" );
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
			</div>
			<br>


            <form action="PairwisequalityBusiness" method="post">
			<table id="PWQtable" style="border: none;">
				<tbody>
					<tr>
						<td style="border: none; font-weight: bold;"><label>Add
								a New Comparison</label></td>
						<td style="border: none;"></td>
					</tr>
					<tr>
						<td style="border: none;">&nbsp;</td>
						<td style="border: none;">&nbsp;</td>
					</tr>
					<tr>
						<td style="border: none;"><label>Stakeholder Name</label></td>
						<td style="border: none;"><select class="form-control" id="Stkselect" name="StkName"
							style="width: 250px;">
								<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmt = conn.createStatement();
						    	ResultSet rs1;
					            rs1 = stmt.executeQuery("SELECT * FROM stakeholder" );
					            while ( rs1.next() ) {
					                String appname = rs1.getString("stakeholdername");
					                out.write("<OPTION VALUE=\"" + appname  + "\">" + appname  + "</OPTION>\n");
					            }
							%>
						</select></td>
					</tr>
								<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
					<tr>
						<td style="border: none;"><label>Decision Name</label></td>
						<td style="border: none;"><select class="form-control" id="Decselect" name="DecName"
							style="width: 250px;">
							<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmtdec = conn.createStatement();
						    	ResultSet rsdec;
					            rsdec = stmtdec.executeQuery("SELECT * FROM decision" );
					            while ( rsdec.next() ) {
					                String decname = rsdec.getString("decisionname");
					                out.write("<OPTION VALUE=\"" + decname  + "\">" + decname  + "</OPTION>\n");
					            }
							%>
						</select></td>
					</tr>
								<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
					<tr>
						<td style="border: none;"><label>Quality 1</label></td>
						<td style="border: none;"><select class="form-control" id="Qlt1select" name="QltName1"
							style="width: 250px;">
								<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmtqua1 = conn.createStatement();
						    	ResultSet rsqua1;
					            rsqua1 = stmtqua1.executeQuery("SELECT * FROM quality" );
					            while ( rsqua1.next() ) {
					                String qua1name = rsqua1.getString("qualityname");
					                out.write("<OPTION VALUE=\"" + qua1name  + "\">" + qua1name  + "</OPTION>\n");
					            }
							%>
						</select></td>
					</tr>
								<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
					<tr>
						<td style="border: none;"><label>Quality 2</label></td>
						<td style="border: none;"><select class="form-control" id="Qlt2select" name="QltName2"
							style="width: 250px;">
									<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmtqua2 = conn.createStatement();
						    	ResultSet rsqua2;
					            rsqua2 = stmtqua2.executeQuery("SELECT * FROM quality" );
					            while ( rsqua2.next() ) {
					                String qua2name = rsqua2.getString("qualityname");
					                out.write("<OPTION VALUE=\"" + qua2name  + "\">" + qua2name  + "</OPTION>\n");
					            }
							%>
						</select></td>
					</tr>
								<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
					<tr>
						<td style="border: none;"><label>Application Name</label></td>
						<td style="border: none;"><select class="form-control" id="Appselect" name="AppName"
							style="width: 250px;">
							<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmtapp = conn.createStatement();
						    	ResultSet rsapp;
					            rsapp = stmtapp.executeQuery("SELECT * FROM application" );
					            while ( rsapp.next() ) {
					                String appname = rsapp.getString("AppName");
					                out.write("<OPTION VALUE=\"" + appname  + "\">" + appname  + "</OPTION>\n");
					            }
						    conn.close();
							%>
						</select></td>
					</tr>
								<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
					<tr>
						<td style="border: none;"><label>Weight</label></td>
						<td style="border: none;"><input class="form-control" type="text"
							id="WeightNameTxt" name="WeightName" value=''
							style="width: 250px;" /></td>
					</tr>
					<tr>
						<td style="border: none;">&nbsp;</td>
						<td style="border: none;">&nbsp;</td>
					</tr>
					<tr>
						<td style="border: none;"></td>
						<td style="border: none;"><input class="btn btn-info" value="Add New"
							type="submit" /></td>
					</tr>
								<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
					<script type="text/javascript">
						var addPWQ = function() {
							var arr = [];
							var ddlSta = document.getElementById('Stkselect');
							var valSta = ddlSta.options[ddlSta.selectedIndex].value;
							arr.push(valSta);
							//alert(valSta);
							var ddldec = document.getElementById('Decselect');
							var valdec = ddldec.options[ddldec.selectedIndex].value;
							//alert(valdec);
							arr.push(valdec);
							var ddlqua1 = document.getElementById('Qlt1select');
							var valqua1 = ddlqua1.options[ddlqua1.selectedIndex].value;
							//alert(valqua1);
							arr.push(valqua1);
							var ddlqua2 = document.getElementById('Qlt2select');
							var valqua2 = ddlqua2.options[ddlqua2.selectedIndex].value;
							//alert(valqua2);
							arr.push(valqua2);
							var ddl = document.getElementById('Appselect');
							var val = ddl.options[ddl.selectedIndex].value;
							arr.push(val);
							arr.push(document.getElementById('WeightNameTxt').value);
							//	arr.push(document.getElementById('DecNameTxt').value);
							PairwiseQuality.savepairwisequality(arr, ar);
						}
						var ar = function() {
							alert("Success");
						}
					</script>
				</tbody>
			</table>
            
            </form>
		</div>
</body>
</html>