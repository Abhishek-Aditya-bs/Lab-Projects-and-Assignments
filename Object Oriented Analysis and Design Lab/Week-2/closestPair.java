// Find the closest pair from the two sorted arrays 
// for the given number x

import java.util.*;
public class closestPair
{
    public static void main(String[] args)
    {
        // Input a sorted array elements from the user
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of elements in the first array: ");
        int n1 = sc.nextInt();
        int[] arr1 = new int[n1];
        System.out.println("Enter the elements of the first array: ");
        for(int i = 0; i < n1; i++)
            arr1[i] = sc.nextInt();

        System.out.println("Enter the number of elements in the second array: ");
        int n2 = sc.nextInt();
        int[] arr2 = new int[n2];
        System.out.println("Enter the elements of the second array: ");
        for(int i = 0; i < n2; i++)
            arr2[i] = sc.nextInt();

        System.out.println("Enter the number to find the closest pair: ");
        int x = sc.nextInt();

        // Find the closest pair to x
        int diff = Integer.MAX_VALUE;
        int first_arr_i = 0; int second_arr_i = n2 - 1;
        int f_i = 0, s_i = 0;
        while(first_arr_i<n1 && second_arr_i>=0){
            if(Math.abs(arr1[first_arr_i]+arr2[second_arr_i] - x) < diff){
                diff = Math.abs(arr1[first_arr_i]+arr2[second_arr_i] - x);
                f_i = first_arr_i;
                s_i = second_arr_i;
            }
            if(arr1[first_arr_i] + arr2[second_arr_i] > x)
                second_arr_i--;
            else
                first_arr_i++;
        }

        System.out.println(x + " is closest to (" + arr1[f_i] + "," + arr2[s_i] + ")");
    }
}