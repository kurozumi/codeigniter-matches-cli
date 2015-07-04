<div class="page-header">
	<h1>title</h1>
</div>

<?php if(isset($message) && !empty($message)):?>
<div class="alert alert-danger">
    <?php echo $message;?>
</div>
<?php endif;?>

<?php echo form_open();?>
<div class="form-group">
	<?php echo form_error('element'); ?>
	<?php echo form_label('element');?>
	<?php echo form_input('element', '', 'class="form-control"');?>
</div>
<p><?php echo form_submit('submit', 'submit', 'class="btn btn-primary"');?></p>
<?php echo form_close();?>