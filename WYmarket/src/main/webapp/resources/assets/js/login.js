

function btnAction(btn) {
	// data-*에 정의한 속성값은 dataset.*을 통해 접근할 수 있다.
	// alert("눌린 버튼: " + btn.dataset.btnType);

	if (phonetext.value.length == 11) {

		

		// const prefix = "/practice_mvc/rest/";
		let uri = prefix + btn.dataset.btnType + "/" + phonetext.value;

		//alert(uri);

		// Ajax : Asynchronous JavaScript and XML (or JSON)

		// - 웹 서버와 비동기적으로 상호작용할 수 있다.
		// - 페이지를 변화시키지 않으면서 웹 서버로 요청을 보낸다. 새로고침을 안 하고!!
		// - 보낸 요청에 대한 응답이 도착하면 readyState값이 변한다
		// - 받은 응답을 통해 하고싶은 것을 한다.


		xhttp = new XMLHttpRequest();
		// readtState은 현재 정보를 담은 XMLHttpRequest의 상태 (opened, loaded, done 등)
		// readyState가 변할 때마다 발생하는 이벤트를 처리하는 메서드 정의
		xhttp.onreadystatechange = function() { // onreadystatechange = readystate이 변할 때 작동함
			if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) { //4

			}
		}

		xhttp.open('POST', uri, true); // 비동기 통신이면 true //1

		//xhttp.setRequestHeader('content-type', 'application/json');
		xhttp.send(); //2

		// 3 rest 에서 요청한게 100MB라 치면 3인 상태(다운로드 중인) (로딩상태)

		console.log('sent xhttp...');
		//alert('인증코드는 ' + "<c:out value='${smscodes}'/>" + ' 입니다');
	} else {
		alert('전화번호 형식이 아닙니다');
	}
}


