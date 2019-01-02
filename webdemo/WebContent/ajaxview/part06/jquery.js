var titleNum;

$(document).ready(function() {
	//댓글입력 시작
	$('#btnInput').on('click', function() {
		$.ajax({
			type:"POST",
			dataType:"text",
			url:"commentInput",
			data:"num=" + titleNum + "&content=" +
			$('#textInput').val(),
			succes:inputMessage
		});
	});
	//댓글 입력 끝
	
	//수정버튼에 동적이벤트 등록
	$(document).on('click', '[value="수정"]', function() {
		$('#divUpdate').css({"display":"block"});
		$('#commentAdd').css({"display":"none"});
		
		var selEle=$(this).parent();
		$('#textCol').val(selEle.children('p:nth-child(1)').text());
		$('#textUpdate').val(selEle.children('p:nth-child(2)').text());
	});
	
	$('#btnUpdate').on('click', function() {
		$.ajax({
			type:"POST",
			dataType: "text",
			url:'commentUpdate',
			data:'col=' + $("#textCol").val() + "&content=" + $("#textUpdate").val() + "&num=" + titleNum,
			success:updateMessage
		});
	});
});

function updateMessage(res) {
	$("#commentList").empty();
	//$("#commentList")의 자식 요소만 삭제
	listView(res);
	$('#divUpdate').css({"display":"none"});
	$('#commentAdd').css({"display":"block"});
};

//댓글 삽입 응답
function inputMessage(res) {
	$("#commentList").empty();
	//$("#commentList")의 자식 요소만 삭제
	listView(res);
};

function listView(num) {
	titleNum=num;
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'commentList?num=' + num,
		success:viewMessage
	});	
};

//댓글 리스트 응답
function viewMessage(res) {
	//alert(res);
	
	for(index in res) {
		var div = $('<div></div>');
		$('#commentList').append(div);
		
		var p1 = $('<p>' + res[index].col + '</p>');
		$(div).append(p1);
		
		var p2 = $('<p>' + res[index].content + '</p>');
		$(div).append(p2);
		
		var inputupdate = $('<input type = "button" value = "수정" />');
		$(div).append(inputupdate);
		
		var inputdelete = $('<input type = "button" value = "삭제" />');
		$(div).append(inputdelete);
	}
};