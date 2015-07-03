<!DOCTYPE html> 
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?php echo link_tag('assets/css/bootstrap.min.css?timestamp=' . strtotime(date('Y-m-d'))); ?>
	<?php echo link_tag('assets/css/style.css?timestamp=' . strtotime(date('Y-m-d'))); ?>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <div class="container">
        <?php $this->load->view($include);?>        
    </div>

<footer class="footer">
	<div class="container">
		<p>計実行時間:<?php echo $this->benchmark->elapsed_time();?> <span class="pipe">|</span> メモリ使用量：<?php echo $this->benchmark->memory_usage();?></p>
	</div>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<?php echo base_url();?>assets/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
