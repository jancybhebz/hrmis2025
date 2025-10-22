<?php
class Attendance_model extends CI_Model {
    public function get_all() {
            $this->db->select('a.*, u.name');
                    $this->db->from('attendance_log a');
                            $this->db->join('users u', 'a.user_id = u.id');
                                    $this->db->order_by('a.event_time', 'DESC');
                                            return $this->db->get()->result();
                                                }

                                                    public function create($data) {
                                                            return $this->db->insert('attendance_log', $data);
                                                                }

                                                                    public function filter($from, $to) {
                                                                            $this->db->select('u.name, COUNT(*) as total');
                                                                                    $this->db->from('attendance_log a');
                                                                                            $this->db->join('users u', 'a.user_id = u.id');
                                                                                                    $this->db->where('a.event_time >=', $from);
                                                                                                            $this->db->where('a.event_time <=', $to);
                                                                                                                    $this->db->group_by('u.id');
                                                                                                                            return $this->db->get()->result();
                                                                                                                                }
                                                                                                                                }