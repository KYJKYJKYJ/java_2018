$(document).ready(function() {
	$('#greeting').on('click', process);
});

function process() {
	$.ajax({
		type:'GET',
		dataType: 'text',
		url:'greeting.jsp',
		success:viewMessage
	});
}

function viewMessage(res) {
	$('#section').html(res);
}

