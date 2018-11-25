Questions:

------------


[USER] 			 					[CLIENT]
- has many Clients                  - belongs to a User
- has m                 			- has many Projects
- has many                   		

User has many projects, through: :entries
Project has many users, through: :entries
both have many :entries (join table)
entry belongs to both (needs foreign key)

[PROJECT] 
- belongs to a Client
- has many Entries
- has many users through entries

[ENTRY] + user is assigned to a project when adding an entry
- belongs to a Project
- belongs to a User

*[TAGS]*
- belongs to project
- belongs to entry







--------------
Nested routes

users/1/projects -> show (index) + link to create a new project
-> post to /projects

clients/1/projects/new 
-> post to /projects


--------------
Clients
- Index page -> add or create new client
- Client specific page
  -> add a project or click link to current project for this client
  *get create project form to work (date??)*

Projects
- Index page -> can add new project from here
- Project specific page
  -> add a time entry

Add Time Entry
- form: choose project to add entry (can this be dynamic?)


---------------
My Progress
---------------

27.09.18
+ added partial for edit & new forms for projects

29.09.18
+ added delete function for projects and client, flash message when successful

08.10.18
+ added redirect for root page if user logged in and user#show if not logged in
+ removed extra #show action in users controller
+ fixed routing for project show page links in client show page and projects index page
+ current client selected from dropdown in new project form (from client or projects page!) using :select => 
+ added flash notice for signup/login pages and when logging out
+ added date and time select to new entry form

09.10.18
+ updated date format for deadline on projects show page
+ added status dropdown incl. method helper and datetime for deadline
+ added last 3 time entries on dashboard

16.10.18
+ got FB login working - position is blank though, remove?

17.10.18
+ re-did table and associations!
+ entries, clients, and projects are displaying only for that user
+ only show last 2 entries on dashboard


20.10.18
+ new tags join model

22.10.18
+ deleted tags and updated join table to be Entries
+ you can delete a client and it will delete the assoc. projects
+ added warning message when deleting client!


02.11.18
+ deleted clients from DB! and added owner to project
+ added owner to projects

07.11.18
+ changed some formatting for projects page and added time entries for that project

14.11.18
+ scope method and filtering for time entries page by project
+ separate show page for users



[x] Not working:
- omniauth login because of user validations
- after creating time entry > redirect to project page
- correct project doesn't show up in time entry new form
- move date formatting into concern/module (formatdate.rb)
- active storage for user to have an avatar (paperclip gem?)


[~] To-Do:
- test for new user sign up (no entries/projects)
- flexbox on dashboard
- add class method tests? check oo ruby
- Show total time for projects, weekly time, etc (add filter/search function on entries index page?)









