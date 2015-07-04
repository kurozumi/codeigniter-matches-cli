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
	
	public function get($id)
	{
		$this->db->where('id', $id);
		return $this->db->get('tabel');
	}
	
	public function add($data)
	{
		$this->db->insert('table', $data);
		return $this->db->insert_id();
	}
	
	public function update($data)
	{
		$id = $data['id'];
		unset($data['id']);
		$this->db->where('id', $id);
		return $this->db->update('table', $data);
	}
	
	public function delete($id)
	{
		return $this->db->delete('table', array('id' => $id));
	}
}

/* End of file '{{MODEL_FILE}}' */
/* Location: ./application/models/{{MODEL_FILE}} */
