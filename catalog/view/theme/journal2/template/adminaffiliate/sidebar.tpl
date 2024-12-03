<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

<!-- Sidebar - Brand -->
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
    <div class="sidebar-brand-text mx-3">GDM Affiliate </div>
</a>

<!-- Divider -->
<hr class="sidebar-divider my-0">

<li class="nav-item active">
    <a class="nav-link" href="<?php echo (isset($this->request->get['route']) && $this->request->get['route'] == 'adminaffiliate/dashboard') ? 'active' : ''; ?>">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>Dashboard</span></a>
</li>

<li class="nav-item">
    <a class="nav-link" href="affiliator.html">
        <i class="fas fa-users"></i>
        <span>Affiliator</span></a>
</li>

<li class="nav-item">
    <a class="nav-link" href="tarikdana.html">
        <i class="fas fa-wallet"></i>
        <span>Pengajuan Tarik Dana</span></a>
</li>

<li class="nav-item">
    <a class="nav-link" href="transaksi.html">
        <i class="fas fa-exchange-alt"></i>
        <span>Transaksi</span></a>
</li>

<!-- Divider -->
<hr class="sidebar-divider d-none d-md-block">

<!-- Sidebar Toggler (Sidebar) -->
<div class="text-center d-none d-md-inline">
    <button class="rounded-circle border-0" id="sidebarToggle"></button>
</div>

</ul>
<!-- End of Sidebar -->

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content">

    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>
