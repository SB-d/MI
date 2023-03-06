@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Horario individual</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Horario individual</li>
                        </ol>
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        {{--<button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#Add_Cargo"><i class="mdi mdi-plus-circle"></i> Agregar</button>
                         <div class="dropdown float-right mr-2 hidden-sm-down">
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
                                                <th>Cliente</th>
                                                <th>Campaña</th>
                                                <th>Hora inicial</th>
                                                <th>Hora final</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($emp_horario as $list)
                                                <tr>

                                                    <td>{{ $list->CLI_NOMBRE }}</td>
                                                    <td>{{ $list->CAM_NOMBRE }}</td>
                                                    <td>{{ $list->MAL_INICIO }}</td>
                                                    <td>{{ $list->MAL_FINAL }}</td>

                                                    <td>
                                                        @if ($list->MAL_ESTADO == 1)

                                                            <button type="button" class="btn btn-danger" rel="tooltip" data-toggle="modal" data-target="#modal_novedad">
                                                                <i class="fas fa-calendar-times"></i> Desactivar
                                                            </button>

                                                            @include('Malla.Horarios.Individual.novedad')

                                                            @can('delete-malla')
                                                                <form action="{{ route('Malla.delete', $list->MAL_ID) }}" method="POST"
                                                                    style="display: inline-block; ">
                                                                    @csrf
                                                                    @method('DELETE')
                                                                    <input type="number" class="form-control" id="USER_ID" name="USER_ID"
                                                                        value="{{ Auth::user()->id }}"required pattern="[0-9]+"
                                                                        style="display: none;">
                                                                    <input type="text" value="{{ $list->MAL_ID }}" name="MAL_ID" id="MAL_ID"
                                                                        style="display: none">
                                                                    <input type="text" value="{{ $MAL_DIA }}" name="MAL_DIA" id="MAL_DIA"
                                                                        style="display: none">
                                                                    <input type="text" value="{{ $EMP_ID }}" name="EMP_ID" id="EMP_ID"
                                                                        style="display: none">
                                                                    <input type="text" value="1" name="MAL_ESTADO" style="display: none">
                                                                    <button type="submit" class="btn btn-danger" rel="tooltip">
                                                                        <i class="fas fa-trash-alt" title="Eliminar Registro"></i>
                                                                    </button>
                                                                </form>
                                                            @endcan
                                                        @else
                                                            <form action="{{ route('Individual.delete_time_status', $list->MAL_ID) }}"
                                                                method="POST" style="display: inline-block; ">
                                                                @csrf
                                                                @method('PUT')
                                                                <input type="number" class="form-control" id="USER_ID" name="USER_ID"
                                                                    value="{{ Auth::user()->id }}"required pattern="[0-9]+"
                                                                    style="display: none;">
                                                                <input type="text" value="{{ $list->MAL_ID }}" name="MAL_ID" id="MAL_ID"
                                                                    style="display: none">
                                                                <input type="text" value="{{ $MAL_DIA }}" name="MAL_DIA" id="MAL_DIA"
                                                                    style="display: none">
                                                                <input type="text" value="{{ $EMP_ID }}" name="EMP_ID" id="EMP_ID"
                                                                    style="display: none">
                                                                <input type="text" value="1" name="MAL_ESTADO" style="display: none">
                                                                <button type="submit" class="btn btn-success" rel="tooltip">
                                                                    <i class="far fa-calendar-plus"></i> Activar
                                                                </button>
                                                            </form>
                                                        @endif


                                                        <button type="button" class="btn btn-primary" style="color:white" onclick="llenarmodal({{ $list->MAL_ID }})" rel="tooltip" data-toggle="modal" data-target="#edit_campana">
                                                            <i class="fas fa-edit"></i>
                                                        </button>

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



@endsection
