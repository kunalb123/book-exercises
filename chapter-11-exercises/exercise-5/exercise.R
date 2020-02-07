# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

flights_df <- na.omit(nycflights13::flights)
View(flights_df)
# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- flights_df %>%
  group_by(month) %>%
  summarize(
    avg_departure_delay = mean(dep_delay)
  ) %>%
  select(month, avg_departure_delay)

# Which month had the greatest average departure delay?
max_delay_month <- dep_delay_by_month %>%
  filter(avg_departure_delay == max(avg_departure_delay)) %>%
  pull(month)
print(max_delay_month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
dest_highest_arrival_delay <- flights_df %>%
  group_by(dest) %>%
  summarize(
    avg_arrival_delay = mean(arr_delay)
  ) %>%
  arrange(-avg_arrival_delay) %>%
  select(dest, avg_arrival_delay)
print(head(dest_highest_arrival_delay))

# You can look up these airports in the `airports` data frame!
airports_df <- na.omit(nycflights13::airports)
View(airports_df)

# Which city was flown to with the highest average speed? -> distance / time
highest_avg_speed_city <- flights_df %>%
  mutate(speed = distance / air_time) %>%
  group_by(dest) %>%
  summarize(avg_speed = mean(speed)) %>%
  filter(avg_speed == max(avg_speed)) %>%
  pull(dest)
print(highest_avg_speed_city)
