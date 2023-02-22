<!-- .modal for add task -->
<div class="modal fade" id="Add_Equ_asignado" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Agregar asignacion</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('Asignacion_equipo.create2') }}" method="POST"novalidate enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Empleado</label>
                                <select name="EMP_ID" id="" class="form-control">
                                    <option value="">-- Seleccione --</option>
                                    @foreach ($exc_emp as $list_emp)
                                    <option value="{{ $list_emp->EMP_ID }}">{{ $list_emp->EMP_NOMBRES }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Equipo</label>
                                <select name="EQU_ID" id="" class="form-control">
                                    <option value="">-- Seleccione --</option>
                                    @foreach ($exc_equ as $list_equ)
                                    <option value="{{ $list_equ->EQU_ID }}">{{ $list_equ->EQU_NOMBRE }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Fecha de entrega</label>
                        <input type="date" name="EAS_FECHA_ENTREGA" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Evidencia</label>
                        <input type="file" name="EAS_EVIDENCIA" class="form-control" >
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
