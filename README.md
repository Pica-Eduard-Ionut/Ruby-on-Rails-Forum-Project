Forum App

Description

A simple Reddit-like forum built with Ruby on Rails, where users can create categories, make posts, comment, and upvote/downvote posts. Users can also delete or modify only their own posts.

Features

User authentication (Login, Registration, Logout)

Categories for organizing discussions

Users can create, edit, and delete their own posts

Commenting on posts

Upvoting and downvoting posts

Flash messages for feedback

Installation

Prerequisites

Make sure you have the following installed:

Ruby (check version with ruby -v)

Rails (check version with rails -v)

Bundler (gem install bundler if not installed)

A database system (SQLite, PostgreSQL, or MySQL)

Setup

Clone the repository and navigate to the project directory:

  git clone <repository_url>
  cd forum_app

Install dependencies:

  bundle install

Setup the database:

  rails db:create
  rails db:migrate
  rails db:seed # If you have seed data

Running the Application

Start the Rails server:

  rails server

Visit http://localhost:3000 in your browser.

Project Structure

app/views/layouts/application.html.erb: Main layout with navigation bar.

app/views/categories/index.html.erb: Displays categories.

app/views/categories/show.html.erb: Shows posts in a category.

app/views/posts/show.html.erb: Displays individual posts with comments and voting options.

Usage

Home Page: Lists available categories.

Category Page: Shows posts within the selected category.

Post Page: Displays the post, its comments, and upvote/downvote buttons.

Authentication: Users must log in to create/edit/delete their own posts.
