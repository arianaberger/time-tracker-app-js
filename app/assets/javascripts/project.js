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
		let project = new Project(data);
		let entries = createEntriesArray(data);
		let projectHTML = project.projectHTML();
		let entriesHTML = entries.entriesHTML();
		document.getElementById('project-info').innerHTML += projectHTML
		document.getElementById('entries-info').innerHTML += entriesHTML		
	})
}

class Project {
	constructor(obj) {
		this.name = obj.project.name
		this.status = obj.project.status
		this.deadline = formatDeadline(obj.project.deadline)
		this.owner = obj.project.users[0].name
		this.ownerID = obj.project.owner
	}
}

class Entries {
	constructor(obj) {
		debugger
		// this.date = formatDate(obj)
		// this.startTime = formatStartTime(obj)
		// this.endTime = formatEndTime(obj)
		// this.notes = obj.attributes.notes
		// this.project = obj.attributes.project.name
		// this.user = obj.relationships.user.data.name
		// this.projectId = obj.attributes.project.id

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


//Create an array of Entry objects using the JSON data grabbed with ajax request
function createEntriesArray(data) {
	let allEntries = [];
	let entriesArr = data.project.entries
	debugger
	entriesArr.forEach(function(e) {
		let entry = new Entry(e);
		entries.push(entry);
	});
	return allEntries;
}

//Sets entries HTML using Entry data to display on the DOM
function entriesHTML(entries) {
	let entriesHTML = []
	let totalHours = calculateHours(entries)
	let entryHTML = entries.forEach(function(e) {
		let html = (`
			<td>${e.date}</td>
			<td><strong><a href="/projects/${e.projectId}">${e.project}</a></strong></td>
			<td>${e.startTime} to ${e.endTime}</td>
			<td><i>${e.notes}</i></td>
			</tr>
		`)

		entriesHTML.push(html) 
	})

	let tableStartHTML = (`
			<table>
			<tr>
			<th>Date</th>
			<th>Project</th>
			<th>Hours</th>
			<th>Notes</th>
			</tr>
		`);

	let tableEndHTML = (`
		<tr>
		<td></td><td class="table_total"><strong>Total hours worked:</strong> 
		</td><td class="table_total"><strong>${totalHours}</strong></td>
		</tr>
		</table>
	`)

	let HTML = tableStartHTML + entriesHTML.join("") + tableEndHTML
	return HTML
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


