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
	});
};