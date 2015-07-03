<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class {{CONTROLLER}} extends {{C_EXTENDS}}_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->helper(array('url', 'html'));

		$this->load->model('{{MV}}_model', 'model');
	}
	
	public function index()
	{
		$data['content'] = $this->model->get_all();
		$this->_render_page('{{MV}}_view', $data);
	}
		
	public function get($id)
	{
		$id = intval($id);
		
		if($id!=0)
		{
			$data['content'] = $this->model->get($id);
			$this->_render_page('{{MV}}_view', $data);
		}
		else
		{
			redirect(site_url(), 'refresh');
		}
	}
	
	public function add()
	{
		$this->form_validation->set_rules('element','Element label','trim|required');
		if($this->form_validation->run()===FALSE)
		{
			$data['input_element'] = array('name'=>'element', 'id'=>'element', 'value'=>set_value('element'));
			$this->_render_page('{{MV}}_view', $data);
		}
		else
		{
			$field = $this->input->post('element');

			if($this->model->add(array('field_name'=>$field)))
			{
				$this->_render_page('{{MV}}_success_page_view');
			}
			else
			{
				$this->_render_page('{{MV}}_error_page_view');
			}
		}
	}
	
	public function edit()
	{
		$this->form_validation->set_rules('element','Element label','trim|required');
		$this->form_validation->set_rules('id','ID','trim|is_natural_no_zero|required');
		
		if($this->form_validation->run()===FALSE)
		{
			if(!$this->input->post())
			{
				$id = intval($this->uri->segment($this->uri->total_segments()));
			}
			else
			{
				$id = set_value('id');
			}
			
			$data['input_element'] = array('name'=>'element', 'id'=>'element', 'value'=>set_value('element'));
			$data['hidden'] = array('id'=>set_value('id',$id));
			$this->_render_page('{{MV}}_view', $data);
		}
		else
		{
			$element = $this->input->post('element');
			$id = $this->input->post('id');

			if($this->model->update(array('element'=>$element),array('id'=>$id)))
			{
				$this->_render_page('{{MV}}_success_page_view');
			}
			else
			{
				$this->_render_page('{{MV}}_error_page_view');
			}
		}
	}
	public function delete($id)
	{
		$id = intval($id);
		
		if($id!=0)
		{
			$data['content'] = $this->model->delete();
			$this->_render_page('{{MV}}_view', $data);
		}
		else
		{
			redirect(site_url(), 'refresh');
		}
	}

	private function _render_page($view, $data=null, $render=false)
	{
		$this->viewdata = (empty($data)) ? $this->data: $data;
		$this->viewdata['include'] = $view;

		$view_html = $this->load->view('template', $this->viewdata, $render);

		if (!$render) return $view_html;
	}
}

/* End of file '{{CONTROLLER_FILE}}' */
/* Location: ./application/controllers/{{CONTROLLER_FILE}}.php */
