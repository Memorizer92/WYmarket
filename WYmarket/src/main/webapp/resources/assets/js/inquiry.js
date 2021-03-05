
function ajaxInquiry(inquiryID, userNick, inquiryCategory, inquiryContent) {
	var data = {
		inquiryID: inquiryID,
		userNick: userNick,
		inquiryCategory: inquiryCategory,
		inquiryContent: inquiryContent
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("modalContent").innerHTML = `${this.responseText}`;
			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/admin/inquiryModal', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));

	var myModal = new bootstrap.Modal(document.getElementById('inquiryModal'));
	myModal.show()

}

function ajaxAdminToUser(adminToUser) {
	var data = {
		userNick: adminToUser
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("reply").innerHTML = `${this.responseText}`;
				document.getElementById('btn1').style.display = 'none';
				document.getElementById('btn2').style.display = 'none';
			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/admin/adminToUser', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));
}

function ajaxshowHistory(id) {
	var data = {
		inquiryID: id
	}

	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == XMLHttpRequest.DONE) {
			if (xhttp.status == 200) {
				document.getElementById("inModal").innerHTML = `${this.responseText}`;
			} else {

			}
		}
	}

	xhttp.open('POST', '/wymarket/admin/checkHistory', true);
	xhttp.setRequestHeader('content-type', 'application/json');
	xhttp.send(JSON.stringify(data));

	var myModal = new bootstrap.Modal(document.getElementById('inquirySentModal'));
	myModal.show()
}

function ajaxReply() {
	const id = document.getElementById('text');
	const prefix = "/wymarket/admin/sendInquiryAdminToUser/" + id.value;

	let uri = prefix;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() { // onreadystatechange = readystate이 변할 때 작동함
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) { //4

		}
	}

	xhttp.open('GET', uri, true);

	xhttp.send(); //2

}

