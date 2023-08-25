# Example dataset
lowest_monthly_earnings <- c(0, 0, 130000, 140000, 150000)

# Calculate median without zeros
non_zero_values <- lowest_monthly_earnings[lowest_monthly_earnings > 0]
median_non_zeros <- median(non_zero_values)

# Identify and replace outliers
outliers <- lowest_monthly_earnings[lowest_monthly_earnings <= 0]
lowest_monthly_earnings[outliers] <- median_non_zeros

# Print the updated vector
print("Updated lowest_monthly_earnings:")
print(lowest_monthly_earnings)
summary(lowest_monthly_earnings)


stat <- boxplot.stats(lowest_monthly_earnings)
min(stat$out)




