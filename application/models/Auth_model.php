<?php
class Auth_model extends CI_Model
{
    

    public function get_user_terakhir()
    {
        $this->db->select_max('ID_LOGIN');
        return $this->db->get('login')->row();
    }
    
    public function get_ubah_password($id)
    {
        return $this->db->get_where('login', ['id_login' => $id])->row_array();
    }

    public function ubah_password($id,$password)
    {
        $this->db->set('password', $password);
        $this->db->where('id_login', $id);
        $this->db->update('login');
    }

    public function tambah_user($data)
    {
        $this->db->insert('login', $data);
    }

    public function getNamaUser($idUser,$level)
    {   
        if($level == 'petugas')
        {
        return $this->db->get_where('petugas', ['id_login' => $idUser])->row_array();
        }
        else if($level == 'masyarakat')
        {
        return $this->db->get_where('masyarakat', ['id_login' => $idUser])->row_array();
        }
        else{
            $admin = "admin";
            return $admin;
        }
    }
    
}
