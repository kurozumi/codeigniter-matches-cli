<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class {{CONTROLLER}} extends {{C_EXTENDS}}_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->helper(array('form', 'url', 'html'));

		$this->load->model('{{MV}}_model', 'model');
		
		$this->load->library('form_validation');
	}
	
	public function index()
	{
		$data['content'] = $this->model->get_all();
		$this->_render_page('{{MV}}', $data);
	}
		
	public function view($id)
	{
		if($data = $this->model->get(intval($id)))
		{
			$data['content'] = $data;
			$this->_render_page('{{MV}}', $data);		
		}else{
			show_404();
		}
	}
	
	public function add()
	{
		$this->form_validation->set_rules('element','Element','trim|required');
		
		if($this->form_validation->run() === FALSE)
		{
			$this->_render_page('{{MV}}/add');
		}
		else
		{
			$data = $this->input->post();

			if($this->model->add($data))
			{
				$this->session->set_flashdata('message', 'add.');
			}
			else
			{
				$this->session->set_flashdata('message', 'enabled to add.');
			}
			
			redirect(site_url('{{MV}}'), 'refresh');
		}
	}
	
	public function edit()
	{
		$this->form_validation->set_rules('element','Element','trim|required');
		$this->form_validation->set_rules('id','ID','trim|is_natural_no_zero|required');
		
		if($this->form_validation->run() === FALSE)
		{
			$id = (!$this->input->post()) ? 
				intval($this->uri->segment($this->uri->total_segments())) :set_value('id');
			
			if(!($data['input'] = $this->model->get($id)))
			{
				show_404();
			}
						
			$this->_render_page('{{MV}}/edit', $data);
		}
		else
		{
			$element = $this->input->post('element');
			$id      = $this->input->post('id');

			if($this->model->update(array('element' => $element), array('id' => $id)))
			{
				$this->session->set_flashdata('message', 'edited.');
			}
			else
			{
				$this->session->set_flashdata('message', 'unabled to edited.');
			}
			
			redirect(site_url('{{MV}}/edit'), 'refresh');
		}
	}
	
	public function delete($id)
	{
		if($id = $this->input->post('id'))
		{
			$this->model->delete(intval($id));
			$this->session->set_flashdata('message', 'deleted.');
		}
		else
		{
			$this->session->set_flashdata('message', 'unabled to delete.');
		}

		redirect(site_url('{{MV}}'), 'refresh');
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
