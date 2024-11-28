<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ganti Password</title>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <style>
      /* Custom styles for the page */
      body {
        font-family: "Nunito", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        background-color: #f8f9fa;
      }
      .password-reset-container {
        max-width: 400px;
        width: 100%;
        padding: 2rem;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
      .password-reset-container h2 {
        text-align: center;
        margin-bottom: 1.5rem;
        font-weight: bold;
      }

      <style>
      /* Ubah warna border dan fokus input */
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

    </style>
  </head>
  <body>
    <div class="password-reset-container">
      <h2>Ganti Password</h2>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
        <div class="mb-3">
          <label for="email" class="form-label">Alamat Email</label>
          <input
            type="email"
            name="email"
            class="form-control"
            id="email"
            placeholder="Masukkan email Anda"
            required
          />
        </div>
        <button type="submit" class="btn btn-custom w-100 text-white">
          Kirim Link Ganti Password
        </button>
      </form>
      <p class="text-center mt-3">
        Kembali Ke
        <a href="https://gudangmaterials.id/index.php?route=affiliate/login"
          >Halaman Login</a
        >.
      </p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
