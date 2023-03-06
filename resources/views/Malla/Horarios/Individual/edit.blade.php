<!-- .modal for add task -->
<div class="modal fade" id="modal_edit" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editar horario</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('Individual.edit') }}" method="POST">
                    @csrf
                    <input type="hidden" id="EMP_ID" name="EMP_ID" value="{{ $list->EMP_ID }}">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Fecha a editar</label>
                                <input type="date" name="FECHA" id="FECHA" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-success" >Editar</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
