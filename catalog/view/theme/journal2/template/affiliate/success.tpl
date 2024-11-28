<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Logout Successful</title>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
    />
    <style>
      body {
        font-family: "Nunito", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        background-color: #f8f9fa;
      }
      .logout-container {
        text-align: center;
        padding: 2rem;
        border-radius: 0.5rem;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
        max-width: 600px;
      }
      .logout-icon {
        font-size: 4rem;
        color: #db0f24;
      }

      .btn-custom {
        background-color: #db0f24;
        border-color: #db0f24;
      }
      .btn-custom:hover {
        background-color: #a50b1b;
        border-color: #a50b1b;
      }
      .logout-message {
        font-size: 1.25rem;
        color: #6c757d;
        margin-top: 0.5rem;
        margin-bottom: 1.5rem;
      }
      .btn-back-home {
        font-size: 1rem;
        padding: 0.75rem 1.5rem;
        color: #fff;
      }
    </style>
  </head>
  <body>
    <div class="logout-container">
      <div class="logout-icon">
        <i class="bi bi-check-circle-fill"></i>
      </div>
      <h1>Pendaftaran Berhasil!</h1>
      <p class="logout-message">Selamat! Akun Anda telah berhasil dibuat. untuk saat ini akun ada belum bisa digunakan, tunggu verifikasi dari Team Gudang Material. Kami akan mengirimkan informasinya melalui email.</p>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
