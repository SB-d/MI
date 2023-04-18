@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Funciones de contrato</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Funciones de contrato</li>
                        </ol>
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_Funciones"><i class="mdi mdi-plus-circle"></i> Agregar</button>
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
                                                <th>Nombre</th>
                                                <th>Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($funciones as $list)
                                                <tr>
                                                    <td>{{ $list->EMF_NOMBRE }}</td>
                                                    <td>

                                                        <form action="{{ route('Funcione.delete', $list->EMF_ID) }}" method="POST"
                                                            style="display: inline-block; ">
                                                            @csrf
                                                            @method('DELETE')

                                                            <button type="submit" class="btn float-right btn-danger" rel="tooltip" onclick="return confirm('Seguro que quiere eliminar este funcione?') ">
                                                                <i class="fas fa-trash-alt" title="Eliminar Registro"></i>
                                                            </button>

                                                        </form>

                                                        <button class="btn float-right hidden-sm-down btn-primary" data-toggle="modal" data-target="#EditFuncion{{ $list->EMF_ID }}"><i class="fas fa-edit"></i></button>


                                                        </button>


                                                    </td>
                                                </tr>
                                                @include('Malla.Funciones.edit')
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


                @include('Malla.Funciones.create')

@endsection
