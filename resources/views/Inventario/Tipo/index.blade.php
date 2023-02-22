@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Tipos</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Tipos</li>

                        </ol>

                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_Tipo"><i class="mdi mdi-plus-circle"></i> Agregar</button>
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
                                                                <th>Nombre</th>
                                                                <th>Descripción</th>
                                                                <th>Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @foreach ($tipo_mantenimientos as $tipo_mantenimiento)
                                                                <tr>
                                                                    <td>{{ $tipo_mantenimiento->TIP_TIPO }}</td>
                                                                    <td>{{ $tipo_mantenimiento->TIP_NOMBRE }}</td>
                                                                    <td>{{ $tipo_mantenimiento->TIP_DESCRIPCION }}</td>
                                                                    <td>
                                                                        <button type="button" class="btn btn-primary" rel="tooltip" data-toggle="modal" data-target="#Edit_TIPO{{ $tipo_mantenimiento->TIP_ID }}">
                                                                            <i class="fas fa-edit"></i>
                                                                        </button>

                                                                        <form action="{{ route('Tipo.delete', $tipo_mantenimiento->TIP_ID) }}" method="POST"
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
                                                                    @include('Inventario.Tipo.edit')
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

                @include('Inventario.Tipo.create')

@endsection
