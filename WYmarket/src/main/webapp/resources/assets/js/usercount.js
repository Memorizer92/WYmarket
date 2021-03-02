


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