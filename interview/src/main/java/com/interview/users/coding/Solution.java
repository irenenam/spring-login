package com.interview.users.coding;

public class Solution {
    public int[] twoSum(int[] nums, int target) {
    	nums = new int [4];
    	nums[0] = 2;
    	nums[1] = 7;
    	nums[2] = 11;
    	nums[3] = 18;
    	
        target = 9;
        
        int[] returnNum = new int [2]; 
        
        for (int i=0; i < nums.length; i++ ) {
            for ( int j = 0; j < nums.length; j++ ) {
                if ( nums[i] + nums[j] == target ) {
                	System.out.println( nums[i]  + nums[j]);
                }
            }
        }
        
        return returnNum; 
    }
}