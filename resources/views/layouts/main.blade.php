<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from www.wrappixel.com/demos/admin-templates/monster-admin/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Feb 2019 11:35:37 GMT -->

<!-- Mirrored from www.wrappixel.com/demos/admin-templates/monster-admin/main/layout-fix-header-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Feb 2019 11:36:58 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('../assets/images/favicon.png') }}">
    <title>MI</title>
    <!-- Bootstrap Core CSS -->
    <link href="{{ asset('../assets/plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <!-- Calendar CSS -->
    <link href="{{ asset('../assets/plugins/calendar/dist/fullcalendar.css') }}" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="{{ asset('css/colors/blue.css') }}" id="theme" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css">

    <!-- ====================== NOTIFICACION ====================== -->
    <!-- toast CSS -->
    <link href="../assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- ====================== NOTIFICACION ====================== -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar card-no-border">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2"
                stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->

        @include('layouts.navbar')

        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->

        @include('layouts.sidebar')

        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                @yield('main')
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                © 2019 Monster Admin by wrappixel.com
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script data-cfasync="false" src="{{ asset('../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js') }}"></script><script src="{{ asset('../assets/plugins/jquery/jquery.min.js') }}"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="{{ asset('../assets/plugins/bootstrap/js/popper.min.js') }}"></script>
    <script src="{{ asset('../assets/plugins/bootstrap/js/bootstrap.min.js') }}"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="{{ asset('js/jquery.slimscroll.js') }}"></script>
    <!--Wave Effects -->
    <script src="{{ asset('js/waves.js') }}"></script>
    <!--Menu sidebar -->
    <script src="{{ asset('js/sidebarmenu.js') }}"></script>
    <!--stickey kit -->
    <script src="{{ asset('../assets/plugins/sticky-kit-master/dist/sticky-kit.min.js') }}"></script>
    <!--Custom JavaScript -->
    <script src="{{ asset('js/custom.min.js') }}"></script>
    <!-- Calendar JavaScript -->
    <script src="{{ asset('../assets/plugins/calendar/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('../assets/plugins/moment/moment.js') }}"></script>
    <script src='{{ asset('../assets/plugins/calendar/dist/fullcalendar.min.js') }}'></script>
    <script src="{{ asset('../assets/plugins/calendar/dist/cal-init.js') }}"></script>
    <!-- ====================== TABLE ====================== -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
    <!-- ====================== NOTIFICACION ====================== -->
    <script src="{{ asset('../assets/plugins/toast-master/js/jquery.toast.js') }}"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="{{ asset('../assets/plugins/styleswitcher/jQuery.style.switcher.js') }}"></script>


    {{-- NOTIFICACIONES --}}

    @include('layouts.msj')
    @include('layouts.tables')
</body>


<!-- Mirrored from www.wrappixel.com/demos/admin-templates/monster-admin/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 11 Feb 2019 11:35:42 GMT -->

</html>
