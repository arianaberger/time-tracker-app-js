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

		let newProject = $(this).serialize();
		let project = $.post('/projects', newProject);
		project.done(function(data){
			let project = new projectObject(data);
			let projectHTML = createProjectHTML(project)
			$('div#new-project')[0].innerHTML += projectHTML;
		})


		// let name = $('form')[0][3].value
		// if (name != "") {
		// 	let newProject = $(this).serialize();
		// 	let project = $.post('/projects', newProject);
		// 	project.done(function(data){
		// 		let project = new newProject(data);
		// 		$('#new-project').innerHTML += project;
		// 	})
		// } else
		// 	$('.btn btn-primary btn-sm').prop('disabled', false);
		// 	document.getElementsByClassName('input.btn btn-primary btn-sm').disabled = false;
		// 	window.alert("Please give your project a name");
		// 	// ELEMENT.classList.remove("CLASS_NAME");
	})
}

class projectObject {
	constructor(obj) {
		this.name = obj.project.name
		this.status = obj.project.status
		this.owner = obj.owner.name
	}
}

function createProjectHTML(project) {
	let HTML = (`
	  	<table><tr>
	  	<td><strong><a href="">${project.name}</a></strong></td>
	  	<td><a href="">${project.name}</a></td>
	  	<t${project.status}</td>
	  	<td>0</td>
	  	</tr></table>
	`)
	return HTML
}




