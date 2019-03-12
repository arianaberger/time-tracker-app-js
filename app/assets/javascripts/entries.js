//When document is ready, load the following:
$(document).ready(function () {
	console.log('JS is working for entries!');

	//Execute function to display data when page is done loading
	loadEntries();
});

function loadEntries() {
	$.ajax({
		url: 'http://localhost:3000/entries',
		method: 'get',
		dataType: 'json',
	}).done(function (data) {
		// console.log("the data is", data);
		let entries = createEntriesArray(data);
		let entryHTML = entriesHTML(entries);
		let userHTML = currentUserHTML(entries)
		document.getElementById('username').innerHTML += userHTML	
		document.getElementById('entries-list').innerHTML += entryHTML
	});
};

//An Entry class is used to create an Entry object used in createEntriesArray
class Entry {
	constructor(obj) {
		this.start_time = obj.start_time
		this.end_time = obj.end_time
		this.notes = obj.notes
		this.project = obj.project.name
		this.user = obj.user.name
		this.projectId = obj.project.id
	}
}

//Create an array of Entry objects using the JSON data grabbed with ajax request
function createEntriesArray(data) {
	let entries = [];
	data.forEach(function(e) {
		let entry = new Entry(e);
		entries.push(entry);
	});
	return entries;
}

//Sets entries HTML using Entry data to display on the DOM
function entriesHTML(entries) {
	let entriesHTML = []
	let entryHTML = entries.forEach(function(e) {
		let date = formatDate(e);
		let timeStart = formatStartTime(e);
		let timeEnd = formatEndTime(e);

		let html = (`
			<td>${date}</td>
			<td><strong><a href="/projects/${e.projectId}">${e.project}</a></strong></td>
			<td>${timeStart} to ${timeEnd}</td>
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
		</td><td class="table_total"><strong>*CALC TOTAL HOURS*</strong></td>
		</tr>
		</table>
	`)

	let HTML = tableStartHTML + entriesHTML.join("") + tableEndHTML
	return HTML
}


function currentUserHTML(entries) {
	let user = entries[0].user 
	let userName = `
		<h2>Time Entries: ${user}</h2>
		<hr>`
	return userName
}

function formatDate(e) {
	let entryDate = new Date(e.start_time);
	let year = entryDate.getFullYear();
	let months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
	let month = months[entryDate.getMonth()];
	let day = entryDate.getDate();
	let date = month + " " + day + ", " + year 
	return date;
}

//Used to format time
function addZero(i) {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}

//Both time functions could be turned into one, how to do this best?
function formatStartTime(e) {
	let start_time = new Date(e.start_time);
	let hStart = addZero(start_time.getHours());
	let mStart = addZero(start_time.getMinutes());
	let timeStart = hStart + ":" + mStart;
	return timeStart;
}

function formatEndTime(e) {
	let end_time = new Date(e.end_time);
	let hEnd = addZero(end_time.getHours());
	let mEnd = addZero(end_time.getMinutes());
	let timeEnd = hEnd + ":" + mEnd;
	return timeEnd;
}

// //Attempt at putting into one function, currently getting undefined for new Date
// function formatTime(e, arg) {
// 	debugger
// 	let time = new Date(`e.${arg}_time`);
// 	let h = addZero(`${arg}_time.getHours()`);
// 	let m = addZero(`${arg}_time.getMinutes()`);
// 	let timeString = h + ":" + h;
// 	return timeString;
// }

