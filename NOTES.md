Questions:
- Correct DB setup?
- ApplicationRecord?

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


27.09.18
+ added partial for edit & new forms for projects

29.09.18
+ added delete function for projcets and client, flash message when successful

- add dynamic route redirect for deleting project from user or client route?
- add new project from client route -> not showing client in dropdown?
- Display total hours for entries? Add model method


To-Do:
- FB login
- scope method? - add one for displaying top 5 entries on dashboard
- validations
- validations that appear in views for creating and updating things (double check)
- have status for projects be a dropdown
- Show total time for projects, weekly time, etc

