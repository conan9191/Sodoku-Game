package util;

import java.util.Comparator;

import Entity.rank;

public class MyComparator implements Comparator<rank>{  
	public int compare(rank r1,rank r2) {  
   
	       if(r1.getSecond()<r2.getSecond())  
	        return 1;  
	       else  
	        return 0;  
	       }  
}
