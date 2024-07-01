public with sharing class Calculator {
    // Challenge I
    public Integer add(Integer a, Integer b) {
        return a + b;
    }
    
    // Challenge II
    public Integer multiply(Integer a, Integer b) {
        // not allowed to use the * operator. Solution: use a for loop
        
        if (a == 0 || b == 0) {return 0;}
        
        Integer sum = a;
        for (Integer i = 1; i < b; i++) {
            sum = this.add(sum, a);
        }
        
        return sum;
    }
    
    // Challenge III
    public Integer divide(Integer a, Integer b) {
        // not allowed to use the / operator. 
        // how many times can we subtract before we get to 0
        // 
        // divide 17 / 3
        
        //17 - 0		17
        //17 - 3		14
        //14 - 3 		11
        //11 - 3		8
        //8 - 3			5
        //5 - 3			2
        //2 - 3			-1 STOP LOOP 17 / 3 = 5
        
        if (a == 0) {return 0;}
        
        Integer difference = a;
        Integer times = 0;
		
        do {
            difference = add (a, -b);
            times = add(times, 1);
        } while (difference > 0);

        return 0;
    }
    
}