# Exercise 1: reading and querying a web API

# Load the httr and jsonlite libraries for accessing data
# You can also load `dplyr` if you wish to use it

#install.packages("jsonlite")
#install.packages("httr")
library("jsonlite")
library("httr")
library("dplyr")

# Create a variable base_uri that stores the base URI (as a string) for the 
# Github API (https://api.github.com)
base_uri <- "https://api.github.com"

# Under the "Repositories" category of the API documentation, find the endpoint 
# that will list _repos in an organization_. Then create a variable named
# `org_resource` that stores the endpoint for the `programming-for-data-science`
# organization repos (this is the _path_ to the resource of interest).

org_resource <- paste0("/orgs/", "programming-for-data-science", "/repos")

# Send a GET request to this endpoint (the `base_uri` followed by the 
# `org_resource` path). Print the response to show that your request worked. 
# (The listed URI will also allow you to inspect the JSON in the browser easily).
print(GET(paste0(base_uri, org_resource)))

# Extract the content of the response using the `content()` function, saving it
# in a variable.
org_content <- content(GET(paste0(base_uri, org_resource)), "text")
print(org_content)

# Convert the content variable from a JSON string into a data frame.
org_repos <- fromJSON(org_content)
View(org_repos)

# How many (public) repositories does the organization have?
num_public_repos <- org_repos %>% 
  filter(private == "FALSE") %>% 
  summarize(public_count = n()) %>% 
  select(public_count)
print(num_public_repos)

# Now a second query:
# Create a variable `search_endpoint` that stores the endpoint used to search 
# for repositories. (Hint: look for a "Search" endpoint in the documentation).
search_endpoint <- "/search/repositories"


# Search queries require a query parameter (for what to search for). Create a 
# `query_params` list variable that specifies an appropriate key and value for 
# the search term (you can search for anything you want!)
query_params <- list(
  term = "restaurant",
  categories = "cuban",
  location = "Seattle, WA",
  sort_by = "rating",
  radius = 8000
)

# Send a GET request to the `search_endpoint`--including your params list as the
# `query`. Print the response to show that your request worked.
search_response <- GET(
  paste0(base_uri, search_endpoint), 
  query = query_params
)
print(search_response)

# Extract the content of the response and convert it from a JSON string into a
# data frame. 
search_response_df <- fromJSON(
  content(
    search_response, "text"
  )
)
View(search_response_df)

# How many search repos did your search find? (Hint: check the list names to 
# find an appropriate value).


# What are the full names of the top 5 repos in the search results?

