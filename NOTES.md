Questions:
- Flash messages or using the inherit rails error messages?

------------

USER
- name
- email
- password
- title
- password_digest (schema)
- has_secure_password (model)

has_many :projects
has_many :clients, through: :projects


CLIENT
already clients
create new

- name

- has_many :projects
- has_many :users, through: :projects
*add location along with maps view*

PROJECT (JOIN)
- name
- deadline
- status

- has_many :entries
- belongs_to :client (schema, model)
- belongs_to :user (schema, model)


ENTRY
- date
- time
- notes

time: start_time
end_time:

- belongs_to :project (needs foreign key)

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

+ added last 3 time entries on dashboard - change to perhaps projects with top hours?

16.10.18
+ got FB login working - position is blank though, remove?

- fix entries: only display the user's entries
- what is wrong with projects? and clients
- just make clients and projects belong to 1 user!!

To-Do:
- add class method tests? check oo ruby
- add validation errors to partial
- add class method for total hours worked per entry / one for "yesterday's time entries"
- FB login
- validations that appear in views for creating and updating things (double check)
- Show total time for projects, weekly time, etc (add filter/search function on entries index page?)
- date and time formatting > move into model as a helper method?

