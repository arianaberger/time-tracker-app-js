$(document).ready(function () {
	console.log('JS is working for project show page!');

	listenerDisplayShowPageData();
	listenerSaveEntry();
});

function listenerDisplayShowPageData() {
	const projectID = window.location.href.replace('http://localhost:3000/projects/', '')
		$.ajax({
		url: `/projects/${projectID}`,
		method: 'get',
		dataType: 'json',
	}).done(function (data) {
		console.log('project data is:', data)
		let project = new Project(data);
		let projectHTML = project.projectHTML();
		document.getElementById('project-info').innerHTML += projectHTML
	})
}

class Project {
	constructor(obj) {
		this.name = obj.project.name
		this.status = obj.project.status
		this.deadline = formatDeadline(obj.project.deadline)
		this.owner = obj.owner.name
		this.ownerID = obj.owner.id
	}
}

Project.prototype.projectHTML = function () {
	return (`
		<h2>Project Name: ${this.name}</h2>
		<hr>

		<table>
			<tr><td><strong>Owner:</strong></td><td><a href="/users/${this.ownerID}">${this.owner}</a></td></tr>
			<tr><td><strong>Status:</strong></td><td>${this.status}</td></tr>
			<tr><td><strong>Deadline:</strong></td><td>${this.deadline}</td></tr>
		</table>
	`)
}

function formatDeadline(p) {
	let projectDeadline = new Date(p);
	let year = projectDeadline.getFullYear();
	let months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
	let month = months[projectDeadline.getMonth()];
	let day = projectDeadline.getDate();
	let date = month + " " + day + ", " + year 
	return date;
}




function listenerSaveEntry() {
	$('form').submit(function(event) {
		event.preventDefault();
		console.log("IT WORKZZ")

		let newEntry = $(this).serialize();
		let entry = $.post('/entries', newEntry);
		entry.done(function(data){
			console.log(data)
			var entry = data;
			debugger
        // $("#").text(post["title"]);
        // $("#postBody").text(post["description"]);
      });
	})
}