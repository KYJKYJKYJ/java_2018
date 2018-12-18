﻿<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>script_030_event_click</title>
<style type="text/css">
* {
   margin: 0;
   padding: 0;
}

body {
   font: 12px/1.5 dotum, "돋움", gulim, "굴림", sans-serif;
}

li {
   list-style: none;
}

table {
   border-collapse: collapse;
   border-spacing: 0;
}

h1 {
   text-align: center;
}

#carZone {
   width: 600px;
   margin: 0 auto;
}

#estimate {
   width: 100%;
}

#estimate th, td {
   border: 1px solid #ccc;
   height: 30px;
}

#estimate th {
   background-color: #333;
   color: #fff;
}

#carZone td {
   text-align: center;
}

tfoot {
   font-size: 15px;
   font-weight: bold;
}

#total {
   border: none 0;
   background: none;
   font-size: 1.5em;
   font-weight: bold;
   text-align: center;
}
</style>
<script type="text/javascript">
	/* 자동차 옵션 체크 박스를 클릭할 때 마다 함수 정의문 내에 일련의 실행문을 실행합니다. */
	window.onload=function() {
		document.getElementById("opt1").onclick = car;
		document.getElementById("opt2").onclick = car;
		document.getElementById("opt3").onclick = car;
	}
	
	//함수 정의 문
	function car() {
		var basicPrice = Number(document.getElementById("total").defaultValue);
		
		for(var i = 1; i <= 3; i++) {
			var chkObj = document.getElementById("opt"+i);
			if(chkObj.checked) {
				basicPrice += Number(chkObj.value);
			}
		}	
		document.getElementById("total").value = basicPrice;
	}
</script>
</head>
<body>
   <h1>자동차 견적</h1>
   <div id="carZone">
      <p>
         <img src="images/car1.jpg" alt="자동차" />
      </p>
      <table id="estimate">
         <colgroup>
            <col width="380px" />
            <col width="160px" />
            <col width="*" />
         </colgroup>
         <thead>
            <tr>
               <th scope="row">옵 션</th>
               <th scope="row">추가 가격</th>
               <th scope="row">선택</th>
            </tr>
         </thead>
         <tfoot>
            <tr>
               <th scope="col">(기본)차량가격</th>
               <td colspan="2"><input type="text" name="total" id="total"
                  value="13450000" readonly="readonly" /></td>
            </tr>
         </tfoot>
         <tbody>
            <tr>
               <td><label for="opt1">인조가죽시트</label></td>
               <td>250000</td>
               <td>
                  <!-- 옵션 체크박스에 클릭할 때 마다 car()에 저장된 일련의 실행문을 실행합니다. -->
                  <input type="checkbox" name="opt1" id="opt1"
                  value="250000"  />
               </td>
            </tr>
            <tr>
               <td><label for="opt2">내비게이션</label></td>
               <td>250000</td>
               <td><input type="checkbox" name="opt2" id="opt2"
                  value="250000"  /></td>
            </tr>
            <tr>
               <td><label for="opt3">선루프</label></td>
               <td>440000</td>
               <td><input type="checkbox" name="opt3" id="opt3"
                  value="440000"  /></td>
            </tr>
         </tbody>
      </table>
   </div>
   
   <!-- <script type="text/javascript">
	   var price = document.getElementById("total").value;
	   
	   document.getElementById("opt1").onclick = function() {
		   if(this.checked) {
			   price = eval(price) + eval(document.getElementById("opt1").value);
			   document.getElementById("total").value = price;
		   }
		   
		   if(!this.checked) {
			   price = eval(price) - eval(document.getElementById("opt1").value);
			   document.getElementById("total").value = price;
		   }
	   };
	   
	   document.getElementById("opt2").onclick = function() {
		   if(this.checked) {
			   price = eval(price) + eval(document.getElementById("opt2").value);
			   document.getElementById("total").value = price;
		   }
		   
		   if(!this.checked) {
			   price = eval(price) - eval(document.getElementById("opt2").value);
			   document.getElementById("total").value = price;
		   }
	   };
	   
	   document.getElementById("opt3").onclick = function() {
		   if(this.checked) {
			   price = eval(price) + eval(document.getElementById("opt3").value);
			   document.getElementById("total").value = price;
		   }
		   
		   if(!this.checked) {
			   price = eval(price) - eval(document.getElementById("opt1").value);
			   document.getElementById("total").value = price;
		   }
	   };
   </script> -->
</body>
</html>