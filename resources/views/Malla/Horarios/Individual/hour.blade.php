<!-- .modal for add task -->
<div class="modal fade" id="modal_hour" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Asignar horas</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('Individual.hour') }}" method="POST">
                    @csrf
                    <input type="hidden" value="{{ $list->EMP_ID }}" name="id_empleado">
                    <input type="hidden" id="USER_ID" name="USER_ID" value="{{ Auth::user()->id }}">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Cliente</label>
                                <select name="CLI_ID" id="CLI_ID2" class="form-control">
                                    <option class="form-control" selected disabled>-- Seleccione --</option>
                                    @foreach ($clientes as $cli)
                                        <option value="{{ $cli->CLI_ID }}">{{ $cli->CLI_NOMBRE }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Campañas</label>
                                <select name="CAM_ID" id="CAM_ID2" class="form-control">
                                    {{-- SELECT CAMPAÑA --}}
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Hora inicial</label>
                                <select name="HORA_INICIAL" id="HOR_ID2" class="form-control">
                                    <option value=""></option>
                                    @foreach ($horas as $hor)
                                        <option value="{{ $hor->HOR_ID }}">{{ $hor->HOR_INICIO }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Hora final</label>
                                <select name="HORA_FINAL" id="HOR_ID2" class="form-control">
                                    <option value=""></option>
                                    @foreach ($horas as $hor)
                                        <option value="{{ $hor->HOR_ID }}">{{ $hor->HOR_FINAL }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Fecha inicial</label>
                                <input type="date" class="form-control" name="FECHA_INICIAL" id="FECHA_INICIAL" required min=<?php $hoy = date('Y-m-d'); echo $hoy; ?>>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Fecha final</label>
                                <input type="date" class="form-control" name="FECHA_FINAL" id="FECHA_FINAL" required min=<?php $hoy = date('Y-m-d'); echo $hoy; ?>>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-success" >Guardar</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
