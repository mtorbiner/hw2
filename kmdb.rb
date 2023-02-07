# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!



# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
# puts "there are #{Movie.all.count} companies"

warner = Studio.new
warner["name"] = "Warner Bros."
warner.save 
# puts "there are #{Studio.all.count} companies"

first = Movie.new
first["title"] = "Batman Begins"
first["year_released"] = 2005
first["rated"] = "PG-13"
warner = Studio.find_by({"name" => "Warner Bros."})
first["studio_id"] = warner["id"]
first.save  

second = Movie.new
second["title"] = "The Dark Knight"
second["year_released"] = 2008
second["rated"] = "PG-13"
warner = Studio.find_by({"name" => "Warner Bros."})
second["studio_id"] = warner["id"]
second.save

third = Movie.new
third["title"] = "The Dark Knight Rises"
third["year_released"] = 2012
third["rated"] = "PG-13"
warner = Studio.find_by({"name" => "Warner Bros."})
third["studio_id"] = warner["id"]
third.save
# puts "there are #{Movie.all.count} companies"
# try = Movie.find_by({"year_released" => 2012})
# puts try.inspect

christian = Actor.new
christian["name"] = "Christian Bale"
christian.save

michael = Actor.new
michael["name"] = "Michael Caine"
michael.save

liam = Actor.new
liam["name"] = "Liam Neeson"
liam.save

katie = Actor.new
katie["name"] = "Katie Holmes"
katie.save

gary = Actor.new
gary["name"] = "Gary Oldman"
gary.save

heath = Actor.new
heath["name"] = "Heath Ledger"
heath.save

aaron = Actor.new
aaron["name"] = "Aaron Eckhart"
aaron.save

maggie = Actor.new
maggie["name"] = "Maggie Gyllenhaal"
maggie.save

tom = Actor.new
tom["name"] = "Tom Hardy"
tom.save

joseph = Actor.new
joseph["name"] = "Joseph Gordon-Levitt"
joseph.save

anne = Actor.new
anne["name"] = "Anne Hathaway"
anne.save
# try = Actor.all.count
# puts try 

bruce = Role.new
bruce["character_name"] = "Bruce Wayne"
movie_first = Movie.find_by({"title" => "Batman Begins"})
bruce["movie_id"] = movie_first["id"]
bruce["actor_id"] = christian["id"]
bruce.save

bruce = Role.new
bruce["character_name"] = "Bruce Wayne"
movie_second = Movie.find_by({"title" => "The Dark Knight"})
bruce["movie_id"] = movie_second["id"]
bruce["actor_id"] = christian["id"]
bruce.save

bruce = Role.new
bruce["character_name"] = "Bruce Wayne"
movie_third = Movie.find_by({"title" => "The Dark Knight Rises"})
bruce["movie_id"] = movie_third["id"]
bruce["actor_id"] = christian["id"]
bruce.save

alfred = Role.new
alfred["character_name"] = "Alfred"
alfred["movie_id"] = movie_first["id"]
alfred["actor_id"] = michael["id"]
alfred.save

alfred = Role.new
alfred["character_name"] = "Alfred"
alfred["movie_id"] = movie_second["id"]
alfred["actor_id"] = michael["id"]
alfred.save

ra = Role.new
ra["character_name"] = "Ra's Al Ghul"
ra["movie_id"] = movie_first["id"]
ra["actor_id"] = liam["id"]
ra.save

rachel = Role.new
rachel["character_name"] = "Rachel Dawes"
rachel["movie_id"] = movie_first["id"]
rachel["actor_id"] = katie["id"]
rachel.save

rachel = Role.new
rachel["character_name"] = "Rachel Dawes"
rachel ["movie_id"] = movie_second["id"]
rachel["actor_id"] = maggie["id"]
rachel.save

commissioner = Role.new
commissioner["character_name"] = "Commissioner Gordon"
commissioner["movie_id"] = movie_first["id"]
commissioner["actor_id"] = gary["id"]
commissioner.save

commissioner = Role.new
commissioner["character_name"] = "Commissioner Gordon"
commissioner["movie_id"] = movie_third["id"]
commissioner["actor_id"] = gary["id"]
commissioner.save

joker = Role.new
joker["character_name"] = "Joker"
joker["movie_id"] = movie_second["id"]
joker["actor_id"] = heath["id"]
joker.save

harvey = Role.new
harvey["character_name"] = "Harvey Dent"
harvey["movie_id"] = movie_second["id"]
harvey["actor_id"] = aaron["id"]
harvey.save

bane = Role.new
bane["character_name"] = "Bane"
bane["movie_id"] = movie_third["id"]
bane["actor_id"] = tom["id"]
bane.save

john = Role.new
john["character_name"] = "John Blake"
john["movie_id"] = movie_third["id"]
john["actor_id"] = joseph["id"]
john.save

selina = Role.new
selina["character_name"] = "Selina Kyle"
selina["movie_id"] = movie_third["id"]
selina["actor_id"] = anne["id"]
selina.save

try = Role.all.count
puts try

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
