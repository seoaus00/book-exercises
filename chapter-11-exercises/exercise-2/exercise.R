##################
### Chapter 11 ###
##################

# Exercise 2: working with `dplyr`
# Note that this exercise repeats the analysis from Exercise 1, but should be 
# performed using `dplyr` (do not directly access or manipulate the data frames)

# Install and load the "fueleconomy" package
#install.packages("devtools")
#devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Install and load the "dplyr" library
library("dplyr")

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
makes <- select(vehicles, make)
print(makes)
# Use the `distinct()` function to determine how many different car manufacturers
# are represented by the data set
distinct(makes)

# Filter the data set for vehicles manufactured in 1997
made_1997 <- filter(vehicles, year == 1997)

# Arrange the 1997 cars by highway (`hwy`) gas milage
hwy_1997 <- arrange(made_1997, hwy)
print(hwy_1997)
# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
mutate(
  hwy_1997,
  average = (hwy + cty) / 2
)

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
vehicles_2wd <- filter(vehicles, drive = "2_Wheel Drive")
print(vehicles_2wd)
efficient_2wd <- filter(vehicles_2wd, hwy > 20)
print(efficient_2wd)
# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
worst_vehicle_id <- select( # 2. select vehicle id
  filter(                   # 1. filter for worst hwy mpg
    vehicles_2wd,           # arguments for step 1 filter
    hwy == min(hwy)
  ),
  id                        # second argument for step 2 select
)
print(worst_vehicle_id)
# Write a function that takes a `year_choice` and a `make_choice` as parameters,
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!


# What was the most efficient Honda model of 1995?

