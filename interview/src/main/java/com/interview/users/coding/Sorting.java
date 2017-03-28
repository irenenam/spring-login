package com.interview.users.coding;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;

public class Sorting {

	public static void main(String[] args) {
		ArrayList arr = new ArrayList();
		
		/*
		ArrayList<String> listofcountries = new ArrayList<String>();
	    listofcountries.add("India");
	    listofcountries.add("US");
	    listofcountries.add("China");
	    listofcountries.add("Denmark");

	    System.out.println("Before Sorting:");
	    for(String counter: listofcountries){
	    	System.out.println(counter);
	    }

	    Collections.sort(listofcountries);

	    System.out.println("After Sorting:");
	    for(String counter: listofcountries){
	    	System.out.println(counter);
	    }
	    */
	    
	    HashSet<Integer> A = new HashSet<Integer>();
	    A.add(1);
	    A.add(2);
	    A.add(3);
	    
	    Iterator hi = (Iterator) A.iterator();
	    
	    while(hi.hasNext())
	    	System.out.println(hi.next());
	    
	    HashSet<Integer> B = new HashSet<Integer>();
	    B.add(4);
	    B.add(5);
	    B.add(6);
	    
	    HashSet<Integer> C = new HashSet<Integer>();
	    C.add(1);
	    C.add(2);
	    

	    System.out.println(A.containsAll(B));
	    System.out.println(A.containsAll(C));
	}

}
