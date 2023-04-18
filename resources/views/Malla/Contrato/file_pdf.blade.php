<!doctype html>
<html lang="es">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body>
    <header>
        <!-- place navbar here -->
        <style>
            .background::before {
                content: "";
                position: absolute;
                background-image: url('img/fondo_contacta.jpg');
                background-size: 100% 100%;
                background-repeat: no-repeat;
                top: -50;
                left: -50;
                width: 120%;
                height: 112%;
                opacity: .4;
                z-index: -1;
            }

            .marging {
                padding: 0px 10vw;
            }

            .font-size-title {
                font-size: 1.8vh;
                font-weight: bold;
                text-align: center;
            }

            .font-text {
                font-size: 1.8vh;
                text-align: center;
                text-justify: inter-word;
            }

            .font-text-info {
                font-size: 1.8vh;
                text-align: justify;
                display: inline-block;
            }

            .font-style-new-romans {
                font-family: "Times New Roman";
            }
        </style>
    </header>
    <main class="font-style-new-romans lh-sm">
        @php
            setlocale(LC_TIME, 'es_ES');
        @endphp
        <div class="row background contenedor" style="">
            <br>
            <br>
            <br>
            <div class="row marging" style="margin-top: 15vh; margin-bottom: 8vh;">
                <p class="font-size-title">LA SUSCRITA DIRECTORA DE TALENTO HUMANO DE TECNOLOGÍAS Y
                    SERVICIOS CONTACTA S.A.S BIC NIT: 900.499.095-6</p>
            </div>
            <br>
            <div class="row marging font-size-title">
                <p>C E R T I F I C A:</p>
            </div>
            <br>
            <br>
            <div class="row marging" style="margin-bottom: 2vh;">
                <p class="font-text-info">Que, <strong>{{ $Nombre }}</strong>, titular
                    de la cédula ciudadanía número <strong>{{ $Cedula }}</strong> expedida en
                    <strong>{{ $Municipio }}({{ $Departamento }})</strong>,
                    @if ($Fecha_fin == null)
                        labora
                    @else
                        laboro
                    @endif en esta empresa, mediante un
                    contrato {{ $Tipo_contrato }} desde la fecha <strong>{{ $Fecha_inicio }}</strong>
                    @if ($Fecha_fin != null)
                        hasta la fecha
                        <strong>{{ $Fecha_fin }}</strong>
                        @endif, @if ($Val_salario == 1)
                            con un salario de {{ $Salario }}
                        @endif
                        desempeñando el cargo de
                        <strong>{{ $Cargo }}</strong>.
                </p>
            </div>

            <br>
            <br>

            @if ($Val_funciones == 1)
                <div class="row marging font-size-title " style="margin-bottom: 5vh;">
                    <p>F U N C I O N E S:</p>
                </div>

                <ol type=”A”>
                    @foreach ($Funciones_cargo as $fca)
                        <li>{{ $fca->CAF_NOMBRE }}</li>
                    @endforeach
                </ol>

                <ol type=”A”>
                    @foreach ($Funciones_contrato as $fco)
                        <li>{{ $fco->EMF_NOMBRE }}</li>
                    @endforeach
                </ol>
            @endif


            <div class="row marging">
                <p class="font-text">Se expide el presente, <?php echo strftime('%B %d'); ?> de <?php echo strftime('%Y'); ?>, en la ciudad de
                    Barranquilla, a solicitud del interesado.</p>
            </div>

            <br>
            <br>
            <br>
            <br>
            <br>
            <div class="row tex-center" style="text-align: center;">
                @if ($firma_foto[0]->PAR_VALOR == null)
                    <img src="'img/sin_firma.jpg'" width="200px" height="100px">
                @else
                    <img src="{{ $firma_foto[0]->PAR_VALOR }}" width="200px" height="100px">
                @endif
                @if ($firma_texto[0]->PAR_VALOR == null)
                    <p style="margin: -20; padding-left: -10">Director General</p>
                @else
                    <p style="margin: -20; padding-left: -10">{{ $firma_texto[0]->PAR_VALOR }}</p>

                @endif
            </div>
            <br>
            <div class="row">
                <p style="text-align: right;">Elaboro: {{ Auth::user()->name }}</p>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
    </main>
    <footer>
        <!-- place footer here -->
    </footer>
</body>

</html>
