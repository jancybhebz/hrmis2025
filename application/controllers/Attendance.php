<?php
class Attendance extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('Attendance_model');
    }

    public function index() {
        $data['logs'] = $this->Attendance_model->get_all();
        $this->load->view('attendance/index', $data);
    }

    public function reports() {
        if ($this->input->get('from') && $this->input->get('to')) {
            $from = $this->input->get('from');
            $to = $this->input->get('to');
            $data['report'] = $this->Attendance_model->filter($from, $to);
        }
        $this->load->view('attendance/reports', $data ?? []);
    }
}
