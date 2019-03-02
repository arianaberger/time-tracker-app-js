$(document).ready(function () {
	console.log('JS is working!');

	//execute function to display data when page is done loading
	loadEntries();
});

function loadEntries() {
	$.ajax({
		url: 'http://localhost:3000/entries',
		method: 'get',
		dataType: 'json',
	}).done(function (data) {
		console.log("the data is", data);
		let entries = createEntriesArray(data);
		let entryHTML = entriesHTML(entries);
		document.getElementById('entries-list').innerHTML += entryHTML
	});
};

class Entry {
	constructor(obj) {
		this.start_time = obj.start_time
		this.end_time = obj.end_time
		this.notes = obj.notes
		this.project = obj.project.name
		this.user = obj.user.name
	}
}

function entriesHTML(entries) {
	let entriesHTML = []
	let entryHTML = entries.forEach(function(e) {
		let html = (`
			<p>
			<strong>${e.notes}</strong>
			${e.user} - ${e.project}</br>
			${e.end_time} - ${e.start_time}	
			</p>
		`)
		entriesHTML.push(html)
	})
	return entriesHTML.join("")
}

function createEntriesArray(data) {
	let entries = [];
	data.forEach(function(e) {
		let entry = new Entry(e);
		entries.push(entry);
	});
	return entries;
}