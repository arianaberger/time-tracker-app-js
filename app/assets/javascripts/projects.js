//When document is ready, load the following:
$(document).ready(function () {
	console.log('JS is working for projects!');

	//Execute function to display data when page is done loading
	listenerNewProject();
	listenerDisplayProjectData();
});


//Added to try and fix 422 error
var token = $("meta[name='_token']").attr("content");
$.ajaxSetup({
  beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-TOKEN', token);
  }
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

//Checks the user inputted a project name, then sends post request to #create controller method
//Captures user input from form into a hash used to create new instance of a project
function listenerSaveProject() {
		$('form').submit(function(event) {
				event.preventDefault();

		let owner = $('select')[0].value;
		let name = $('input#project-name')[0].value;
		let deadline = $('input#project-deadline')[0].value
		let status = $('select')[1].value;
		// const newProject = {name: name, deadline: deadline, status: status, owner: owner, _token: {{ csrf_token() }} }
		const newProject = {name: name, deadline: deadline, status: status, owner: owner}

		// if (name != "") {
		// let project = $.post('/projects', newProject);
		// project.done(function(data){
		// 	debugger
		// })
		// } else {
		// 	window.alert("Please give your project a name");
		// }

		if (name != "") {
			$.ajax({
	      type: 'POST',
	      // datatype: "json",
	      url: `/projects`,
	      data: newProject,
    	});
		} else {
			window.alert("Please give your project a name");
		}
	})
}


//Begin code for show page

function listenerDisplayProjectData() {
	const projectID = window.location.href.replace('http://localhost:3000/projects/', '')
	url = `/projects/${projectID}`
		$.ajax({
		url: url,
		method: 'get',
		dataType: 'json',
	}).done(function (data) {
		console.log(data)
	})
}

