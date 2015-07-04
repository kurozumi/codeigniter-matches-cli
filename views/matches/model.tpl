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
		return $this->db->get('{{MODEL}}');
	}
	
	public function add($data)
	{
		$fields = $this->db->list_fields('{{MODEL}}');

		foreach($data as $key => $value)
		{
			if(!in_array($key, $fields))
				unset($data[$key]);
		}

		$this->db->insert('{{MODEL}}', $data);
		return $this->db->insert_id();
	}
	
	public function update($data)
	{
		$id = $data['id'];
		unset($data['id']);
		$this->db->where('id', $id);
		return $this->db->update('{{MODEL}}', $data);
	}
	
	public function delete($id)
	{
		return $this->db->delete('{{MODEL}}', array('id' => $id));
	}
}

/* End of file '{{MODEL_FILE}}' */
/* Location: ./application/models/{{MODEL_FILE}} */
