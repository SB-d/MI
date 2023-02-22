<?php

namespace App\Http\Controllers\Inventario;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Models\equipo;
use App\Models\equ_asignado;
use App\Models\empleado;
use App\Models\area;
use Illuminate\Support\Facades\Storage;

class Equ_asignadoController extends Controller
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

        $sql="SELECT e.EMP_NOMBRES, pc.EQU_NOMBRE, pc.EQU_SERIAL, EAS_FECHA_ENTREGA, EAS_EVIDENCIA
        FROM equ_asignados AS eq
        INNER JOIN empleados AS e ON e.EMP_ID = eq.EMP_ID
        INNER JOIN equipos AS pc ON pc.EQU_ID = eq.EQU_ID
        WHERE eq.EAS_ESTADO = 1";

        $sql2="SELECT EMP_ID, EMP_NOMBRES FROM `empleados` WHERE EMP_ID NOT IN (SELECT EMP_ID FROM `equ_asignados` WHERE `EAS_ESTADO` = 1);";

        $sql3="SELECT EQU_ID, EQU_NOMBRE FROM `equipos` WHERE EQU_ID NOT IN (SELECT EQU_ID FROM `equ_asignados` WHERE `EAS_ESTADO` = 1);";

        $total = equipo::count();

        $equipos = equipo::where('EQU_ESTADO', '=','1')->get();

        $empleado = empleado::where('EMP_ESTADO', '=','1')->get();

        $equ_asignado = DB::select($sql);
        $exc_emp = DB::select($sql2);
        $exc_equ = DB::select($sql3);
        /* dd($equ_asignado); */
        return view('Inventario.Asignacion_equipo.index', compact('equ_asignado','empleado','equipos','exc_emp','exc_equ'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
       /*  $datosEquAsignado = request()->except('_token');

        dd($datosEquAsignado);

        if($request->hasFile('EAS_EVIDENCIA')){
            $datosEquAsignado['EAS_EVIDENCIA']=$request->file('EAS_EVIDENCIA')->store('uploads','public');
        }

        equ_asignado::insert($datosEquAsignado);
        return response()->json($datosEquAsignado);
        return redirect()->route('Inventario.Asignacion_equipo.index')->with('rgcmessage', 'Asignacion cargada con exito!...');
 */
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

        $datosEquAsignado = request()->except('_token');

        /* dd($datosEquAsignado); */

        if($request->hasFile('EAS_EVIDENCIA')){
            $datosEquAsignado['EAS_EVIDENCIA']=$request->file('EAS_EVIDENCIA')->store('uploads','public');
        }

        equ_asignado::insert($datosEquAsignado);
        /* return response()->json($datosEquAsignado); */
        return redirect()->route('Asignacion_equipo.index')->with('rgcmessage', 'Asignacion cargada con exito!...');
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
    public function edit($id)
    {
        //
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
}
