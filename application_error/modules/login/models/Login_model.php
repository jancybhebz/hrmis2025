<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Login_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
		//$this->db->initialize();	
	}
	
	public function authenticate2($strUsername)
	{

		$this->db->select('tblempaccount.*, tblempposition.*, tblemppersonal.*');
		$this->db->from('tblempaccount');
		$this->db->join('tblempposition', 'tblempposition.empNumber = tblempaccount.empNumber', 'inner'); // Changed to INNER JOIN
		$this->db->join('tblemppersonal', 'tblemppersonal.empNumber = tblempaccount.empNumber', 'left');
		$this->db->where('tblempaccount.empNumber', $strUsername);
		$this->db->where('tblempposition.statusOfAppointment', 'In-Service');

		$query = $this->db->get();
		return $query->result_array(); // Returns an array of results
	}		

	public function authenticate($strUsername,$strPassword)
	{

		$this->db->select('tblempaccount.*,tblempposition.*,tblemppersonal.*');
		$this->db->join('tblempposition','tblempposition.empNumber=tblempaccount.empNumber','left');
		$this->db->join('tblemppersonal','tblemppersonal.empNumber=tblempaccount.empNumber','left');
		$rs = $this->db->get_where('tblempaccount', ['userName' => $strUsername, 'statusOfAppointment'=>'In-Service'])->result_array();


		if(count($rs) > 0):
			$strPass = $this->db->escape_str($rs[0]['userPassword']);
			$blnValid = password_verify($strPassword,$rs[0]['userPassword']);
			
			if(md5($strPassword) == $rs[0]['userPassword'] || $blnValid):
				return $rs;
			endif;
		endif;

		return array();
	}	
	
}
/* End of file login_model.php */
/* Location: ./application/modules/login/models/login_model.php */