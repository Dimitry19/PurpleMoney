package cam.common.array;

import org.jetbrains.annotations.Contract;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;

public class ArrayUtils {

	public static int[] insertX(int n, int arr[],
	                            int x, int pos)
	{
		int i;

		// create a new array of size n+1
		int newarr[] = new int[n + 1];

		// insert the elements from
		// the old array into the new array
		// insert all elements till pos
		// then insert x at pos
		// then insert rest of the elements
		for (i = 0; i < n + 1; i++) {
			if (i < pos - 1)
				newarr[i] = arr[i];
			else if (i == pos - 1)
				newarr[i] = x;
			else
				newarr[i] = arr[i - 1];
		}
		return newarr;
	}

	@Contract(pure = true)
	public static BigDecimal[] buildChartArray(int n, BigDecimal arr[], BigDecimal x, int pos){


		// create a new array of size n+1
		BigDecimal tmparray[] = arr;

		 tmparray[pos-1] = x;
		/*for (int i = 0; i < n; i++) {
			if (i < pos - 1)
				tmparray[i] = arr[i];
			else if (i == pos - 1)
				tmparray[i] = x;
			else
				tmparray[i] = arr[i - 1];
		}*/
		return tmparray;
	}
	public static ArrayList<Integer> build(int pos, Integer value,ArrayList<Integer> arr){
		ArrayList<Integer> namesList = arr;

		namesList.set(pos-1, value);

		return namesList;
	}
	// Driver code
	public static void main(String[] args)
	{

		int n = 10;
		int i;

		// initial array of size 10
		int arr[]= { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

		// print the original array
		System.out.println("Initial Array:\n"
				+ Arrays.toString(arr));

		// element to be inserted
		int x = 50;

		// position at which element
		// is to be inserted
		int pos = 5;

		// call the method to insert x
		// in arr at position pos
		arr = insertX(n, arr, x, pos);

		// print the updated array
		System.out.println("\nArray with " + x
				+ " inserted at position "
				+ pos + ":\n"
				+ Arrays.toString(arr));
	}
}
