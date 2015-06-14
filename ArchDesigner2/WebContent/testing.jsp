<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title> Films Example: JSP, Postgres version</title>
</head>
<body bgcolor="white">
<%
        try {
 	    Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
        }
	try {
	    Connection conn = DriverManager.getConnection (
	    	"jdbc:postgresql://localhost/ArchDB",
		"user", "password" );

            Statement stmt = conn.createStatement();
            ResultSet rs;
          /*   PreparedStatement pst = conn.prepareStatement("INSERT into films VALUES(?,?)");
     
            
            pst.setString(1,"rwwws");
            pst.setString(2,"q");
            pst.execute();
            pst.close(); */
           /*  oStmt.execute();
            oStmt.close();
            oConn.commit(); */
    
            ResultSet rs1;
            rs1 = stmt.executeQuery("SELECT * FROM application" );
	    		out.println( "<table border=1>" );
	    
	    	    
            while ( rs1.next() ) {
                String director = rs1.getString("AppName");
               /*  String origin = rs.getString("origin");
                String made = rs.getString("made");
                String length = rs.getString("length"); */
                out.println("<tr><td>"+"</td><td>"+director+"</td><td>"+"</td><td>"+"</td><td>"+"</td></tr>" );
            }
	    out.println( "</table>" );

            conn.close();
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
</body>
</html>