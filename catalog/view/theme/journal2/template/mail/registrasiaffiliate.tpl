<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Reset Styles */
        body,
        html {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        table {
            border-spacing: 0;
            width: 100%;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        /* Container Styles */
        .email-container {
            max-width: 600px;
            margin: auto;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Header Styles */
        .header {
            background-color: #851c1c;
            padding: 20px;
            text-align: center;
            color: #ffffff;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        /* Body Styles */
        .content {
            padding: 20px;
        }

        .content h2 {
            color: #333333;
        }

        .content p {
            color: #555555;
            line-height: 1.6;
        }

        .content a {
            color: #851c1c;
            text-decoration: none;
            font-weight: bold;
        }

        .content .button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #851c1c;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        /* Footer Styles */
        .footer {
            background-color: #f1f1f1;
            padding: 10px;
            text-align: center;
            font-size: 12px;
            color: #888888;
        }

        .footer a {
            color: #4CAF50;
            text-decoration: none;
        }

        /* Responsive Styles */
        @media (max-width: 600px) {
            .content {
                padding: 15px;
            }

            .header h1 {
                font-size: 20px;
            }
        }
    </style>
</head>

<body>
    <table class="email-container">
        <!-- Header -->
        <tr>
            <td class="header">
                <h1>Pendaftaran Affiliate</h1>
            </td>
        </tr>

        <!-- Body -->
        <tr>
            <td class="content">
                <h2>Halo Admin!</h2>
                <p>Jajang Maulanan baru mendaftar sebagai affiliate, tolong untuk segera di verifikasi ya!</p>
                <a href="https://gudangmaterials.id/index.php?route=adminaffiliate/afiliator" class="button">Verifikasi Sekarang</a>
            </td>
        </tr>

        <!-- Footer -->
        <tr>
            <td class="footer">
                <p>&copy; 2024 gudangmaterials.id. All rights reserved.</p>
            </td>
        </tr>
    </table>
</body>

</html>