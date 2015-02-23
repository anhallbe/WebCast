<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>WebCast Home</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!--<form action="rest/cast/media" method="POST">
		<p>
			URL to cast: <input name="url">
			<input type="submit" value="Cast">
		</p>
	</form> -->
	<div class="container">
		<div class="jumbotron">
			<h1>WebCast</h1>
			<p>Broadcast to nearby Chromecast devices.</p> 
		</div>
		<form role="form" action="rest/cast/media" method="POST">
	  		<div class="form-group">
				<label for="url">URL</label>
				<input class="form-control" id="url" name="url">
			</div>
			<!-- <div class="form-group">
				<label for="mediaType">Media type</label>
				<select class="form-control" id="mediaType">
					<option>Audio/Video</option>
					<option>Presentation</option>
					<option>YouTube</option>
					<option>Web page</option>
				</select>
			</div>  -->
			<button type="submit" class="btn btn-default">Cast</button>
		</form>
	</div>
</body>
</html>

