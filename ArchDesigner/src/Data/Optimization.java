package Data;

import java.util.ArrayList;
import java.util.Random;

public class Optimization
{
	public ArrayList NaVList = new ArrayList(); 
	ComputeValueScores valuescore = new ComputeValueScores();
	public static void main(String[] args)
	{
		Optimization a = new Optimization();
		a.optimization();
	}
	public void optimization()
	{
		
		NaVList = valuescore.QualityWightValueScore("Application1");
		ArrayList<ArrayList> allalternative = new ArrayList<ArrayList>();
		ArrayList<ArrayList> finalweight = new ArrayList<ArrayList>();
		allalternative = valuescore.allalternativeid;
		finalweight = valuescore.finaldecisionweight;
		System.out.println("The list is "+finalweight);
	/*	double[][][] eachcombination = new double[][][];*/
	
		ArrayList<Double> sumvaluelist = new ArrayList<Double>();
		ArrayList<ArrayList> combinationlist = new ArrayList<ArrayList>();
		
		double sumvalue =0;
		int j=0;
		double sum=0;
	/*	finalweight.size()*100*/
		ArrayList<Double> sumlists = new ArrayList<Double>();
		while(j<100000)
		{
			sumvalue =0;
			sumvaluelist = new ArrayList<Double>();
			double temp =0;
			for(int i=0;i<finalweight.size();i++)
			{	
				Random randomGenerator = new Random();
				int numberofalternative = randomGenerator.nextInt(allalternative.get(i).size());
			/*e);
				System.out.println("value is "+finalweight.get(i).get(numberofalternative));*/
				sumvalue = sumvalue + (double)finalweight.get(i).get(numberofalternative);
				sumvaluelist.add((double)i);
				sumvaluelist.add((double)numberofalternative);
				sumvaluelist.add(sumvalue);
			}
			j++;
			sum = sumvalue;
			System.out.println(sum);
			sumlists.add(sum);
			combinationlist.add(sumvaluelist);
		}
		int tempindex =0;
		double tempvalue =0;
		
		for(int i=0;i<sumlists.size();i++)
		{
			if(sumlists.get(i)>tempvalue)
			{
				tempvalue=sumlists.get(i);
				tempindex =i;
			}
		}
		System.out.println(sumlists);
		System.out.println(combinationlist.get(tempindex));
		System.out.println(tempindex+"|"+tempvalue);
	}
}
