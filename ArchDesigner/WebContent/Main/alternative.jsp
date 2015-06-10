<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>	
<%@ page language="java" import="java.sql.*"%>
<%try {
    Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
    out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alternative List</title>
<script type='text/javascript' src='/ArchDesigner/dwr/engine.js'></script>
<script type='text/javascript' src='/ArchDesigner/dwr/util.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/AlternativeServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ApplicationServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/AlternativeServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/DecisionServer.js'></script>
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
	<div style="font-weight: bold; width: 300px;" id="divAltList">Alternative
		List</div>
<!-- 	<input value="Showlist" type="button" onclick="show();"
		style="margin-left: 400px;" /> -->
	<div style="text-align: center; display: inline;" id="divAlttable">
<!-- 		<table id="myTable">
			<tbody>
				<tr>
					<td>Alternative Name</td>
					<td>Application Name</td>
					<td>Decision Name</td>
					<td>Remark</td>
				</tr>
			</tbody>
		</table> -->
			<%
			try {
				    Class.forName("org.postgresql.Driver");
			    } catch (ClassNotFoundException e) {
			        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
			    }
			
			Connection conn = DriverManager.getConnection (
			    "jdbc:postgresql://localhost/ArchDB",
				"user", "password" );
        try {
 	    Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
        }
		try {
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM application WHERE AppID =?");
            PreparedStatement pstmtdec = conn.prepareStatement("SELECT * FROM decision WHERE decisionid =?");
            ResultSet rs1;
            rs1 = stmt.executeQuery("SELECT * FROM alternative" );
        	out.println( "<table class=\"table table-bordered table-hover table-striped\">" );
			final ArrayList<String> decisionlist = new ArrayList<String>();
			final ArrayList<String> remark = new ArrayList<String>();
			ArrayList<Integer> applicationID = new ArrayList<Integer>();
			ArrayList<Integer> decisionID = new ArrayList<Integer>();
			String applicationname=null;
			String decisionname=null;
			int i=0;
            while ( rs1.next() ) {
            	i++;
            	decisionlist.add(rs1.getString("alternativename"));
            	remark.add(rs1.getString("remark"));
            	applicationID.add(rs1.getInt("ApplicationID"));
            	decisionID.add(rs1.getInt("decisionid"));
            }
            out.println("<tr><td>"+"AlternativeName"+"</td> <td>"+ "ApplicationName"+"</td>   <td>"+ "DecisionName"+"</td>  <td>"+ "remark"+"</td>   </tr>" );
             for(int j=0;j<i;j++)
            {	
            	ResultSet rs2;
          		ResultSet rs3; 
                pstmt.setInt(1, applicationID.get(j));
         		pstmtdec.setInt(1, decisionID.get(j));
                rs2 = pstmt.executeQuery();
         		rs3 = pstmtdec.executeQuery(); 
            	rs2.next();
        		rs3.next(); 
        		applicationname =rs2.getString("AppName");
        		decisionname =rs3.getString("decisionname"); 
        		/* out.println(decisionname); */
            	out.println("<tr><td>"+decisionlist.get(j)+"</td> <td>"+ applicationname+"</td>   <td>"+ decisionname+"</td>   <td>"+ remark.get(j)+"</td>   </tr>" );
            } 
	    out.println( "</table>" );
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
		<!-- <script type="text/javascript">
			/*
			read the col and row and add to table
			 */
			var show = function() {

				AlternativeServer.GetAlternativeValue(get);
			}
			var get = function(a) {
				var b = a;
				for (var i = 0; i < b.length; i++) {

					var tr = $('<tr>');
					$('#myTable tbody').append(tr);
					for (var j = 0; j < b[i].length; j++) {
						tr.append('<td>' + b[i][j] + '</td>');

						/*alert("j="+j+"b[i].length"+b[i].length);*/
					}
				}
			}
		</script> -->
	</div>
	<br>
	<table id="alternativetable" style="border: none;">
		<tbody>
			<tr>
				<td style="border: none; font-weight: bold;"><label>Add
						a New Alternative</label></td>
				<td style="border: none;"></td>
			</tr>
			<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
			<tr>
				<td style="border: none;"><label>Alternative Name</label></td>
				<td style="border: none;"><input class="form-control" type="text" id="AltNameTxt"
					name="AltName" value='' style="width: 250px;" /></td>
			</tr>
			<tr>
				<td style="border: none;"><label>Application Name</label></td>
				<td style="border: none;"><select class="form-control" id="appselect"
					style="width: 250px;">
						<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmt = conn.createStatement();
						    	ResultSet rs1;
					            rs1 = stmt.executeQuery("SELECT * FROM application" );
					            while ( rs1.next() ) {
					                String appname = rs1.getString("AppName");
					                out.write("<OPTION VALUE=\"" + appname  + "\">" + appname  + "</OPTION>\n");
					            }
							%>
						<!-- <script type="text/javascript">
							var arr = function(a) {
								var b = a;
								for (i = 0; i < b.length; i++) {
									var x = document.createElement("OPTION");
									var t = document.createTextNode(b[i][0]);
									//alert(b[i][0]);
									x.appendChild(t);
									document.getElementById("appselect")
											.appendChild(x);
								}
							}
							ApplicationServer.GetApplicationValue(arr);
						</script> -->
				</select></td>
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
								Statement stmt1 = conn.createStatement();
						    	ResultSet rs4;
					            rs4 = stmt1.executeQuery("SELECT * FROM decision" );
					            while ( rs4.next() ) {
					                String decname = rs4.getString("decisionName");
					                out.write("<OPTION VALUE=\"" + decname  + "\">" + decname  + "</OPTION>\n");
					            }
						    conn.close(); 
					%>
				<!-- 		<script type="text/javascript">
							var arr = function(a) {
								var b = a;
								for (i = 0; i < b.length; i++) {
									var x = document.createElement("OPTION");
									var t = document.createTextNode(b[i][0]);
									//alert(b[i][0]);
									x.appendChild(t);
									document.getElementById("Decselect")
											.appendChild(x);
								}
							}
							DecisionServer.GetDecisionValue(arr);
						</script> -->
				</select></td>
			</tr>
			<tr>
				<td style="border: none;"><label>Remark</label></td>
				<td style="border: none;"><textarea class="form-control" id="Remarktext" rows="4"
						cols="50" style="width: 250px; height: 150px;"> 
					</textarea></td>
			</tr>
			<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td style="border: none;"><input class="btn btn-info" value="Add New" type="button"
					onclick="addalternative();" /></td>
			</tr>
		</tbody>
	</table>
	<script type="text/javascript">
		var addalternative = function() {
			var arr = [];
			arr.push(document.getElementById('AltNameTxt').value);
			var ddl = document.getElementById('appselect');
			var val = ddl.options[ddl.selectedIndex].value;
			arr.push(val);
			var ddldec = document.getElementById('Decselect');
			var valdec = ddldec.options[ddldec.selectedIndex].value;
			arr.push(valdec);
			/* 	arr.push(document.getElementById('WeightNameTxt').value); */
			arr.push(document.getElementById('Remarktext').value);
			AlternativeServer.savealternative(arr, ar);
		}
		var ar = function() {
			alert("Success");
		}
	</script>
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