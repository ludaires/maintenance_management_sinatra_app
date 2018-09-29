Specifications for the Sinatra Assessment


Specs:
 x   Use Sinatra to build the app
 
 x   Use ActiveRecord for storing information in a database
 
 x   Include more than one model class (list of model class names e.g. User, Post, Category)
        This project has 7 models. (Code, Equipment, InspectionPart, Inspection, maintenance, Part and User.)

 x   Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
        has_many => User has_many Maintenances
        has_many => Maintenance has_many Inspections
        has_many => Inspection has_many InspectionParts
        has_many => Equipment has_many Maintenaces

 x   Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
        belongs_to => Maintenance belongs_to User
        belongs_to => Maintenance belongs_to Equipment
        belongs_to => Inspection belongs_to Maintenance
        belongs_to => InspectionPart belongs_to Inspection
        belongs_to => InspectionPart belongs_to Part
        (Part has_one InspectionPart)
 x   Include user accounts
 x   Ensure that users can't modify content created by other users
 x   Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
 x   Include user input validations
 x   Display validation failures to user with error message (example form URL e.g. /posts/new)
x  Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

x You have a large number of small Git commits
x Your commit messages are meaningful
x You made the changes in a commit that relate to the commit message
x/o You don't include changes in a commit that aren't related to the commit message