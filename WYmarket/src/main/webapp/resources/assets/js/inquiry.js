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