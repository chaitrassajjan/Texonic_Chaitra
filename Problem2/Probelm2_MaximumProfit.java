// Java program for achieving the Maximum Profit
// This program is written by CHAITRA

public class MaximumProfit
{
// Function to return the maximum profit
// that can be made after buying and
// selling the given stocks
static int maxProfit(int price[], int start, int end)
{
        // If the stocks can't be bought
	if (end <= start)
		return 0;
	// Initialise the profit
	int profit = 0;
	// The day at which the stock
	// must be bought
	for (int i = start; i < end; i++)
	{
		// The day at which the
		// stock must be sold
		for (int j = i + 1; j <= end; j++)
		{
			// If buying the stock at ith day and
			// selling it at jth day is profitable
			if (price[j] > price[i])
			{
				// Update the current profit
				int curr_profit = price[j] - price[i]
								+ maxProfit(price, start, i - 1)
								+ maxProfit(price, j + 1, end);

				// Update the maximum profit so far
				profit = Math.max(profit, curr_profit);
			}
		}
	}
	return profit;
}
// Driver code
public static void main(String[] args)
{
	int price[] = {7,6,4,3,1};
	int n = price.length;
        System.out.println("Prices = {7,6,4,3,1}");
	System.out.print("Maximum profit = " + maxProfit(price, 0, n - 1)+"\n");
}
}
