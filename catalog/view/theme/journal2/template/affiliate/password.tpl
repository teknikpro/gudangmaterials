<?= $header; ?>

<div class="container-fluid">
            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4" >
              <h1 class="h3 mb-0 text-gray-800">Ganti Password</h1>
            </div>

            <!-- Form Ganti Password -->
            <div class="row justify-content-center">
              <div class="col-lg-6">
                <div class="card shadow mb-4">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold color-custom">
                      Form Ganti Password
                    </h6>
                  </div>
                  <div class="card-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="changePasswordForm">

                      <!-- Password Baru -->
                      <div class="form-group">
                        <label for="newPassword">Password Baru</label>
                        <input
                          type="password"
                          name="password"
                          value="<?php echo $password; ?>" 
                          class="form-control"
                          id="newPassword"
                          placeholder="Masukkan Password Baru"
                          required
                        />
                        <?php if ($error_password) { ?>
                        <div class="text-danger"><?php echo $error_password; ?></div>
                        <?php } ?>
                      </div>

                      <!-- Konfirmasi Password Baru -->
                      <div class="form-group">
                        <label for="confirmPassword"
                          >Konfirmasi Password Baru</label
                        >
                        <input
                          type="password"
                          name="confirm"
                          value="<?php echo $confirm; ?>"
                          class="form-control"
                          id="confirmPassword"
                          placeholder="Konfirmasi Password Baru"
                          required
                        />
                        <?php if ($error_confirm) { ?>
                        <div class="text-danger"><?php echo $error_confirm; ?></div>
                        <?php } ?>
                        <small
                          id="passwordHelp"
                          class="form-text text-danger"
                          style="display: none"
                        >
                          Password baru dan konfirmasi password tidak cocok.
                        </small>
                      </div>

                      <!-- Tombol Submit -->
                      <button type="submit" class="btn button-custom btn-block">
                        Ganti Password
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const newPasswordInput = document.getElementById('newPassword');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordHelp = document.getElementById('passwordHelp');
    const submitButton = document.querySelector('button[type="submit"]');

    function validatePassword() {
      if (confirmPasswordInput.value !== newPasswordInput.value) {
        passwordHelp.style.display = 'block';
        submitButton.disabled = true;
      } else {
        passwordHelp.style.display = 'none';
        submitButton.disabled = false;
      }
    }

    newPasswordInput.addEventListener('input', validatePassword);
    confirmPasswordInput.addEventListener('input', validatePassword);

    submitButton.disabled = true;
  });
</script>



<?= $footer; ?>