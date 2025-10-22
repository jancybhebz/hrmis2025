<?php
class User_model extends CI_Model {
    public function get_all() {
            return $this->db->get('users')->result();
                }

                    public function get($id) {
                            return $this->db->get_where('users', ['id' => $id])->row();
                                }

                                    public function create($data) {
                                            $this->db->insert('users', $data);
                                                    return $this->db->insert_id();
                                                        }

                                                            public function update($id, $data) {
                                                                    return $this->db->where('id', $id)->update('users', $data);
                                                                        }
                                                                        }