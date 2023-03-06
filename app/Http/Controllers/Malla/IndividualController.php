<?php

namespace App\Http\Controllers\Malla;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use \Illuminate\Support\Facades\Auth;

use App\Models\campana;
use App\Models\cliente;
use App\Models\unidad_negocio;
use App\Models\uni_cli;
use App\Models\malla;
use App\Models\jornada;
use App\Models\empleado;
use App\Models\novedade;
use App\Models\tipos_novedade;

class IndividualController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        //
        $sql = "SELECT EMP_ID, EMP_NOMBRES, EMP_CEDULA FROM empleados WHERE EMP_ESTADO = 1";

        $empleados = DB::select($sql);

        return view('Malla.Horarios.Individual.index', compact('empleados'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(request $request)
    {
        //
        $MAL_DIA = $request->FECHA;
        $empleado = empleado::where('EMP_ID', $request->EMP_ID)->get();
        $EMP_ID = $empleado[0]->EMP_ID;

        $sql = 'SELECT mal.MAL_ID, cli.CLI_ID, cli.CLI_NOMBRE, mal.CAM_ID,
        cam.CAM_NOMBRE, mal.EMP_ID, mal.MAL_INICIO, mal.MAL_FINAL, mal.MAL_ESTADO
        FROM mallas AS mal
        INNER JOIN campanas AS cam ON cam.CAM_ID = mal.CAM_ID
        INNER JOIN uni_clis AS unc ON unc.UNC_ID = cam.UNC_ID
        INNER JOIN clientes AS cli on cli.CLI_ID = unc.CLI_ID
        INNER JOIN unidad_negocios AS uni on uni.UNI_ID = unc.UNI_ID
        WHERE mal.MAL_DIA = "'.$MAL_DIA.'"
        AND EMP_ID = '.$request->EMP_ID;
        $emp_horario = DB::select($sql);

        $clientes = cliente::where('CLI_ESTADO', '=', '1')->get();
        $tipos_novedades = tipos_novedade::where('TIN_ESTADO', '=', '1')->where('TIN_TIPO', '=', '0')->get();

        if($emp_horario == null){
            Session::flash('warmessage', '¡El empleado no tiene horario asignado en esta fecha!...');
            return redirect()->back();
        }else{
            return view('Malla.Horarios.Individual.editar_horario', compact('tipos_novedades','emp_horario','clientes','empleado', 'MAL_DIA','EMP_ID'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function time_status(request $request, $id) {

        $novedad = new novedade();
        $novedad->MAL_ID = $id;
        $novedad->TIN_ID = $request->TIN_ID;
        $novedad->EMP_ID = $request->EMP_ID;
        $novedad->NOV_FECHA = $request->MAL_DIA;
        $novedad->USER_ID = $request->USER_ID;
        $novedad->save();

        malla::where('MAL_ID', $id)->update(['MAL_ESTADO' => $request->MAL_ESTADO]);

        $MAL_DIA = $request->MAL_DIA;
        $empleado = empleado::where('EMP_ID', $request->EMP_ID)->get();
        $EMP_ID = $empleado[0]->EMP_ID;

        $sql = 'SELECT mal.MAL_ID, cli.CLI_ID, cli.CLI_NOMBRE, mal.CAM_ID,
        cam.CAM_NOMBRE, mal.EMP_ID, mal.MAL_INICIO, mal.MAL_FINAL, mal.MAL_ESTADO
        FROM mallas AS mal
        INNER JOIN campanas AS cam ON cam.CAM_ID = mal.CAM_ID
        INNER JOIN uni_clis AS unc ON unc.UNC_ID = cam.UNC_ID
        INNER JOIN clientes AS cli on cli.CLI_ID = unc.CLI_ID
        INNER JOIN unidad_negocios AS uni on uni.UNI_ID = unc.UNI_ID
        WHERE mal.MAL_DIA = "'.$MAL_DIA.'"
        AND EMP_ID = '.$request->EMP_ID;
        $emp_horario = DB::select($sql);

        $tipos_novedades = tipos_novedade::where('TIN_ESTADO', '=', '1')->where('TIN_TIPO', '=', '0')->get();

        $clientes = cliente::all();

        return view('Malla.Horarios.Individual.editar_horario', compact('tipos_novedades','emp_horario','clientes','empleado', 'MAL_DIA','EMP_ID'));
    }

    public function delete_time_status(request $request, $id){

        malla::where('MAL_ID', $id)->update(['MAL_ESTADO' => $request->MAL_ESTADO]);

        novedade::where('MAL_ID', $id)->delete();

        $MAL_DIA = $request->MAL_DIA;
        $empleado = empleado::where('EMP_ID', $request->EMP_ID)->get();
        $EMP_ID = $empleado[0]->EMP_ID;

        $sql = 'SELECT mal.MAL_ID, cli.CLI_ID, cli.CLI_NOMBRE, mal.CAM_ID,
        cam.CAM_NOMBRE, mal.EMP_ID, mal.MAL_INICIO, mal.MAL_FINAL, mal.MAL_ESTADO
        FROM mallas AS mal
        INNER JOIN campanas AS cam ON cam.CAM_ID = mal.CAM_ID
        INNER JOIN uni_clis AS unc ON unc.UNC_ID = cam.UNC_ID
        INNER JOIN clientes AS cli on cli.CLI_ID = unc.CLI_ID
        INNER JOIN unidad_negocios AS uni on uni.UNI_ID = unc.UNI_ID
        WHERE mal.MAL_DIA = "'.$MAL_DIA.'"
        AND EMP_ID = '.$request->EMP_ID;
        $emp_horario = DB::select($sql);

        $tipos_novedades = tipos_novedade::where('TIN_ESTADO', '=', '1')->where('TIN_TIPO', '=', '0')->get();

        $clientes = cliente::all();

        return view('Malla.Horarios.Individual.editar_horario', compact('tipos_novedades','emp_horario','clientes','empleado', 'MAL_DIA','EMP_ID'));
    }

    public function employee($id){

        $campanas = campana::where('CAM_ESTADO', '=', '1')->get();
        $uni_negocios = unidad_negocio::where('UNI_ESTADO', '=', '1')->get();
        $clientes = cliente::where('CLI_ESTADO', '=', '1')->get();
        $jornadas = jornada::where('JOR_ESTADO', '=', '1')->get();

        $sql1 = "SELECT unc.UNC_ID, uni.UNI_ID, uni.UNI_NOMBRE, cli.CLI_ID, cli.CLI_NOMBRE
        FROM uni_clis AS unc
        INNER JOIN clientes AS cli ON cli.CLI_ID = unc.CLI_ID
        INNER JOIN unidad_negocios AS uni ON uni.UNI_ID = unc.UNI_ID
        WHERE unc.UNC_ESTADO = 1
        AND cli.CLI_ESTADO = 1
        AND uni.UNI_ESTADO = 1";

        $uni_clis = DB::select($sql1);

        $sql = "SELECT e.EMP_ID, e.EMP_NOMBRES, e.EMP_CEDULA, c.CAR_NOMBRE FROM empleados e
        INNER JOIN cargos c WHERE c.CAR_ID = e.CAR_ID AND e.EMP_ID =".$id;

        $empleado = DB::select($sql);

        $sql = "SELECT HOR_ID,HOR_INICIO,HOR_FINAL FROM horas WHERE HOR_ESTADO = 1";

        $horas = DB::select($sql);

        return view('Malla.Horarios.Individual.employee_hours', compact('horas','empleado','campanas','uni_negocios','clientes', 'uni_clis', 'jornadas'));
    }

    public function hour(request $request){

        //TRAER EL REGISTRO DE LA HORA INICIAL
        $sql2 = "SELECT hor.HOR_ID, hor.HOR_INICIO, hor.HOR_FINAL
        FROM horas AS hor
        WHERE hor.HOR_ID = ".$request->HORA_INICIAL;

        $JORInicio = DB::select($sql2);

        //TRAER EL REGISTRO DE LA HORA FINAL
        $sql3 = "SELECT hor.HOR_ID, hor.HOR_INICIO, hor.HOR_FINAL
        FROM horas AS hor
        WHERE hor.HOR_ID = ".$request->HORA_FINAL;

        $JORFinal = DB::select($sql3);

        //BUSCAR CADA HORA Y CREAR LOS EVENTOS PARA INSERTAR EN LA TABLA EVENTO
        $eventos = [];
        $FECHA_INICIAL = strtotime($request->FECHA_INICIAL);
        $FECHA_FINAL = strtotime($request->FECHA_FINAL);
        $DIA_INICIAL =  date("d", $FECHA_INICIAL);
        $DIA_FINAL =  date("d", $FECHA_FINAL);
        $FECHA = $request->FECHA_INICIAL;

        $MES_INICIAL =  date("m", $FECHA_INICIAL);
        $MES_FINAL =  date("m", $FECHA_FINAL);

        if(intval($MES_INICIAL) != intval($MES_FINAL)){
            return redirect()->back()->with('warmessage', 'Solo puede agendar en un mes a la vez!...');
        }

        if(intval($DIA_INICIAL) > intval($DIA_FINAL)){
            return redirect()->back()->with('warmessage', 'La fecha inicial es mayor que la final!...');
        }

        for ($i2 = intval($DIA_INICIAL); $i2 < intval($DIA_FINAL)+1; $i2++) {
            //BUSCAR CADA HORA Y CREAR LOS EVENTOS PARA INSERTAR EN LA TABLA EVENTO PARA CADA EMPLEADO
            for ($i = intval($JORInicio[0]->HOR_ID); $i < intval($JORFinal[0]->HOR_ID)+1; $i++) {

                $sql4 = "SELECT hor.HOR_ID, hor.HOR_INICIO, hor.HOR_FINAL
                FROM horas AS hor
                WHERE hor.HOR_ID = ".$i;

                $evento = DB::select($sql4);

                $eventos[] = array(
                    "CAM_ID" => $request->CAM_ID,
                    "MAL_DIA" => $FECHA,
                    "MAL_INICIO" => $FECHA." ".$evento[0]->HOR_INICIO,
                    "MAL_FINAL" => $FECHA." ".$evento[0]->HOR_FINAL,
                    "EMP_ID" => $request->id_empleado,
                    "USER_ID" => $request->USER_ID
                );

            }

            //VERIFICAR SI EXISTE EL REGISTRO, ACTUALIZAR SI EXISTE O INSERTAR SI NO EXISTE
            for ($i = 0; $i < count($eventos); $i++) {

                $malla[] = array(
                    "CAM_ID" => $eventos[$i]["CAM_ID"],
                    "MAL_DIA" => $eventos[$i]["MAL_DIA"],
                    "MAL_INICIO" => $eventos[$i]["MAL_INICIO"],
                    "MAL_FINAL" => $eventos[$i]["MAL_FINAL"],
                    "EMP_ID" => $eventos[$i]["EMP_ID"],
                    "USER_ID" => $eventos[$i]["USER_ID"]
                );

                $sqlvalidador = 'SELECT * FROM mallas WHERE EMP_ID = '.$eventos[$i]["EMP_ID"].' AND MAL_DIA = "'.$eventos[$i]["MAL_DIA"].'" AND MAL_INICIO = "'.$eventos[$i]["MAL_INICIO"].'" AND MAL_FINAL = "'.$eventos[$i]["MAL_FINAL"].'"';

                $validador = DB::select($sqlvalidador);

                if(count($validador) == 0){
                    malla::insert($malla);
                }else{
                    malla::where('MAL_ID','=', $validador[0]->MAL_ID)->update($malla[0]);
                }
                $malla = Array();
            }
            $FECHA = date("Y-m-d",strtotime($FECHA."+ 1 days"));
        }
        /* return view('Supervisor.malla_individual.asignarmalla', compact('horas','campanas', 'MAL_DIA', 'EMP_ID')); */
        return redirect()->back()->with('rgcmessage', 'Hora individual cargada con exito!...');
    }

    public function working_day(request $request){

        //TRAER EL REGISTRO DE LA HORA INICIAL DE LA JORNADA
        $sql2 = "SELECT hor.HOR_ID, hor.HOR_INICIO, hor.HOR_FINAL
        FROM jornadas AS jor
        INNER JOIN horas AS hor ON hor.HOR_ID = jor.JOR_INICIO
        WHERE jor.JOR_ID = ".$request->JOR_ID;

        $JORInicio = DB::select($sql2);

        //TRAER EL REGISTRO DE LA HORA FINAL DE LA JORNADA
        $sql3 = "SELECT hor.HOR_ID, hor.HOR_INICIO, hor.HOR_FINAL
        FROM jornadas AS jor
        INNER JOIN horas AS hor ON hor.HOR_ID = jor.JOR_FINAL
        WHERE jor.JOR_ID = ".$request->JOR_ID;

        $JORFinal = DB::select($sql3);

        //BUSCAR CADA HORA Y CREAR LOS EVENTOS PARA INSERTAR EN LA TABLA EVENTO
        $eventos = [];
        $FECHA_INICIAL = strtotime($request->FECHA_INICIAL);
        $FECHA_FINAL = strtotime($request->FECHA_FINAL);
        $DIA_INICIAL =  date("d", $FECHA_INICIAL);
        $DIA_FINAL =  date("d", $FECHA_FINAL);
        $FECHA = $request->FECHA_INICIAL;

        $MES_INICIAL =  date("m", $FECHA_INICIAL);
        $MES_FINAL =  date("m", $FECHA_FINAL);

        if(intval($MES_INICIAL) != intval($MES_FINAL)){
            return redirect()->back()->with('warmessage', 'Solo puede agendar en un mes a la vez!...');
        }

        if(intval($DIA_INICIAL) > intval($DIA_FINAL)){
            return redirect()->back()->with('warmessage', 'La fecha inicial es mayor que la final!...');
        }

        for ($i2 = intval($DIA_INICIAL); $i2 < intval($DIA_FINAL)+1; $i2++) {
            //BUSCAR CADA HORA Y CREAR LOS EVENTOS PARA INSERTAR EN LA TABLA EVENTO PARA CADA EMPLEADO
            for ($i = intval($JORInicio[0]->HOR_ID); $i < intval($JORFinal[0]->HOR_ID)+1; $i++) {

                $sql4 = "SELECT hor.HOR_ID, hor.HOR_INICIO, hor.HOR_FINAL
                FROM horas AS hor
                WHERE hor.HOR_ID = ".$i;

                $evento = DB::select($sql4);

                $eventos[] = array(
                    "CAM_ID" => $request->CAM_ID,
                    "MAL_DIA" => $FECHA,
                    "MAL_INICIO" => $FECHA." ".$evento[0]->HOR_INICIO,
                    "MAL_FINAL" => $FECHA." ".$evento[0]->HOR_FINAL,
                    "EMP_ID" => $request->id_empleado,
                    "USER_ID" => $request->USER_ID
                );

            }

            //VERIFICAR SI EXISTE EL REGISTRO, ACTUALIZAR SI EXISTE O INSERTAR SI NO EXISTE
            for ($i = 0; $i < count($eventos); $i++) {

                $malla[] = array(
                    "CAM_ID" => $eventos[$i]["CAM_ID"],
                    "MAL_DIA" => $eventos[$i]["MAL_DIA"],
                    "MAL_INICIO" => $eventos[$i]["MAL_INICIO"],
                    "MAL_FINAL" => $eventos[$i]["MAL_FINAL"],
                    "EMP_ID" => $eventos[$i]["EMP_ID"],
                    "USER_ID" => $eventos[$i]["USER_ID"]
                );

                $sqlvalidador = 'SELECT * FROM mallas WHERE EMP_ID = '.$eventos[$i]["EMP_ID"].' AND MAL_DIA = "'.$eventos[$i]["MAL_DIA"].'" AND MAL_INICIO = "'.$eventos[$i]["MAL_INICIO"].'" AND MAL_FINAL = "'.$eventos[$i]["MAL_FINAL"].'"';

                $validador = DB::select($sqlvalidador);

                if(count($validador) == 0){
                    malla::insert($malla);
                }else{
                    malla::where('MAL_ID','=', $validador[0]->MAL_ID)->update($malla[0]);
                }
                $malla = Array();
            }
            $FECHA = date("Y-m-d",strtotime($FECHA."+ 1 days"));
        }
        /* return view('Supervisor.malla_individual.asignarmalla', compact('horas','campanas', 'MAL_DIA', 'EMP_ID')); */
        return redirect()->back()->with('rgcmessage', 'Jornada individual cargada con exito!...');
    }

}
