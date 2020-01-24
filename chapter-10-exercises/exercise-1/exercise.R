# CH 10 Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)
seahawks_points <- c(21, 28, 27, 27)

# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season
seahawks_points_against <- c(20, 26, 33, 10)

# Combine your two vectors into a dataframe called `games`
games <- data.frame(seahawks_points, seahawks_points_against)
print(games)
# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!
games$diff <- c(seahawks_points - seahawks_points_against)
diff <- games$diff
print(diff)
# Create a new column "won" which is TRUE if the Seahawks won the game
games$won<- (diff > 0)
print(games)
# Create a vector of the opponent names corresponding to the games played
opponent <- c("Bengals", "Steelers", "Saints", "Cardinals")

# Assign your dataframe rownames of their opponents


# View your data frame to see how it has changed!

