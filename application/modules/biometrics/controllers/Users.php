<?php
class Users extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('User_model');
    }

    public function index() {
        $data['users'] = $this->User_model->get_all();
        $this->load->view('users/index', $data);
    }

    public function create() {
        if ($this->input->post()) {
            $data = [
                'employee_no' => $this->input->post('employee_no'),
                'name' => $this->input->post('name')
            ];
            $this->User_model->create($data);
            redirect('users');
        }
        $this->load->view('users/create');
    }
}
