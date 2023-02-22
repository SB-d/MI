<!-- .modal for add task -->
<div class="modal fade" id="Edit_Equipo{{ $list->EQU_ID }}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editar equipo</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="" method="POST" action="{{ route('Equipo.update', $list->EQU_ID) }}" novalidate>
                    @csrf
                    @method('PUT')
                    <div class="col-md-12">
                        <label>Area</label>
                        <select name="ARE_ID" id="" class="form-control">
                            <option value="">-- Seleccione --</option>
                            @foreach ($area as $list_area)
                            <option value="{{ $list_area->ARE_ID }}">{{ $list_area->ARE_NOMBRE }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label for="EQU_SERIAL" class="form-label">Serial</label>
                        <input type="text" class="form-control" value="{{ $list->EQU_SERIAL }}" id="EQU_SERIAL" name="EQU_SERIAL" required>
                        <div class="invalid-feedback">Completa los datos</div>
                    </div>
                    <div class="col-md-12">
                        <label for="EQU_NOMBRE" class="form-label">Nombre</label>
                        <input type="text" class="form-control" value="{{ $list->EQU_NOMBRE }}" id="EQU_NOMBRE" name="EQU_NOMBRE" required>
                        <div class="invalid-feedback">Nombre de equipo</div>
                        <br>
                    </div>

                    <div class="col-md-12">
                        <label for="EQU_PRECIO" class="form-label">Precio</label>
                        <input type="number" class="form-control" value="{{ $list->EQU_PRECIO }}" id="EQU_PRECIO" name="EQU_PRECIO" required
                            pattern="[0-9]+">
                        <div class="invalid-feedback">Completa los datos</div>
                        <br>
                    </div>
                    <div class="col-md-12">
                        <label for="EQU_TIPO" class="form-label">Tipo equipo</label>
                        <select class="form-control" name="EQU_TIPO" id="EQU_TIPO">
                            <option value="" disabled>-- Seleccione --</option>
                            <option value="Propio" @if ($list->EQU_TIPO == 'Propio') selected @endif>Propio</option>
                            <option value="Alquilado" @if ($list->EQU_TIPO == 'Alquilado') selected @endif>Alquilado</option>
                        </select>
                        <div class="invalid-feedback">Completa los datos</div>
                        <br>
                    </div>
                    <div class="col-md-12">
                        <label for="CAR_NOMBRE" class="form-label">Observaciones</label>
                        <textarea class="form-control" value="{{ $list->EQU_OBSERVACIONES }}" name="EQU_OBSERVACIONES" id="EQU_OBSERVACIONES" cols="20" rows="5" ></textarea>
                        <div class="invalid-feedback">Completa los datos</div>
                        <br>
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
