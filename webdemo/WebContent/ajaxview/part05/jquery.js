$(document).ready(function() {
	$("#btn").on('click', process);
});

function process() {
  /*$.ajax({
		type : "GET",
		dataType : "json",
		url : "ajaxview/part05/product.txt",
		success : viewMessage
	});*/
	
	/*
	 * $.getJSON(); - get방식 실행 후 JSON데이터를 가져온다
	 * (형식) $.getJSON (url, [data], [callback])
	 * url : 호출할 파일(경로)
	 * data : url에 보낼 데이터 ex) id값, password값
	 * callback : 처리 결과를 담당할 함수
	 */
	//위 코드와 동일한 기능을 수행하는 getJSON
	$.getJSON('ajaxview/part05/product.txt', viewMessage);
}

function viewMessage(res) {
	/*alert(res);
	alert(res instanceof Array);*/
	if(res.length == 0) {
		$('#display').empty();
		$('#display').text('데이터가 없습니다');
	} else {
		var table = $('<table border="1"><tr><th>item</th><th>price</th><th>regdate</th></tr></table>');
		for(var i=0; i<res.length; i++) {
			var tr = $('<tr><td>'+res[i].item+'</td><td>'+res[i].price+'</td><td>'+res[i].regdate+'</td></tr>');
			table.append(tr);
		}
	}
	//div요소에 기존에 존재한 자식요소들을 제거한다.
	var child = $('#display').children();
	$(child).remove();
	
	//div요소에 새로 생성한 자식요소 추가
	$('#display').html(table);
}