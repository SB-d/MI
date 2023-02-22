<aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-small-cap">  GESTION</li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-account-settings-variant"></i><span class="hide-menu">Administracion {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="{{ route('Roles.index') }}">Gestionar roles</a></li>
                                <li><a href="{{ route('Users.index') }}">Gestionar usuarios</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-account-convert"></i><span class="hide-menu">Recursos humanos {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="{{ route('Cargo.index') }}">Gestiones por cargos</a></li>
                                <li><a href="{{ route('Empleado.index') }}">Gestionar empleados</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-calculator"></i><span class="hide-menu">Contabilidad {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="{{ route('Unidad_Negocio.index') }}">Gestionar unidades de negocio</a></li>
                                <li><a href="{{ route('Cliente.index') }}">Gestionar clientes</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="fas fa-cogs"></i><span class="hide-menu"> Operaciones {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="{{ route('Jornada.index') }}">Gestionar jornadas</a></li>
                                <li><a href="{{ route('Campana.index') }}">Gestionar campañas</a></li>
                                <li><a href="{{ route('Contrato.index') }}">Gestionar relación de campañas</a></li>
                            </ul>
                        </li>
                        <li class="nav-devider"></li>
                        <li>
                            <a href="{{ route('Agente.index') }}" aria-expanded="false"><i class="mdi mdi-calendar-today"></i><span class="hide-menu">Mi horario {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li class="nav-devider"></li>
                        <li class="nav-small-cap">  HORARIOS</li>
                        <li>
                            <a href="{{ route('Individual.index') }}" aria-expanded="false"><i class="mdi mdi-calendar"></i><span class="hide-menu">Horario individual {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li>
                            <a href="{{ route('Grupal.index') }}" aria-expanded="false"><i class="mdi mdi-calendar-multiple"></i><span class="hide-menu">Horario grupal {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li>
                            <a href="{{ route('Selectiva.index') }}" aria-expanded="false"><i class="mdi mdi-calendar-range"></i><span class="hide-menu">Horario selectivo {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li>
                            <a href="#4" aria-expanded="false"><i class="mdi mdi-calendar-text"></i><span class="hide-menu">Consultar horario {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li class="nav-devider"></li>
                        <li class="nav-small-cap">  INVENTARIO</li>
                        <li>
                            <a href="{{ route('Equipo.index') }}" aria-expanded="false"><i class="mdi mdi-cellphone-link"></i><span class="hide-menu">Equipos {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li>
                            <a href="{{ route('Asignacion_equipo.index') }}" aria-expanded="false"><i class="mdi mdi-account-plus"></i><span class="hide-menu">Asignacion de equipos {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li>
                            <a href="{{ route('Mantenimiento.index') }}" aria-expanded="false"><i class="mdi mdi-wrench"></i><span class="hide-menu">Mantenimientos {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-plus-circle-multiple-outline"></i><span class="hide-menu">Adicionales {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="{{ route('Tipo.index') }}">Tipos de mantenimientos</a></li>
                                <li><a href="{{ route('Hardware.index') }}">Hardwares</a></li>
                                <li><a href="{{ route('Software.index') }}">Softwares</a></li>
                                <li><a href="{{ route('Tecnico.index') }}">Técnicos</a></li>
                            </ul>
                        </li>
                        <li class="nav-devider"></li>
                        <li class="nav-small-cap">  ANALISIS</li>
                        <li>
                            <a href="{{ route('Reporte.index') }}" aria-expanded="false"><i class="mdi mdi-file-chart"></i><span class="hide-menu">Reportes {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>
                        <li>
                            <a href="{{ route('Novedades.index') }}" aria-expanded="false"><i class="mdi mdi-file-chart"></i><span class="hide-menu">Novedades {{-- <span class="label label-rounded label-success">5</span> --}}</span></a>
                        </li>






                        {{-- <li class="nav-small-cap">FORMS, TABLE &amp; WIDGETS</li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-file"></i><span class="hide-menu">Forms</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="form-basic.html">Basic Forms</a></li>
                                <li><a href="form-layout.html">Form Layouts</a></li>
                                <li><a href="form-addons.html">Form Addons</a></li>
                                <li><a href="form-material.html">Form Material</a></li>
                                <li><a href="form-float-input.html">Floating Lable</a></li>
                                <li><a href="form-pickers.html">Form Pickers</a></li>
                                <li><a href="form-upload.html">File Upload</a></li>
                                <li><a href="form-mask.html">Form Mask</a></li>
                                <li><a href="form-validation.html">Form Validation</a></li>
                                <li><a href="form-bootstrap-validation.html">Form Bootstrap Validation</a></li>
                                <li><a href="form-dropzone.html">File Dropzone</a></li>
                                <li><a href="form-icheck.html">Icheck control</a></li>
                                <li><a href="form-img-cropper.html">Image Cropper</a></li>
                                <li><a href="form-bootstrapwysihtml5.html">HTML5 Editor</a></li>
                                <li><a href="form-typehead.html">Form Typehead</a></li>
                                <li><a href="form-wizard.html">Form Wizard</a></li>
                                <li><a href="form-xeditable.html">Xeditable Editor</a></li>
                                <li><a href="form-summernote.html">Summernote Editor</a></li>
                                <li><a href="form-tinymce.html">Tinymce Editor</a></li>
                            </ul>
                        </li> --}}
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
            <!-- Bottom points-->
            {{-- <div class="sidebar-footer">
                <!-- item-->
                <a href="#" class="link" data-toggle="tooltip" title="Settings"><i class="ti-settings"></i></a>
                <!-- item-->
                <a href="#" class="link" data-toggle="tooltip" title="Email"><i class="mdi mdi-gmail"></i></a>
                <!-- item-->
                <a href="#" class="link" data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a>
            </div> --}}
            <!-- End Bottom points-->
        </aside>
