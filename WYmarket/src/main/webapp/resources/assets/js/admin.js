function ajaxLogOut() {

	const prefix = "/wymarket/logout";

	let uri = prefix;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {

		}
	}
	xhttp.open('GET', uri, true);

	xhttp.send();
	

}

function searchAll() {
	console.log('여기 오냐고');
	var form = document.createElement("form");
	form.setAttribute("method", "get");
	form.setAttribute("action", "/wymarket/admin/all");
	document.body.appendChild(form);
	form.submit();
}


function banUnban(btn, userNick, id) {
	const prefix = "/wymarket";

	let uri = prefix + "/admin/" + btn.dataset.btnType + "/" + userNick;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
			document.getElementById("banTF" + id).innerHTML = `${this.responseText}`;
			console.log('이 값은?' + document.getElementById("banTF" + id).innerHTML);
		}
	}

	xhttp.open('GET', uri, true);

	xhttp.send();
}




