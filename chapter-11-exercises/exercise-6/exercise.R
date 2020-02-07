# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

flights_df <- na.omit(nycflights13::flights)
# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
avg_arrival_delay_dest <- flights_df %>%
  group_by(dest) %>%
  summarize(avg_arr_delay = mean(arr_delay)) %>%
  select(dest, avg_arr_delay)

combined_df <- left_join(na.omit(nycflights13::airports), avg_arrival_delay_dest, by = c('faa', 'dest'))
                         
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
avg_arrival_delay_airline <- flights_df %>%
  group_by(carrier) %>%
  summarize(avg_arr_delay = mean(arr_delay)) %>%
  select(carrier, avg_arr_delay)

combined_df_aa <- left_join(na.omit(nycflights13::airlines), avg_arrival_delay_airline, by = 'carrier')

# min arrival delay
min_delay_airline <- combined_df_aa %>%
  filter(arr_delay == max(arr_delay)) %>%
  pull(name)
print(min_delay_airline)

