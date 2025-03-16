# Forum App

## Description
A simple Reddit-like forum built with Ruby on Rails, where users can create categories, make posts, comment, and upvote/downvote posts. Users can also delete or modify only their own posts.

## Features
- User authentication (Login, Registration, Logout)
- Users can create, edit, and delete their own posts
- Commenting on posts
- Upvoting and downvoting posts

## Installation

### Prerequisites
Make sure you have the following installed:
- Ruby (check version with `ruby -v`)
- Rails (check version with `rails -v`)
- Bundler (`gem install bundler` if not installed)
- A database system (SQLite, PostgreSQL, or MySQL); I personally used SQLite when i made the project.

### Setup
Clone the repository and navigate to the project directory:
```sh
  git clone <repository_url>
  cd forum_app
```

Install dependencies:
```sh
  bundle install
```

Setup the database:
```sh
  rails db:create
  rails db:migrate
  rails db:seed # If you have seed data
```

## Running the Application
Start the Rails server:
```sh
  rails server
```
Visit `http://localhost:3000` in your browser.

## Project Structure
- `app/views/layouts/application.html.erb`: Main layout with navigation bar.
- `app/views/posts/show.html.erb`: Displays individual posts with comments and voting options.

## Usage
- **Home Page**: Lists available posts.
- **Post Page**: Displays the post, its comments, and upvote/downvote buttons.
- **Authentication**: Users must log in to create/edit/delete their own posts.


