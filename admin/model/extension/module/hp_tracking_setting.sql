TRUNCATE TABLE `oc_order_status`;

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`)
VALUES
	(1, 2, 'Menuggu Pembayaran'),
	(1, 1, 'Waiting for Payment'),
	(2, 2, 'Diproses'),
	(2, 1, 'Processing'),
	(3, 1, 'Shipped'),
	(3, 2, 'Dikirim'),
	(5, 2, 'Selesai'),
	(5, 1, 'Completed'),
	(7, 2, 'Dibatalkan'),
	(7, 1, 'Cancelled'),
	(8, 2, 'Ditolak'),
	(8, 1, 'Denied'),
	(14, 2, 'Kadaluarsa'),
	(14, 1, 'Expired'),
	(17, 1, 'Paid'),
	(17, 2, 'Dibayar'),
	(18, 2, 'Diterima'),
	(18, 1, 'Delivered'),	
    (19, 2, 'Verifikasi Pembayaran'),
	(19, 1, 'Payment Verification');
