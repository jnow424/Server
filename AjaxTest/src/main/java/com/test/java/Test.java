package com.test.java;

import java.util.Arrays;
import java.util.Iterator;

public class Test {
	public static void main(String[] args) {
		
		int[] list = { 100, 200, 300 };
		
		for (int n : list) { //강사님은 이걸 이터레이터라고 부릉부릉
			System.out.println(n);
		}
		
		
		Iterator<Integer> iter = Arrays.stream(list).iterator();
		
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
		
	}
}
