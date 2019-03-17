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

//Checks the user inputted a project name, then sends post request to #create controller method
//Captures user input from form into a hash used to create new instance of a project
function listenerSaveProject() {
		$('form').submit(function(event) {
				event.preventDefault();

		let owner = $('select')[0].value;
		let name = $('input#project-name')[0].value;
		let deadline = $('input#project-deadline')[0].value
		let status = $('select')[1].value;
		let csfr = getCSRFTokenValue();
		const newProject = {name: name, deadline: deadline, status: status, owner: owner, CSFR: csfr}


		let project = $.post('/projects', newProject);
		posting.done(function(data){
			debugger
		})

		// if (name != "") {
		// 	// getting 422 unprocessable entity
		// 	$.ajax({
	 //      type: 'POST',
	 //      url: `/projects`,
	 //      data: newProject,
	 //      success: function (data) {
  //       console.log(data);
		//     },
		//     error: function (data) {
		//         console.log(data)
  //   }
  //   	});
		// 	// $.post("/projects", newProject, function(project) {
		// 	// 	debugger
		// 	// })
		// } else {
		// 	window.alert("Please give your project a name");
		// }
	})
}

