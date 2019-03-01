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
		let entry = new Entry(data[0]);
		debugger
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