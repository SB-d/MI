@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Tipos</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Tipos</li>

                        </ol>

                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_Hardware"><i class="mdi mdi-plus-circle"></i> Agregar</button>
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

                                                <div class="table-responsive">
                                                    <table class="table no-wrap display responsive nowrap" id="table_mantenimiento">
                                                        <thead>
                                                            <tr>
                                                                <th>Tipo</th>
                                                                <th>Descripción</th>
                                                                <th>Modelo</th>
                                                                <th>Serial</th>
                                                                <th>Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @foreach ($hardwares as $hardware)
                                                                <tr>
                                                                    <td>{{ $hardware->HAR_TIPO }}</td>
                                                                    <td>{{ $hardware->HAR_DESCRIPCION }}</td>
                                                                    <td>{{ $hardware->HAR_MODELO }}</td>
                                                                    <td>{{ $hardware->HAR_SERIAL }}</td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-primary" rel="tooltip" data-toggle="modal" data-target="#Edit_Hardware{{ $hardware->HAR_ID }}">
                                                                            <i class="fas fa-edit"></i>
                                                                        </button>

                                                                        <form action="{{ route('Hardware.delete', $hardware->HAR_ID) }}" method="POST"
                                                                            style="display: inline-block; ">
                                                                            @csrf
                                                                            @method('DELETE')

                                                                            <button type="submit" class="btn btn-danger" rel="tooltip"
                                                                                onclick="return confirm('Seguro que quiere eliminar este cargo?') ">
                                                                                <i class="fas fa-trash-alt" title="Eliminar Registro"></i>
                                                                            </button>

                                                                        </form>
                                                                        </td>
                                                                    </tr>
                                                                    @include('Inventario.Hardware.edit')
                                                                    </td>
                                                                </tr>
                                                            @endforeach
                                                        </tbody>
                                                    </table>
                                                </div>
                                <!-- column -->

                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->

                @include('Inventario.hardware.create')

@endsection
