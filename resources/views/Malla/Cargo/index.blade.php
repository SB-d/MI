@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Gestiones por cargos</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Gestiones por cargos</li>
                        </ol>
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_Cargo"><i class="mdi mdi-plus-circle"></i> Agregar</button>
                        {{-- <div class="dropdown float-right mr-2 hidden-sm-down">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> January 2019 </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> <a class="dropdown-item" href="#">February 2019</a> <a class="dropdown-item" href="#">March 2019</a> <a class="dropdown-item" href="#">April 2019</a> </div>
                        </div> --}}
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

                                <!-- column -->
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Responsive Table </h4>
                                                <div class="table-responsive">
                                                    <table class="table no-wrap">
                                                        <thead>
                                                            <tr>
                                                                <th>Invoice</th>
                                                                <th>User</th>
                                                                <th>Date</th>
                                                                <th>Amount</th>
                                                                <th>Status</th>
                                                                <th>Country</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><a href="javascript:void(0)">Order #26589</a></td>
                                                                <td>Herman Beck</td>
                                                                <td><span class="text-muted"><i class="far fa-clock"></i> Oct 16, 2019</span> </td>
                                                                <td>$45.00</td>
                                                                <td>
                                                                    <div class="label label-table label-success">Paid</div>
                                                                </td>
                                                                <td>EN</td>
                                                            </tr>
                                                            <tr>
                                                                <td><a href="javascript:void(0)">Order #58746</a></td>
                                                                <td>Mary Adams</td>
                                                                <td><span class="text-muted"><i class="far fa-clock"></i> Oct 12, 2019</span> </td>
                                                                <td>$245.30</td>
                                                                <td>
                                                                    <div class="label label-table label-danger">Shipped</div>
                                                                </td>
                                                                <td>CN</td>
                                                            </tr>
                                                            <tr>
                                                                <td><a href="javascript:void(0)">Order #98458</a></td>
                                                                <td>Caleb Richards</td>
                                                                <td><span class="text-muted"><i class="far fa-clock"></i> May 18, 2019</span> </td>
                                                                <td>$38.00</td>
                                                                <td>
                                                                    <div class="label label-table label-info">Shipped</div>
                                                                </td>
                                                                <td>AU</td>
                                                            </tr>
                                                            <tr>
                                                                <td><a href="javascript:void(0)">Order #32658</a></td>
                                                                <td>June Lane</td>
                                                                <td><span class="text-muted"><i class="far fa-clock"></i> Apr 28, 2019</span> </td>
                                                                <td>$77.99</td>
                                                                <td>
                                                                    <div class="label label-table label-success">Paid</div>
                                                                </td>
                                                                <td>FR</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <!-- column -->

                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->


                @include('Malla.Cargo.create')

@endsection
