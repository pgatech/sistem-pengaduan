        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800"><?= $title ?></h1>
          <hr/>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="float-right">
                    <p>print</p>
                </div>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <?= $this->session->flashdata('message'); ?>
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Kategori</th>
                          <th>Isi Pengaduan</th>
                          <th>Tanggal</th>
                          <th>Gambar</th>
                          <th>Status</th>
                          <th>Aksi</th>
                      </tr>
                  </thead>
                  <tbody>
                      <?php $no=1; foreach ($data_pengaduan as $row) : ?>
                      <tr>
                        <td><?= $no; ?></td>
                        <td width="20%"><?= $row['nama_kategori']; ?></td>
                        <td width="40%"><?= $row['isi_pengaduan']; ?></td>
                        <td><?= $row['tanggal_pengaduan']; ?></td>
                        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target=".viewImage<?=$no;?>">Foto</button></td>
                        <!-- <td><img src="<?= base_url('/assets/upload/'); ?><?= $row['file']; ?> ?>" alt="" class="img-thumbnail"></td> -->
                        <td><?= $row['status']; ?></td>
                        <td>
                            <a href="<?= base_url('petugas/ambil/'.$row["id_pengaduan"]); ?>" class="btn btn-success">Ambil</a>
                        </td>
                    </tr>
                    <?php $no++;?>
                <?php endforeach; ?>
            </tbody>
        </table>
        
    </div>
</div>
</div>

</div>



<!-- modal Image -->
<?php  $i = 1;?>
<?php $no=1; foreach ($data_pengaduan as $row) : ?>
    <div class="modal fade viewImage<?=$i;?>" id="viewImage<?=$i;?>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
        <center><img width="70%" src="<?= base_url('/assets/upload/'); ?><?= $row['file']; ?> ?>" alt="" class="img-thumbnail"></center>
        </div>
    </div>
    </div>
    <?php $i++;?>
<?php endforeach; ?>