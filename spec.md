# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  Sinatra was the basis of the project, corneal was used to build the app structure. 
- [x] Use ActiveRecord for storing information in a database
    Activerecord and the MVC controller model was used to built out the structure of the application
- [x] Include more than one model class (e.g. User, Post, Category)
    Originally three models were built out, do to time restrictions this was reduced to two. A users model and a projects model, a user has many projects and a project only has one user. Future build out would be add equipment to the to the projects, a project has many pieces of equipment however a piece of equipment only has one project.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    In this Sinatra Application a user has many projects. 
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    in this Sinatra Application a project belongs to a user
- [x] Include user accounts with unique login attribute (username or email)
    Users must login to view and create projects. Only users who created the project can edit or delete the project. 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Users can edit, update and destroy there project only
- [x] Ensure that users can't modify content created by other users
    Only users who created the project can edit, update or delete them.
- [x] Include user input validations
    Sign up prevents duplicate usernames from being created, fields are required to be filled out
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    This is complete 
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
