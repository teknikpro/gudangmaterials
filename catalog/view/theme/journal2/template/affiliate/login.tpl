<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Form Login</title>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <style>
      /* Ubah warna border dan fokus input */

      body {
      font-family: "Nunito", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    }

      .form-control:focus {
        border-color: #db0f24;
        box-shadow: 0 0 0 0.2rem rgba(219, 15, 36, 0.25);
      }
      /* Ubah warna tombol */
      .btn-custom {
        background-color: #db0f24;
        border-color: #db0f24;
      }
      .btn-custom:hover {
        background-color: #a50b1b;
        border-color: #a50b1b;
      }
      /* Mengatur posisi ikon mata di sebelah kanan input */
      .input-group-text {
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="container my-5">
      <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
          <h2 class="text-center mb-4">Form Login</h2>

          <?php if ($success) { ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <?php echo $success; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php } ?>
            <?php if ($error_warning) { ?>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
              <?php echo $error_warning; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php } ?>

          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" name="email" value="<?php echo $email; ?>" class="form-control" id="email" required />
            </div>

            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <div class="input-group">
                <input
                  type="password"
                  name="password" 
                  value="<?php echo $password; ?>"
                  class="form-control"
                  id="password"
                  required
                />
                <span
                  class="input-group-text"
                  id="showPassword"
                  onclick="togglePassword()"
                >
                  <i class="bi bi-eye"></i>
                </span>
              </div>
            </div>

            <!-- Tombol Submit -->
            <div class="d-grid">
              <button type="submit" class="btn btn-custom text-white">
                Login
              </button>
            </div>
          </form>

          <!-- Link Login -->
          <p class="text-center mt-3">
            Belum memiliki akun?
            <a
              href="https://gudangmaterials.id/index.php?route=affiliate/register"
              >Registrasi melalui tautan berikut</a
            >.
          </p>
          <p class="text-center mt-3">
            Lupa Password?
            <a
              href="https://gudangmaterials.id/index.php?route=affiliate/forgotten"
              >Ganti Password melalui tautan berikut</a
            >.
          </p>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
      // Fungsi untuk toggle visibility password
      function togglePassword() {
        var passwordField = document.getElementById("password");
        var icon = document.getElementById("showPassword").querySelector("i");
        if (passwordField.type === "password") {
          passwordField.type = "text";
          icon.classList.remove("bi-eye");
          icon.classList.add("bi-eye-slash");
        } else {
          passwordField.type = "password";
          icon.classList.remove("bi-eye-slash");
          icon.classList.add("bi-eye");
        }
      }
    </script>
  </body>
</html>
