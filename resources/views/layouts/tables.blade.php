<script>
    function ojito(){
        // Get the checkbox
        var checkBox = document.getElementById("check_fecha");
        // Get the output text
        var text = document.getElementById("for_fecha");

        // If the checkbox is checked, display the output text
        if (checkBox.checked == true){
            text.style.display = "";
        } else {
            text.style.display = "none";
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
