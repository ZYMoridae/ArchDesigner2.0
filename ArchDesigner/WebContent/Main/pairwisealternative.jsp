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
<title>Pairwise Alternative</title>
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
	src='/ArchDesigner/dwr/interface/AlternativeServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/PairwiseAlternative.js'></script>
<script type="text/javascript"
	src="/ArchDesigner/js/jquery-1.3.2-vsdoc2.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="/ArchDesigner/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/ArchDesigner/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/ArchDesigner/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/ArchDesigner/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>

	<div id="container">
		   <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <a class="navbar-brand" href="/ArchDesigner/Main/mainpage.jsp">ArchDesigner v2.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <!--
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Preparation</a>
                        </li>
                    -->






                    <!--Modify the side bar-->
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Preparation<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/ArchDesigner/Main/decision.jsp">Decision</a>
                                </li>
                                <li>
                                    <a href="/ArchDesigner/Main/stakeholder.jsp">Stakeholder</a>
                                </li>
                                <li>
                                    <a href="/ArchDesigner/Main/quality.jsp">Quality</a>
                                </li>
                                <li>
                                    <a href="/ArchDesigner/Main/alternative.jsp">Alternative</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <!--
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                    -->
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Scoring<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/ArchDesigner/Main/pairwisequality.jsp">Pairwise Quality</a>
                                </li>
                                <li>
                                    <a href="/ArchDesigner/Main/pairwisealternative.jsp">Pairwise Alternative</a>
                                </li>
                                <li>
                                    <a href="/ArchDesigner/Main/scorealternative.jsp">Score Alternative</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
		  <li>
                            <a href="/ArchDesigner/Main/combinationcentric.jsp"><i class="fa fa-table fa-fw"></i> Combination-Centric</a>
                        </li>
		
		<!--
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                        </li>
		-->


                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

    </div>
    <!-- /#wrapper -->


		<div id="page-wrapper">
			<br>
			<div style="font-weight: bold; width: 300px;" id="divPwaList">Pairwise
				Alternative List</div>

			<div style="text-align: center; display: inline;" id="divPwatable">
				<table id="Pwatable" style="border: none;">
					<tbody>
						<tr>
							<td style="border: none;">&nbsp;</td>
							<td style="border: none;">&nbsp;</td>
						</tr>
						<tr>
					<%-- 	have bugs	<td style="border: none;"><label>Show Only</label></td>
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
							%> --%>
							</select></td>
						</tr>
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
            PreparedStatement pstmtdecision = conn.prepareStatement("SELECT * FROM decision WHERE decisionid =?");
            PreparedStatement pstmtquality = conn.prepareStatement("SELECT * FROM quality WHERE qualityid =?");
            PreparedStatement pstmtfquality = conn.prepareStatement("SELECT * FROM alternative WHERE alternativeid =?");
            PreparedStatement pstmtsquality = conn.prepareStatement("SELECT * FROM alternative WHERE alternativeid =?");
            
            ResultSet rs1;
            rs1 = stmt.executeQuery("SELECT * FROM pairwisealternative" );
        	out.println( "<table class=\"table table-bordered table-hover table-striped\">" );
        	final ArrayList<Integer> qualitylist = new ArrayList<Integer>();
			final ArrayList<Integer> decisionlist = new ArrayList<Integer>();
			final ArrayList<Integer> falternativelist = new ArrayList<Integer>();
			final ArrayList<Integer> salternativelist = new ArrayList<Integer>();
			ArrayList<Integer> applicationID = new ArrayList<Integer>();
			final ArrayList<String> weight = new ArrayList<String>();
			String applicationname=null;
			String qualityname=null;
			String decisionname=null;
			String fqualityname=null;
			String squalityname=null;
			int i=0;
            while ( rs1.next() ) {
            	i++;
            	weight.add(rs1.getString("weight"));
           		qualitylist.add(rs1.getInt("qualityid"));  
            	decisionlist.add(rs1.getInt("decisionid"));
            	falternativelist.add(rs1.getInt("firstalternativeid"));
            	salternativelist.add(rs1.getInt("secondalternativeid"));
            	applicationID.add(rs1.getInt("ApplicationID"));
            }
            out.println("<tr><td>"+"DecisionName"+"</td> <td>"+ "QualityName"+"</td>    <td>"+ "Alternative1"+"</td>   <td>"+ "Alternative2"+"</td>  <td>"+ "ApplicationName"+"</td> <td>"+ "Weight"+"</td> </tr>" );
            for(int j=0;j<i;j++)
            {	
            	 ResultSet stakeholder;
            	pstmtquality.setInt(1, qualitylist.get(j));
            	stakeholder=pstmtquality.executeQuery();
            	stakeholder.next();
            	qualityname =stakeholder.getString("qualityname");
            	
            	ResultSet decision;
            	pstmtdecision.setInt(1, decisionlist.get(j));
            	decision=pstmtdecision.executeQuery();
            	decision.next();
            	decisionname =decision.getString("decisionname");
            	
            	ResultSet fquality;
            	pstmtfquality.setInt(1, falternativelist.get(j));
            	fquality=pstmtfquality.executeQuery();
            	fquality.next();
            	fqualityname =fquality.getString("alternativename");
            	
            	ResultSet squality;
            	pstmtsquality.setInt(1, salternativelist.get(j));
            	squality=pstmtsquality.executeQuery();
            	squality.next();
            	squalityname =squality.getString("alternativename");
            
            	ResultSet app;
            	pstmt.setInt(1, applicationID.get(j));
            	app = pstmt.executeQuery();
            	app.next();
            	applicationname =app.getString("appname"); 
          		ResultSet rs2;
                pstmt.setInt(1, applicationID.get(j));
                rs2 = pstmt.executeQuery();
            	rs2.next();
        		applicationname =rs2.getString("AppName");
        		
             out.println("<tr><td>"+decisionname+"</td> <td>"+ qualityname+"</td>     <td>"+ fqualityname+"</td>  <td>"+ squalityname+"</td> <td>"+ applicationname+"</td> <td>"+ weight.get(j)+"</td> </tr>" ); 
            }
	    out.println( "</table>" );
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
			</div>
			<br>

			<script type="text/javascript">
				
			</script>
			<table id="PWAtable" style="border: none;">
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
						<td style="border: none;"><label>Decision Name</label></td>
						<td style="border: none;"><select class="form-control" id="Decselect"
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
						<td style="border: none;"><label>Quality Name</label></td>
						<td style="border: none;"><select class="form-control" id="Qltyselect"
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
						<td style="border: none;"><label>Alternative 1</label></td>
						<td style="border: none;"><select class="form-control" id="Alt1select"
							style="width: 250px;">
								<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmtalt1 = conn.createStatement();
						    	ResultSet rsalt1;
					            rsalt1 = stmtalt1.executeQuery("SELECT * FROM alternative" );
					            while ( rsalt1.next() ) {
					                String alt1name = rsalt1.getString("alternativename");
					                out.write("<OPTION VALUE=\"" + alt1name  + "\">" + alt1name  + "</OPTION>\n");
					            }
							%>
						</select></td>
					</tr>
					<tr>
						<td style="border: none;"><label>Alternative 2</label></td>
						<td style="border: none;"><select class="form-control" id="Alt2select"
							style="width: 250px;">
							<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmtalt2= conn.createStatement();
						    	ResultSet rsalt2;
					            rsalt2 = stmtalt2.executeQuery("SELECT * FROM alternative" );
					            while ( rsalt2.next() ) {
					                String alt2name = rsalt2.getString("alternativename");
					                out.write("<OPTION VALUE=\"" + alt2name  + "\">" + alt2name  + "</OPTION>\n");
					            }
							%>
						</select></td>
					</tr>
					<tr>
						<td style="border: none;"><label>Application Name</label></td>
						<td style="border: none;"><select class="form-control" id="Appselect"
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
							type="button" onclick="addPWA();"/></td>
					</tr>
					<script type="text/javascript">
						var addPWA = function() {
							var arr = [];
							var ddldec = document.getElementById('Decselect');
							var valdec = ddldec.options[ddldec.selectedIndex].value;
							//alert(valdec);
							arr.push(valdec);
							var ddlqua1 = document.getElementById('Qltyselect');
							var valqua1 = ddlqua1.options[ddlqua1.selectedIndex].value;
							//alert(valqua1);
							arr.push(valqua1);
							var ddlalt1 = document.getElementById('Alt1select');
							var valalt1 = ddlalt1.options[ddlalt1.selectedIndex].value;
							//alert(valqua2);
							arr.push(valalt1);
							var ddlalt2 = document.getElementById('Alt2select');
							var valalt2 = ddlalt2.options[ddlalt2.selectedIndex].value;
							//alert(valqua2);
							arr.push(valalt2);
							var ddl = document.getElementById('Appselect');
							var val = ddl.options[ddl.selectedIndex].value;
							//alert(val);
							arr.push(val);
							arr
									.push(document
											.getElementById('WeightNameTxt').value);
							//	alert(document.getElementById('WeightNameTxt').value);
							//	arr.push(document.getElementById('DecNameTxt').value);
							PairwiseAlternative.savepairwisealternative(
									arr, ar);
						}
						var ar = function() {
							alert("Success");
						}
					</script>
				</tbody>
			</table>

		</div>
            <!-- jQuery -->
    <script src="/ArchDesigner/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/ArchDesigner/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/ArchDesigner/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/ArchDesigner/bower_components/raphael/raphael-min.js"></script>
    <script src="/ArchDesigner/bower_components/morrisjs/morris.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/ArchDesigner/dist/js/sb-admin-2.js"></script>
</body>
</html>