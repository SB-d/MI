@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Empleados</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Empleados</li>
                        </ol>
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_Empleado"><i class="mdi mdi-plus-circle"></i> Agregar</button>
                        <button class="btn float-right mr-2 hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_ImpEmpleado"><i class="mdi mdi-file-excel"></i> Importar</button>
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
                                                <th>Opciones</th>
                                                <th>Codigo de empleado</th>
                                                <th>Documento</th>
                                                <th>Nombre completo</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($empleados as $list)
                                                <tr>
                                                    <td>

                                                         <form action="{{ route('Empleado.delete', $list->EMP_ID) }}" method="POST"
                                                            style="display: inline-block; ">
                                                            @csrf
                                                            @method('DELETE')

                                                            <button type="submit" class="btn btn-danger" rel="tooltip"
                                                                onclick="return confirm('Seguro que quiere eliminar este empleado?') ">
                                                                <i class="fas fa-trash-alt" title="Eliminar Registro"></i>
                                                            </button>

                                                        </form>

                                                        <button type="button" class="btn btn-primary" rel="tooltip" data-toggle="modal" data-target="#Edit_Empleado{{ $list->EMP_ID }}">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        {{--
                                                        <a type="button" class="btn btn-primary" href="{{ route('empleado.contratos.index', $list->EMP_ID) }}"><i
                                                                class="fas fa-file-alt"></i></a> --}}

                                                    </td>
                                                    <td>{{ $list->EMP_CODE }}</td>
                                                    <td>{{ $list->EMP_CEDULA }}</td>
                                                    <td>{{ $list->EMP_NOMBRES }}</td>
                                                    <td>{{ $list->CAM_NOMBRE }}</td>
                                                </tr>
                                                @include('Malla.Empleado.edit')
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


                @include('Malla.Empleado.create')
                @include('Malla.Empleado.importar')


                <script src="{{ asset('js/select_municipio.js') }}"></script>

@endsection
