$(document).ready(function () {
	console.log('JS is working for project show page!');

	listenerDisplayShowPageData();
});

function listenerDisplayShowPageData() {
	const projectID = window.location.href.replace('http://localhost:3000/projects/', '')
		$.ajax({
		url: `/projects/${projectID}`,
		method: 'get',
		dataType: 'json',
	}).done(function (data) {
		console.log('project data is:', data)
		let project = new Project(data)
	})
}

class Project {
	constructor(obj) {
		this.name = obj.project.name
		this.status = obj.project.status
		this.deadline = formatDeadline(obj.project.deadline)
	}
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