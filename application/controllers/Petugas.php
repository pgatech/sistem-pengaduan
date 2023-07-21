<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Petugas extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->library('form_validation');
        $this->load->model('Petugas_model');
        $this->load->model('Auth_model');
    }
    public function index()
    {
        $data['level'] = $this->session->userdata('level');
        $data['title'] = "List Data Pengaduan";
        $data['data_pengaduan'] = $this->Petugas_model->get_data_pengaduan();
        $idUser = $this->session->userdata('id');
        $data['levelUser'] = $this->session->userdata('level');
        $data['namaUser'] = $this->Auth_model->getNamaUser($idUser,$data['levelUser']);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('templates/topbar', $data);
        $this->load->view('petugas/index', $data);
        $this->load->view('templates/footer');
    }

    public function ambil(){
        $id = $this->session->userdata('id');
        $id_pengaduan = $this->uri->segment(3);
        $petugas = $this->Petugas_model->get_petugas_id($id);
        $data = [
            'status' => 'proses'
        ];
        $this->Petugas_model->update_status($id_pengaduan,$data);

        if($this->db->affected_rows() > 0)
        {
            $data = [
                'id_pengaduan'  => $id_pengaduan,
                'id_petugas'    =>  $petugas['id_petugas'],
                'foto'          => "default.jpg"
            ];
            $this->Petugas_model->simpan_tanggapan($data);
            $this->session->set_flashdata('message', '<div class="alert alert-success  alert-dismissible fade show" role="alert"> Anda berhasil mengajukan untuk mengisi tanggapan.<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button></div>');
            redirect('petugas/list');
        }
    }

    public function list(){
        $data['level'] = $this->session->userdata('level');
        $data['title'] = "My List Tanggapan";
        $id = $this->session->userdata('id');
        $petugas = $this->Petugas_model->get_petugas_id($id);
        $data['data_pengaduan'] = $this->Petugas_model->get_data_pengaduan_by_id($petugas['id_petugas']);
        $idUser = $this->session->userdata('id');
        $data['levelUser'] = $this->session->userdata('level');
        $data['namaUser'] = $this->Auth_model->getNamaUser($idUser,$data['levelUser']);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('templates/topbar', $data);
        $this->load->view('petugas/list', $data);
        $this->load->view('templates/footer');
    }

    public function tanggapan(){
        $this->form_validation->set_rules('tanggapan', 'Tanggapan', 'trim|required');
        if ($this->form_validation->run() == false) {
            $data['level'] = $this->session->userdata('level');
            $data['title'] = "Form Tanggapan";
            $id = $this->uri->segment(3);
            $data['tanggapan'] = $this->Petugas_model->get_data_tanggapan_by_id($id);
            $idUser = $this->session->userdata('id');
            $data['levelUser'] = $this->session->userdata('level');
            $data['namaUser'] = $this->Auth_model->getNamaUser($idUser,$data['levelUser']);

            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar');
            $this->load->view('templates/topbar', $data);
            $this->load->view('petugas/form', $data);
            $this->load->view('templates/footer');
        }else{
            $id = $this->uri->segment(3);
            $this->_tanggapan($id);
        }
    }

    private function _tanggapan(){
        $config['upload_path']          = './assets/upload/tanggapan/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['file_name']            = time();
        $config['overwrite']            = true;
        $config['max_size']             = 1024;

        $this->load->library('upload', $config);
        $id = $this->uri->segment(3);
        if ($this->upload->do_upload('attachment')) {
            $foto =  $this->upload->data("file_name");
        }
        else{
            $this->session->set_flashdata('message', '<div class="alert alert-danger  alert-dismissible fade show" role="alert">Tanggapan anda tidak di proses, harap mengisi form dengan benar.<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button></div>');
            redirect ('petugas/tanggapan/'.$id);
            // $foto = "default.jpg";
        }
        print_r($this->upload->display_errors());


        $data = [
            'tanggal_tanggapan' => date("Y/m/d"),
            'isi_tanggapan' => $this->input->post('tanggapan', TRUE),
            'foto'          => $foto
        ];
        $id = $this->input->post('id_tanggapan', TRUE);
        $id_pengaduan = $this->input->post('id_pengaduan', TRUE);
        $this->Petugas_model->update_tanggapan($id,$data);
        
        // update di tabel pengaduan menjadi selesai
        if($this->db->affected_rows() > 0){
            $data = [
                'status' => 'selesai'
            ];
            $this->Petugas_model->update_status($id_pengaduan,$data);
        }
        $this->session->set_flashdata('message', '<div class="alert alert-success  alert-dismissible fade show" role="alert">Anda berhasil memberi tanggapan.<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button></div>');
        redirect('petugas/list');
    }

}
