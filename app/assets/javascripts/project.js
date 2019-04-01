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
		let project = new Project(data);		
		let projectHTML = project.projectHTML();
		document.getElementById('project-info').innerHTML += projectHTML

		let entries = createEntriesArrayForProject(data);
		if (entries) {
			let entriesHTML = entriesProjectHTML(entries);
			document.getElementById('entries-info').innerHTML += entriesHTML		
		}
	})
}

class Project {
	constructor(obj) {
		this.name = obj.project.name
		this.status = obj.project.status
		this.deadline = formatDate(obj.project.deadline)
		this.ownerID = obj.project.owner
		this.owner = obj.owner.name
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
function createEntriesArrayForProject(data) {
	let allEntries = [];
	let entriesArr = data.entries
	if (entriesArr.length != 0) {
		entriesArr.forEach(function(e) {
			let entry = new Entry(e);
			allEntries.push(entry);
		});
		return allEntries;
	} else {
		return null
	}
}

//Sets entries HTML using Entry data to display on the DOM
function entriesProjectHTML(entries) {
	let entriesHTML = []
	let totalHours = calculateHours(entries)
	let entryHTML = entries.forEach(function(e) {
		let html = (`
			<td>${e.date}</td>
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
			<th>Hours</th>
			<th>Notes</th>
			</tr>
		`);

	let tableEndHTML = (`
		<tr>
		<td class="table_total"><strong>Total hours worked:</strong> 
		</td><td class="table_total"><strong>${totalHours}</strong></td>
		</tr>
		</table>
	`)

	let HTML = tableStartHTML + entriesHTML.join("") + tableEndHTML
	return HTML
}

function formatDate(p) {
	let newDate = new Date(p);
	let year = newDate.getFullYear();
	let months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
	let month = months[newDate.getMonth()];
	let day = newDate.getDate();
	let date = month + " " + day + ", " + year 
	return date;
}


