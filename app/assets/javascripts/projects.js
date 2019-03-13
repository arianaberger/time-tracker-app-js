$(document).ready(function () {
	console.log('JS is working for projects!');

	//Execute function to display data when page is done loading
	listenerNewProject();
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
		})
}
