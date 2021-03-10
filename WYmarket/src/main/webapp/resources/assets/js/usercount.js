


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


/*function monthChange() {
	if (monthCon.value != '월 선택') {
		dayCon.disabled = false;

		const prefix = "/wymarket";
		let uri = prefix + "/admin/dayCheck/" + yearCon.value + "/"
			+ monthCon.value;
		xhttp = new XMLHttpRequest();

		xhttp.onreadystatechange = function() {
			if (this.status == 200 && this.readyState == XMLHttpRequest.DONE) {
				console.log(document.getElementById('day').getAttribute('end'));
				//document.getElementById('day').setAttribute('end', `${this.responseText}`);
				document.getElementById('day').innerHTML = `${this.responseText}`;
				console.log(document.getElementById('day').getAttribute('end'));
			}
		}
		xhttp.open('GET', uri, true);
		xhttp.send();

	} else {
		dayCon.disabled = true;
	}
	dayCon.value = '일 선택';

}*/