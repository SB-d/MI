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
                                <div class="table-responsive">
                                    <table class="table no-wrap display responsive nowrap" id="table_equipos">
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Nombre</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($cargos as $list)
                                                            <tr>
                                                                <td>{{ $list->CAR_CODE }}</td>
                                                                <td>{{ $list->CAR_NOMBRE }}</td>
                                                                <td>

                                                                     <form action="{{ route('Cargo.delete', $list->CAR_ID) }}" method="POST"
                                                                        style="display: inline-block; ">
                                                                        @csrf
                                                                        @method('DELETE')

                                                                        <button type="submit" class="btn btn-danger" rel="tooltip"
                                                                            onclick="return confirm('Seguro que quiere eliminar este cargo?') ">
                                                                            <i class="fas fa-trash-alt" title="Eliminar Registro"></i>
                                                                        </button>

                                                                    </form>
                                                                    <button type="button" class="btn btn-primary" rel="tooltip" data-toggle="modal" data-target="#EditCargo{{ $list->CAR_ID }}">
                                                                        <i class="fas fa-edit"></i>
                                                                    </button>
{{--
                                                                    <a class="btn btn-primary" href="{{ route('funcione.index', $list->CAR_ID) }}">
                                                                        <i class="fas fa-people-carry"></i>
                                                                        <span>Funciones</span></a>--}}

                                                                </td>
                                                            </tr>
                                                            @include('Malla.Cargo.edit')
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


                @include('Malla.Cargo.create')

@endsection
