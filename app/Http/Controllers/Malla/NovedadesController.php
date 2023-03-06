<?php

namespace App\Http\Controllers\Malla;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use \Illuminate\Support\Facades\Auth;

class NovedadesController extends Controller
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
        $sql = "SELECT mal.MAL_INICIO, tin.TIN_NOMBRE, emp.EMP_NOMBRES, nov.NOV_FECHA, usu.name
        FROM novedades AS nov
        LEFT JOIN mallas AS mal ON mal.MAL_ID = nov.MAL_ID
        LEFT JOIN tipos_novedades AS tin ON tin.TIN_ID = nov.TIN_ID
        LEFT JOIN empleados AS emp ON emp.EMP_ID = nov.EMP_ID
        LEFT JOIN users AS usu ON usu.id = nov.USER_ID";

        $novedades = DB::select($sql);
        return view('Malla.Novedades.index', compact('novedades'));
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
