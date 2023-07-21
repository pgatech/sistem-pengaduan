<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-lg-6">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg">
                            <div class="p-5">
                                <div class="text-center">
                                    <img src="assets/upload/satpol-pp-logo.jpg" alt="Logo Satpol" width="180" height="auto">
                                    <h1 class="h4 text-gray-900 mb-4">Sistem Layanan Pengaduan Masyarakat Satpol PP Garut</h1>
                                </div>
                                <?= $this->session->flashdata('message'); ?>
                                <form method="post" action="<?= base_url('auth'); ?>">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="email" name="email" placeholder="Enter Email Address.." value="<?= set_value('email'); ?>">
                                        <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group ">
                                        <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password">
                                        <?= form_error('password', '<small class="text-danger pl-3">', '</small>');
                                        ?>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Masuk
                                        </button>
                                    </div>
                                    <div class="form-group">
                                        <span><a class="small float-left" href="<?= base_url('auth/daftar'); ?>"> Belum punya akun ? </a></span>
                                    </div>
                                </form>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>