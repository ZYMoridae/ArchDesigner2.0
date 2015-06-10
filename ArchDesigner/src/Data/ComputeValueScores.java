package Data;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ComputeValueScores
{
	private static String url = "jdbc:postgresql://localhost/ArchDB";
	private static String user = "user";
	private static String password = "password";
	public static ArrayList<ArrayList> Presentweightqualitylist = new ArrayList<ArrayList>();
	public static ArrayList<ArrayList> PresentTXA = new ArrayList<ArrayList>();
	public static ArrayList<ArrayList> AlldecisionPairwiseAlternative = new ArrayList<ArrayList>();
	
	
	ArrayList<Integer> decisionid = new ArrayList<Integer>();
	ArrayList<Integer> alternativeid = new ArrayList<Integer>();
	ArrayList<ArrayList> allalternativeid = new ArrayList<ArrayList>();
	ArrayList<Integer> decisionweight = new ArrayList<Integer>();
	ArrayList<ArrayList> finaldecisionweight = new ArrayList<ArrayList>();
	public static void main(String args[])
	{
		ComputeValueScores a = new ComputeValueScores();
		System.out.println("final output is "+a.QualityWightValueScore("Application1"));
/*		System.out.println("final output asdais "+a.Presentweightqualitylist);*/
	}
	public ArrayList QualityWightValueScore(String Applicationname)
	{
		try {
		    Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		Connection con = null;
		int applicationid = 0;
	
		 try {
	        	con = DriverManager.getConnection(url, user, password);
	        	PreparedStatement pstmtapp = con.prepareStatement("SELECT * FROM application WHERE appname =?");
	        	pstmtapp.setString(1, Applicationname);
	        	ResultSet appidrs;
	        	appidrs =pstmtapp.executeQuery();
	            while (appidrs.next() ) {
	                applicationid = appidrs.getInt("appid");
	            }
				// get the input of selecting application
				
	        	PreparedStatement pstmtdecision = con.prepareStatement("SELECT * FROM decision WHERE applicationid =?");
	        	pstmtdecision.setInt(1, applicationid);
	        	ResultSet resultofdecision;
	        	resultofdecision = pstmtdecision.executeQuery();
	        	while(resultofdecision.next())
	        	{
	        		decisionid.add(resultofdecision.getInt("decisionid"));
	        		decisionweight.add(resultofdecision.getInt("Weight"));
	        	}
	        	System.out.println("the decision weight is"+decisionweight);
	        /*	System.out.println("application name is "+applicationid);*/
		
       
        /*	System.out.println("decision id list "+decisionid);*/
        	
        	
        	
        	// compute from here, select from the first decision to last decision
        	
        	for(int decisionindex =0;decisionindex<decisionid.size();decisionindex++)
        	{
        		ArrayList<Integer> qualityid = new ArrayList<Integer>();
        		ArrayList<Integer> stakeholderid = new ArrayList<Integer>();
        		alternativeid = new ArrayList<Integer>();
        		PreparedStatement pstmtquality = con.prepareStatement("SELECT * FROM quality WHERE applicationid =?");
            	pstmtquality.setInt(1, applicationid);
            	ResultSet resultofquality;
            	resultofquality = pstmtquality.executeQuery();
            	while(resultofquality.next())
            	{
            		qualityid.add(resultofquality.getInt("qualityid"));
            	}
            	System.out.println("quality id list "+qualityid);
            	
            	PreparedStatement pstmtstakeholder = con.prepareStatement("SELECT * FROM stakeholder WHERE applicationid =?");
            	pstmtstakeholder.setInt(1, applicationid);
            	ResultSet stakeholderresult;
            	stakeholderresult =pstmtstakeholder.executeQuery();
            	while(stakeholderresult.next())
            	{
            		stakeholderid.add(stakeholderresult.getInt("stakeholderid"));
            	}
            	System.out.println("stakeholder id list "+stakeholderid);
            	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM pairwisequality WHERE applicationid =? AND stakeholderid =? AND firstqualityid =? AND decisionid =?");
            	ArrayList<ArrayList> stakeholderpairwisequalityweightlist = new ArrayList<ArrayList>();
            	
            	
            	
            	for(int i =0;i<stakeholderid.size();i++)  // stakeholder
            	{
            		ArrayList<ArrayList> pairwisequalityweightlist = new ArrayList<ArrayList>();
            		for(int j =0;j<qualityid.size();j++) // quality
            		{
            			pstmt.setInt(1, applicationid);
                    	pstmt.setInt(2, stakeholderid.get(i));
                    	pstmt.setInt(3, qualityid.get(j));
                    	pstmt.setInt(4, decisionid.get(decisionindex));
                    	ResultSet resultofpairwise;
                    	resultofpairwise = pstmt.executeQuery();
                    	ArrayList<Integer> pairwisequalityweight = new ArrayList<Integer>();
                    	while(resultofpairwise.next()) // pairwise quality weight
                    	{
                    		pairwisequalityweight.add(resultofpairwise.getInt("weight"));  
                    	}
                    	pairwisequalityweightlist.add(pairwisequalityweight);
            		}
            		stakeholderpairwisequalityweightlist.add(pairwisequalityweightlist);
            	}
            	System.out.println("The stakeholder pairwise list is "+stakeholderpairwisequalityweightlist);
            	/*System.out.println("The length is "+stakeholderpairwisequalityweightlist.size());*/
            	
            	// compute Pab
            	Integer numofstakeholder =null;
            	Integer numofquality =null;
            	numofstakeholder =stakeholderid.size();
            	numofquality =	qualityid.size();
            	/*System.out.println("asda"+((ArrayList<Integer>) stakeholderpairwisequalityweightlist.get(0).get(0)).size());*/
            	Integer sum =0;
            	ArrayList<Double> sumlist = null;
            	ArrayList<Integer> templist=null;
            	ArrayList<ArrayList> Pablist = new ArrayList<ArrayList>();
            	for(int i =0;i<numofquality;i++)
            	{
            		int index =0;
            		sumlist= new ArrayList<Double>();
            		for(int j =0;j<numofstakeholder;j++)
                	{
            			int temp =0;
            			templist = new ArrayList<Integer>();
            			// get the templist of each pairwise 
            			for(int m =0;m<((ArrayList<Integer>) stakeholderpairwisequalityweightlist.get(j).get(i)).size();m++)
            			{
            				temp =((ArrayList<Integer>) stakeholderpairwisequalityweightlist.get(j).get(i)).get(m);
            				templist.add(temp);
            			}
            			// init value
            			if(index ==0)
            			{
            				for(int n=0;n<templist.size();n++)
                			{
            					if(templist.get(n)<0)
            					{
            						double nat = 1.0/Math.abs(templist.get(n));
            						sumlist.add(nat);
            					}
            					else
            					{
            						sumlist.add((double)templist.get(n));
            					}
                					
                			}
            			}
            			// compute the sum of value
            			else
            			{
            				for(int n=0;n<templist.size();n++)
                			{
            					double tempvalue = 0;
            					if(templist.get(n)<0)
            					{
            						tempvalue =1.0/Math.abs(templist.get(n));
            					}
            					else
            					{
            						tempvalue =(double)templist.get(n);
            					}
            					double sumvalue = tempvalue*sumlist.get(n);
                				sumlist.set(n, sumvalue);
                			}
            			}
            			index++;
                	}
            		// get the sum pab list
            		Pablist.add(sumlist);
            	}
            	System.out.println("Pab list is "+ Pablist);
            	
            	ArrayList<Double> Pabqualitylist = new ArrayList<Double>();
            	ArrayList<ArrayList> finalpablist = new ArrayList<ArrayList>();
            	for(int i=0;i<Pablist.size();i++)
            	{
            		Pabqualitylist = new ArrayList<Double>();
            		for(int j =0;j<Pablist.get(i).size();j++)
            		{
            			double z = Math.pow((double) Pablist.get(i).get(j),1.0/stakeholderid.size());
            			Pabqualitylist.add(z);
            		/*	Pablist.get(i).get(j)*/
            		}
            		finalpablist.add(Pabqualitylist);
            	}
            	System.out.println("Final Pab list is "+ finalpablist);
            	
            	ArrayList<Double> Gmeanqualitylist = new ArrayList<Double>();
            	double sumofGmean =0;
            	for(int i=0;i<finalpablist.size();i++)
            	{
            		double sumGmean =1;
            		for(int j =0;j<finalpablist.get(i).size();j++)
            		{
            			
            			sumGmean =sumGmean*(double) finalpablist.get(i).get(j);
            			
            		}
            		sumofGmean = sumofGmean+sumGmean;
            		Gmeanqualitylist.add(sumGmean);
            	}
            	System.out.println("Gmeanqualitylist is "+Gmeanqualitylist);
            	ArrayList<Double> Weightqualitylist = new ArrayList<Double>();
            	
            	for(int i=0;i<Gmeanqualitylist.size();i++)
            	{
            		Weightqualitylist.add(Gmeanqualitylist.get(i)/sumofGmean);
            	}
            	Presentweightqualitylist.add(Weightqualitylist);
            	System.out.println("Weightqualitylist is "+Weightqualitylist);      	
            	
            	// compute alternative ---------------------------------------------------------------
            	
            	PreparedStatement pstmtalternative = con.prepareStatement("SELECT * FROM alternative WHERE applicationid =? AND decisionid =?");
            	pstmtalternative.setInt(1, applicationid);
            	pstmtalternative.setInt(2, decisionid.get(decisionindex));
            	ResultSet resultofalternative;
            	resultofalternative = pstmtalternative.executeQuery();
            	while(resultofalternative.next())
            	{
            		alternativeid.add(resultofalternative.getInt("alternativeid"));
            	}
            	System.out.println("alternative list is "+alternativeid);
            	
            	// -- obtain the alternative pairwise list from database
            	ArrayList<ArrayList> stakepairwisealternativeweightlist = new ArrayList<ArrayList>();
            	PreparedStatement Pstalternative = con.prepareStatement("SELECT * FROM pairwisealternative WHERE applicationid =? AND qualityid =? AND firstalternativeid =? AND decisionid =?");
            	
            	for(int i =0;i<qualityid.size();i++)
            	{
            		ArrayList<ArrayList> pairwisealternativeweightlist = new ArrayList<ArrayList>();
            		for(int j =0;j<alternativeid.size();j++) // quality
            		{
            			Pstalternative.setInt(1, applicationid);
            			Pstalternative.setInt(2, qualityid.get(i));
            			Pstalternative.setInt(3, alternativeid.get(j));
            			Pstalternative.setInt(4, decisionid.get(decisionindex));
                    	ResultSet resultofpairwisealternative;
                    	resultofpairwisealternative = Pstalternative.executeQuery();
                    	ArrayList<Integer> pairwisealternativeweight = new ArrayList<Integer>();
                    	while(resultofpairwisealternative.next()) // pairwise quality weight
                    	{
                    		pairwisealternativeweight.add(resultofpairwisealternative.getInt("weight"));  
                    	}
                    	pairwisealternativeweightlist.add(pairwisealternativeweight);
            		}
            		stakepairwisealternativeweightlist.add(pairwisealternativeweightlist);
            	}
            	System.out.println("alternative pairwise list is "+stakepairwisealternativeweightlist);;
            	// compute Gxa
            	
            	ArrayList<ArrayList> GAalternativelistForEachquality = new ArrayList<ArrayList>();
            	ArrayList<Double> GAalternativelist= new ArrayList<Double>();
            	for(int i =0;i<stakepairwisealternativeweightlist.size();i++)
            	{
            		GAalternativelist= new ArrayList<Double>();
            		for(int j =0;j<stakepairwisealternativeweightlist.get(i).size();j++)
            		{
            			double sumalternative =1;
            			double z =0;
            			for(int m=0;m<((ArrayList<Integer>) stakepairwisealternativeweightlist.get(i).get(j)).size();m++)
            			{
            				if(((ArrayList<Integer>) stakepairwisealternativeweightlist.get(i).get(j)).get(m)!=null)
            				{
            					double tempaltervalue =((ArrayList<Integer>) stakepairwisealternativeweightlist.get(i).get(j)).get(m);
            					if(tempaltervalue<0)
            					{
            						tempaltervalue = 1.0/Math.abs(tempaltervalue);
            					}
            					sumalternative = sumalternative*tempaltervalue;
            					z = Math.pow(sumalternative,1.0/alternativeid.size());
            				}	
            			}
            			GAalternativelist.add(z);
            		}
            		GAalternativelistForEachquality.add(GAalternativelist);
            	}
            	System.out.println("Gxa is "+GAalternativelistForEachquality);
            	// compute TXA
            	ArrayList<ArrayList> TXallA = new ArrayList<ArrayList>();
            	ArrayList<Double> TXA = new ArrayList<Double>();
            	for(int i=0;i<GAalternativelistForEachquality.size();i++)
            	{
            		TXA = new ArrayList<Double>();
            		double sumTXA =0;
            		for(int j=0;j<GAalternativelistForEachquality.get(i).size();j++)
            		{
            			sumTXA = sumTXA+ (Double)GAalternativelistForEachquality.get(i).get(j);
            		}
            		for(int j=0;j<GAalternativelistForEachquality.get(i).size();j++)
            		{
            			TXA.add((Double) GAalternativelistForEachquality.get(i).get(j)/sumTXA);
            		}
            		TXallA.add(TXA);
            	}
            	System.out.println("TXA is "+TXallA);
            	PresentTXA.add(TXallA);
            	
            	
            	// compute the value score
            	ArrayList<Double> ValueAlternativeScore = new ArrayList<Double>();
            	ArrayList<Double> ValueAlternativeScore1 = new ArrayList<Double>();
            	/*for(int i=0;i<Weightqualitylist.size();i++)
            	{
            		
            	}*/
            	
            	for(int i=0;i<alternativeid.size();i++)
            	{
            		double sumV =0;
            		for(int j =0;j<Weightqualitylist.size();j++)
            		{
            				sumV = sumV +(Weightqualitylist.get(j)*(Double)TXallA.get(j).get(i));
            		}
            		ValueAlternativeScore1.add(sumV*(decisionweight.get(decisionindex)));
            		ValueAlternativeScore.add(sumV);
            	}
    /*        	System.out.println(ValueAlternativeScore);*/
            	AlldecisionPairwiseAlternative.add(ValueAlternativeScore);
            	finaldecisionweight.add(ValueAlternativeScore1);
            	allalternativeid.add(alternativeid);
            	System.out.println("Alternative to decisions is "+AlldecisionPairwiseAlternative);
            	System.out.println("final value is "+finaldecisionweight);
        	}	
        }catch(SQLException ex){
        	ex.printStackTrace();
        }
		return AlldecisionPairwiseAlternative;
		
	}
}
