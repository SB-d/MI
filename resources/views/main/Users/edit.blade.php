<!-- .modal for add task -->
<div class="modal fade" id="EditUser{{ $User->id }}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editar usuario</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{-- {{ route('Uni_cli.update', $list->UNC_ID) }} --}}" method="POST" name="form-data" novalidate>
                    @csrf
                    @method('PUT')
                    <input type="hidden"name="USER_ID" value="{{ Auth::user()->id }}">
                    <div class="form-group">
                        <label>Unidad de negocio</label>
                        <select name="UNI_ID" id="UNI_ID" class="form-control">
                            <option class="form-control" disabled>-- Seleccione --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Cliente</label>
                        <select name="CLI_ID" id="CLI_ID" class="form-control">
                            <option class="form-control" disabled >-- Seleccione --</option>
                        </select>
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
