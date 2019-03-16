$(document).ready(function () {
	console.log('JS is working for projects!');

	//Execute function to display data when page is done loading
	listenerNewProject();
	// listenerSaveProject();
});

function listenerNewProject() {
	$('a#js-add-project').on('click', function(event) {
		event.preventDefault();
		newProjectForm();
	})
}

function newProjectForm() {
		$.get("/projects/new", function(projectForm) {
			document.getElementById('js-new-project-form').innerHTML = projectForm;
		}).done(function() {
			listenerSaveProject();
		})
}

function listenerSaveProject() {
	$('#project-submit').on('click', function(event) {
		event.preventDefault();

		let owner = $('select')[0].value;
		let name = $('input#project-name')[0].value;
		let deadline = $('input#project-deadline')[0].value
		let status = $('select')[1].value;


		debugger
		console.log("it worksssss");
	})
}

