$(document).ready(function () {
	console.log('JS is working for projects!');

	//Execute function to display data when page is done loading
	listenerNewProject();
});

function listenerNewProject() {
	$('a#js-add-project').on('click', function(event) {
		event.preventDefault();
		let newProjectFormHTML = newProjectForm();
		// debugger
		document.getElementById('js-new-project-form').innerHTML = newProjectFormHTML;
	})
}

function newProjectForm() {
	let HTML = `
		<hr>
		<h3>Add New Project</h3>
		<form>
	  <table>
	    <tr>
	      <td>
	        Project Owner: 
	      </td>
	      <td>
	        <select>
			  <option value="kitty">Kitty</option>
			  <option value="karl">Karl Lagerfeld</option>
			  <option value="chanel">Coco Chanel</option>
			</select>
	      </td>
	    </tr>
	      <td>
	        Project Name: 
	      </td>
	      <td>
	        <input id="project-name" type='text' name='name'>
	      </td>
	    <tr>
	      <td>
	        Deadline:
	      </td>
	      <td>
	        <input id="project-deadline" type='date' name='deadline'>
	      </td>
	    </tr>
	    <tr>
	      <td>
	        Status:
	      </td>
	      <td>
	        <select>
			  <option value="just-started">Just Started</option>
			  <option value="in-progress">In Progress</option>
			  <option value="almost-finished">Almost Finished</option>
			  <option value="completed">Complete</option>
	  		  <option value="total-failure">Total Failure</option>
			  <option value="losing-money">Losing Money</option>
			</select>
	      </td>
        </tr>
	  </table>
	    <p><input type="submit" class="btn btn-primary btn-sm" %></p>
	</form>
	`
	return HTML;
}
