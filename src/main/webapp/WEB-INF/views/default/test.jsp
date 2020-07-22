<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Simple Effects for Drop-Down Lists</title>
		<meta name="description" content="Simple Effects for Drop-Down Lists" />
		<meta name="keywords" content="drop-down, select, jquery, plugin, fallback, transition, transform, 3d, css3" />
		<meta name="author" content="Codrops" />
<!-- 		<link rel="shortcut icon" href="resources/dropimages/favicon.ico">  -->
		<link rel="stylesheet" type="text/css" href="resources/dropcss/style2.css" />
		<script src="resources/dropjs/modernizr.custom.63321.js"></script>
	</head>
	<body>
		<div class="container">	
			
			<section class="main clearfix">
				
				<div class="fleft">
					<select id="cd-dropdown" class="cd-select">
						<option value="-1" selected>Choose a network to add</option>
						<option value="1" class="icon-google-plus">Google Plus</option>
						<option value="2" class="icon-facebook">Facebook</option>
						<option value="3" class="icon-twitter">Twitter</option>
						<option value="4" class="icon-github">GitHub</option>
					</select>
				</div>
			</section>
		</div><!-- /container -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="resources/dropjs/jquery.dropdown.js"></script>
		<script type="text/javascript">
			
			$( function() {
				
				$( '#cd-dropdown' ).dropdown( {
					gutter : 5,
					delay : 100,
					random : true
				} );

			});

		</script>
	</body>
</html>
