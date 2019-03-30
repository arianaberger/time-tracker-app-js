//When document is ready, load the following:
$(document).ready(function () {
	console.log('JS is working for projects!');

	//Execute function to display data when page is done loading
	listenerNewProject();
});

//Listens for click to add new project
function listenerNewProject() {
	$('a#js-add-project').on('click', function(event) {
		event.preventDefault();
		newProjectForm();
	})
}

//Get request to #new controller method to retrieve project form and append to the DOM
function newProjectForm() {
		$.get("/projects/new", function(projectForm) {
			document.getElementById('js-new-project-form').innerHTML = projectForm;
		}).done(function() {
			listenerSaveProject();
		})
}

//Checks the user inputted a project name, then sends post request to #create controller method and appends new project to DOM
function listenerSaveProject() {
	$('form').submit(function(event) {
		event.preventDefault();
		if ($('form')[0][3].value != "") {
			let newProject = $(this).serialize();
			let project = $.post('/projects', newProject);
			project.done(function(data){
				let project = new projectObject(data);
				let projectHTML = createProjectHTML(project);
				$('table#projects-table tr:last').after(projectHTML);
				successAlert();
				removeDisable();
				$('input#project_name').val('');
			});
		} else { 
			window.alert("Please give your project a name");
			removeDisable();
		}
	})
}

class projectObject {
	constructor(obj) {
		this.id = obj.project.id
		this.ownerID = obj.project.owner
		this.name = obj.project.name
		this.status = obj.project.status
		this.owner = obj.owner.name
	}
}

function createProjectHTML(project) {
	let HTML = (`
	  	<tr>
	  	<td><strong><a href="/projects/${project.id}">${project.name}</a></strong></td>
	  	<td><a href="/users/${project.ownerID}">${project.owner}</a></td>
	  	<td>${project.status}</td>
	  	<td>0</td>
	  	</tr>
	`)
	return HTML
}

function successAlert() {
	$('#success').remove()
	$('div#alert-js')[0].innerHTML = "Project successfully created!";
	$('div#alert-js').addClass("alert alert-success text-center");
}

function removeDisable() {
	$('.input.btn.btn-primary.btn-sm').prop("disabled", false);
	// $('input.btn.btn-primary.btn-sm').removeAttr('data-disable-with');
}


