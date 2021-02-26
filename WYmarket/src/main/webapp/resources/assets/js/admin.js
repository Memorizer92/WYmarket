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
	var form = document.createElement("form");
	form.setAttribute("method", "get");
	form.setAttribute("action", "/wymarket/admin/all");
	document.body.appendChild(form);
	form.submit();
}

function ban(userNick) {
	window.location.href = '/wymarket/admin/ban/' + userNick;
}

function unban(userNick) {
	const prefix = "/wymarket";

	let uri = prefix + "/admin/unban/" + userNick;

	xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
			document.getElementById("banTF").innerHTML = `${this.responseText}`;
			console.log('이 값은?' + document.getElementById("banTF").innerHTML);
		}
	}

	xhttp.open('GET', uri, true);

	xhttp.send();
}


