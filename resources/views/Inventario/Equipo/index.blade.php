@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Equipos</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Equipos</li>

                        </ol>

                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_Equipos"><i class="mdi mdi-plus-circle"></i> Agregar</button>
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
                                                                <th>Serial</th>
                                                                <th>Area</th>
                                                                <th>Precio</th>
                                                                <th>Tipo</th>
                                                                <th>Observaciones</th>
                                                                <th>Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @foreach ($equipos as $list)
                                                                <tr>
                                                                    <td>{{ $list->EQU_NOMBRE }}</td>
                                                                    <td>{{ $list->EQU_SERIAL }}</td>
                                                                    <td>{{ $list->EQU_AREA }}</td>
                                                                    <td>{{ $list->EQU_PRECIO }}</td>
                                                                    <td>{{ $list->EQU_TIPO }}</td>
                                                                    <td>{{ $list->EQU_OBSERVACIONES }}</td>
                                                                    <td>
                                                                        <a href="{{ route('Equipo.details',$list->EQU_ID) }}" class="btn btn-success"><i class="fas fa-eye"></i></a>

                                                                    <button type="button" class="btn btn-primary" rel="tooltip" data-toggle="modal" data-target="#Edit_Equipo{{ $list->EQU_ID }}">
                                                                        <i class="fas fa-edit"></i>
                                                                    </button>

                                                                    <form action="{{ route('Equipo.delete', $list->EQU_ID) }}" method="POST"
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
                                                                @include('Inventario.Equipo.edit')
                                                            @endforeach
                                                            {{-- <tr>
                                                                <td><a href="javascript:void(0)">Order #26589</a></td>
                                                                <td>Herman Beck</td>
                                                                <td><span class="text-muted"><i class="far fa-clock"></i> Oct 16, 2019</span> </td>
                                                                <td>$45.00</td>
                                                                <td>
                                                                    <div class="label label-table label-success">Paid</div>
                                                                </td>
                                                                <td>EN</td>
                                                            </tr> --}}

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


                @include('Inventario.Equipo.create')

@endsection
