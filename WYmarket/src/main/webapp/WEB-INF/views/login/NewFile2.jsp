<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	<script>
		function getLocation() {
			if (navigator.geolocation) { // GPS를 지원하면
				navigator.geolocation.getCurrentPosition(function(position) {
					lat = position.coords.latitude;
					lon = position.coords.longitude;
					alert(lat + ' ' + lon);
					window.location.href = "./NewFile3/" + lat + "/"
							+ lon;
				}, function(error) {
					console.error(error);
				}, {
					enableHighAccuracy : true,
					maximumAge : 0,
					timeout : Infinity
				});
			} else {
				alert('GPS를 지원하지 않습니다');
			}
		}
		getLocation();
	</script>

</body>
</html>

