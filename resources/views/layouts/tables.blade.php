<script>
    function ojito(){
        // Get the checkbox
        var checkBox = document.getElementById("check_fecha");
        // Get the output text
        var for_fecha = document.getElementById("for_fecha");
        var jornada = document.getElementById("jornada");

        // If the checkbox is checked, display the output for_fecha
        if (checkBox.checked == true){
            for_fecha.style.display = "";
            jornada.style.display = "none";
        } else {
            for_fecha.style.display = "none";
            jornada.style.display = "";
        }
    }

    $(document).ready( function () {
        $('#table_equipos').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
    $(document).ready( function () {
        $('#table_mantenimiento').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
    $(document).ready( function () {
        $('#table_hardware').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
    $(document).ready( function () {
        $('#table_software').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
    $(document).ready( function () {
        $('#table_mantenimiento_details').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
    $(document).ready( function () {
        $('#users').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
    $(document).ready( function () {
        $('#roles').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
    $(document).ready( function () {
        $('#table_change').DataTable({
            "language":{
                "url": "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json"
            }
        });
    } );
</script>
