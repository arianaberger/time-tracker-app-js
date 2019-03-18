$(document).ready(function () {
	console.log('JS is working for project show page!');

	listenerDisplayShowPageData();
});

function listenerDisplayShowPageData() {
	const projectID = window.location.href.replace('http://localhost:3000/projects/', '')
	url = `/projects/${projectID}`
		$.ajax({
		url: url,
		method: 'get',
		dataType: 'json',
	}).done(function (data) {
		console.log('project data is:', data)
	})
}

