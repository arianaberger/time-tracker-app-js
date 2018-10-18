Questions:

------------


[USER] 			 					[CLIENT]
- has many Clients                  - belongs to a User
- has many Projects                 - has many Projects
- has many Entries                  - has many Entries through Projects


[PROJECT]
- belongs to a Client
- belongs to a User
- each project has many Entries -> is this a separate row or as an array?

[ENTRY]
- belongs to a Project
- belongs to a User
- has_many tags through entry_tags
- belongs_to entry_tags

[TAGS]
- has_many entries through entry_tags
- belongs_to entry_tags

id  entry_id  tag
1	1			fashion
1	2			fashion
2	1			runway


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

- how to display projects for the current user only when creating a time entry??
- make sure there are checks that you can't change other user's info!


To-Do:
- add class method tests? check oo ruby
- add validation errors to partial form to display the errors
- add class method for total hours worked per entry / one for "yesterday's time entries"
- Show total time for projects, weekly time, etc (add filter/search function on entries index page?)
- date and time formatting > move into model as a helper method?

