<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DTR_Controller extends MY_Controller 
{
	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url'); 
		$this->load->database();
		$this->load->model('DTR_Model');
	}

	public function index()
	{
		$this -> load -> view('DTR_View');
	}

	// Controller for saving data
	// After fetching the needed data, the controller calls the model
	// Then returns a 200 status code after inserting
	public function saveData(){
		$code = $this->uri->segment(4);
		
		if($this->DTR_Model->checkExistData($code)){
			$this->DTR_Model->save($code);	
		}

		$this->DTR_Model->updateTime($code);

		echo json_encode(array(
			"statusCode"=>200,
			"statusSched"=>$this->DTR_Model->returnStatus()
		));
	}
}

?>