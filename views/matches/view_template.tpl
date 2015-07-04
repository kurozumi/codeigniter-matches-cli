<!DOCTYPE html> 
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Project name</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class="active"><?php echo anchor("", "Home");?></li>
						<li><?php echo anchor("", "About");?></li>
						<li><?php echo anchor("", "Contact");?></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container" style="margin-top: 30px;">
			<?php $this->load->view($include); ?>        
		</div>

		<footer class="footer">
			<div class="container">
				<p>計実行時間:<?php echo $this->benchmark->elapsed_time(); ?> <span class="pipe">|</span> メモリ使用量：<?php echo $this->benchmark->memory_usage(); ?></p>
			</div>
		</footer>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>
