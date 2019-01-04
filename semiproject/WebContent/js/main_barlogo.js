$(document).ready(function() {
	$('#barlogo').on('click', process);
});

function process() {
	$.ajax({
		type:'GET',
		dataType: 'text',
		url:'/index.jsp',
		success:viewMessage
	});
}

function viewMessage(res) {
	$('body').html(res);
}