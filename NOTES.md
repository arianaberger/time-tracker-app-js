- entries json data only shows id for project and user, how to display?

28.02
- copied app on github
- removed turbolinks gem/from js manifest
- added jquery gem and proper require to JS manifest file


09.03
- Index page (entries) is missing the following:
	filter function not working
	add entry button is still Ruby
	date formatting/actual date isn't correct




RAILS/JS Project

Duplicate Rails app, rather than using page refreshes use DOM manipulation

$.get

.ajax (post)

XHR

A summary of the application

- Todo app allows you to create projects and show you’ve worked on them by submitting time entries. Other colleagues can work on your project and vice versa. 

What is your plan to render an index page via JavaScript & JSON?

- Entries page (this shows all of your time entries) - render JSON (in controller), takes serialized data from EntriesSerializer. Create a JS model object

- Essentially the view page can be deleted

What is your plan to render a show page via JavaScript & JSON?

- Project show page - shows project details and time entries for that project

How will you implement rendering a has_many through relationship via JavaScript & JSON?

- Can show contributors to a project (via entries) on the project show page - list of contributors on the top (or already included in the entries list?)

What form will you use to submit via AJAX?

-“In the blog domain example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this).” 

- Form on ‘Your Projects’ (projects index page) to dynamically create a new project without refreshing. Form will also be displayed using JS.

What is meant by JavaScript Model Objects and how will you implement them in your application?

- JS is object-based and based on prototypes, we don’t create classes with instances of objects but simply create objects. Initialization without persistence

- When displaying the list of the entries for a specific project (link to “View All” project entries), a new JS model object will be created 

- Use for formatting!


