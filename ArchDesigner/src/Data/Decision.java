package Data;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;


public class Decision
{
	public ArrayList<String[]> getDecision() throws IOException
	{
	// cant read the path  null pointer exception
		
//		FileReader fr =new FileReader(Decision.class.getResource("Decision.txt").getPath());
//		System.out.println(Decision.class.getResource("Decision.txt").getPath());
//		BufferedReader br = new BufferedReader(fr);
//		String temp = br.readLine();
//		String[] a = temp.split(" ");
		ArrayList<String[]> b = new ArrayList<String[]>();
//		while(temp!=null)
//		{
//			if(temp!=null)
//			{
//				a = temp.split(" ");
//			}
//			b.add(a);
//			temp = br.readLine();
//		}
		String[] a ={"qqq","www","5","eee"};
		b.add(a);
		return b;
	}
}