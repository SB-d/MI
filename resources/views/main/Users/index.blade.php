@extends('layouts.main')


@section('main')

                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Usuarios</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Usuarios</li>

                        </ol>

                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#AddtUser"><i class="mdi mdi-plus-circle"></i> Agregar</button>
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
                                                                <th>Id</th>
                                                                <th>Nombre</th>
                                                                <th>Email</th>
                                                                <th>Rol</th>
                                                                <th>Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @foreach ($Users as $User)
                                                                <tr>
                                                                    <td>{{ $User->id }}</td>
                                                                    <td>{{ $User->name }}</td>
                                                                    <td>{{ $User->email }}</td>
                                                                    <td>
                                                                        @if(!empty($User->getRoleNames()))
                                                                            @foreach($User->getRoleNames() as $rolNombre)
                                                                            <span>{{ $rolNombre }}</span>
                                                                            @endforeach
                                                                        @endif
                                                                    </td>
                                                                    <td>
                                                                        <button class="btn float-right hidden-sm-down btn-success" data-toggle="modal" data-target="#editModal{{ $User->id }}"><i class="fas fa-edit"></i></button>
                                                                        {{-- <button type="button" class="btn btn-primary" rel="tooltip" data-toggle="modal" data-target="#EditUser{{ $User->id }}">
                                                                            <i class="fas fa-edit"></i>
                                                                        </button> --}}

                                                                        <div class="modal fade" id="editModal{{ $User->id }}" tabindex="-1"
                                                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h1 class="modal-tittle fs-5" id="exampleModalLebel">Editar Usuaruis</h1>
                                                                                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <form action="{{-- {{ route('Users.update', $User ->id )}} --}}" method="post">
                                                                                            @csrf @method('PUT')
                                                                                            <div class="form-group">
                                                                                                <label for="name">Nombre</label>
                                                                                                <input type="text" class="form-control"
                                                                                                name="name" value="{{ $User->name }}">
                                                                                            </div>
                                                                                            <div>
                                                                                                <label for="email">Email</label>
                                                                                                <input type="text" class="form-control"
                                                                                                name="email" value="{{ $User->email }}">
                                                                                            </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                                                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                                                                    </div>
                                                                                </form>
                                                                                </div>

                                                                            </div>

                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                @include('main.Users.edit')
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


                {{-- @include('Inventario.Equipo.create') --}}

@endsection
