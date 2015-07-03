<?php  if(!defined('BASEPATH')) exit('No direct script access allowed');

class {{MODEL}}_model extends {{MO_EXTENDS}}_Model
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function get_all()
	{
		return ('This is your first application');
	}
	
	public function get($id){}
	
	puhlic function add($data){}
	
	public function update($data){}
	
	public function delete($id){}
}

/* End of file '{{MODEL_FILE}}' */
/* Location: ./application/models/{{MODEL_FILE}} */
