*MAIN ISSUES:*
- if new project form is missing a name, the 'create' button is disabled and I can't un-disable it
- having a new form page and ajax new form work together (layout displaying in ajax form and how to get create method to render html vs json?)
- JSON dates for entries are incorrect (added 'date' to entry serializer, should be able to get it working)
- Test for new users without entry/project data

TODO:
- filter for entries (use window.location.search!)
- json time data for entries is not correct
- *Posting ajax form:*
	- added tags to header in application layout and messed with .js file, still no luck
	- also added hidden field to form
	- token added to project data hash but error is that there's an uexpected token
- entries on project show page?

28.02
- copied app on github
- removed turbolinks gem/from js manifest
- added jquery gem and proper require to JS manifest file


09.03
- Index page (entries) is missing the following:
	filter function not working
	add entry button is still Ruby
	date formatting/actual date isn't correct

13.03
- json data for entries not working when I want to also display entry_hours
- submit function not working for new project form

18.03
- created a totalHours function for entries
- json data for project show page working

**********************

REVIEW FOR ASSESSMENT:

If you have Howard be prepared for a full review of your project and how it works, how it meets the requirments.  Then, he will ask for live coding based on your project to change/add some functionality.  I hear this varies per project.  After which, you will be live quizzed on javascript concepts - scope, hoisting, E6 stuff, etc.  It was pretty intense but a great learning experience. He reviews stuff and points out alternative concepts, etc.  All the dialog - it took 2 sessions.  But he said it was not a failing, just a continuation.  He is a pretty good teacher.  Good luck!


**********************

RAILS/JS Project

Duplicate Rails app, rather than using page refreshes use DOM manipulation

$.get

.ajax (post)

XHR

A summary of the application

- Todo app allows you to create projects and show you’ve worked on them by submitting time entries. Other colleagues can work on your project and vice versa. 

[ ] What is your plan to render an index page via JavaScript & JSON?

* still need to get filter function working

- Entries page (this shows all of your time entries) - render JSON (in controller), takes serialized data from EntriesSerializer. Create a JS model object
- Essentially the view page can be deleted

[ ] What is your plan to render a show page via JavaScript & JSON?

- Project show page - shows project details and time entries for that project

[x] How will you implement rendering a has_many [through] relationship via JavaScript & JSON?

- Can show contributors to a project (via entries) on the project show page - list of contributors on the top (or already included in the entries list?)

[ ] What form will you use to submit via AJAX?
* Form not working!

-“In the blog domain example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM using JavaScript (ES6 Template Literals can help out a lot with this).” 

- Form on ‘Your Projects’ (projects index page) to dynamically create a new project without refreshing. Form will also be displayed using JS.

[ ] What is meant by JavaScript Model Objects and how will you implement them in your application?
* Entry class created to gather an array of entry objects
* Project class and prototype created in project.js

- JS is object-based and based on prototypes, we don’t create classes with instances of objects but simply create objects. Initialization without persistence

- When displaying the list of the entries for a specific project (link to “View All” project entries), a new JS model object will be created 

- Use for formatting!


