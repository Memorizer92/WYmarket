
function getLocation() {
	navigator.geolocation.getCurrentPosition(function(position) {
		lat = position.coords.latitude;
		lon = position.coords.longitude;
		ajaxGetAddress(lat, lon);
	}, function(error) {
		console.error(error);
	}, {
		enableHighAccuracy: true,
		maximumAge: 0,
		timeout: Infinity
	});
}
getLocation();

function ajaxGetAddress(lat, lon) {
	const prefix = "wymarket/address";

	let uri = prefix + "/" + lat + "/" + lon;
	console.log(uri);
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
			document.getElementById("gpsContent").innerHTML = `${this.responseText}`;
		}
	}

	xhttp.open('GET', uri, true); // 비동기 통신이면 true //1

	//xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(); //2

	// 3 rest 에서 요청한게 100MB라 치면 3인 상태(다운로드 중인) (로딩상태)

}



var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
myModal.show()

function ajaxGetSMS(phoneNumber) {
	const prefix = "wymarket/getsms";

	let uri = prefix + "/" + phoneNumber;
	console.log(uri);
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
			document.getElementById("getsmscode").value = `${this.responseText}`;
		}
	}

	xhttp.open('POST', uri, true); // 비동기 통신이면 true //1

	//xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(); //2

	// 3 rest 에서 요청한게 100MB라 치면 3인 상태(다운로드 중인) (로딩상태)

}

function ajaxGetph(phoneNumber) {
	const prefix = "wymarket/getph";

	let uri = prefix + "/" + phoneNumber;
	console.log(uri);
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
			document.getElementById("getph").value = `${this.responseText}`;
		}
	}

	xhttp.open('POST', uri, true); // 비동기 통신이면 true //1

	//xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(); //2

	// 3 rest 에서 요청한게 100MB라 치면 3인 상태(다운로드 중인) (로딩상태)

}





