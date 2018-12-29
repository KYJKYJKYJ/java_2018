var titleNum;

function listView(num) {
	titleNum=num;
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'commentList?num=' + num,
		success:viewMessage
	});	
}