<?php

namespace App\Http\Controllers\Malla;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use \Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\cliente;

class ClientesController extends Controller
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
        $clientes = cliente::where('CLI_ESTADO', '=','1')->get();
        return view('Malla.Cliente.index', compact('clientes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(request $request)
    {
        //
        $request->validate([
            'CLI_NOMBRE' => 'required|unique:clientes',
            'CLI_CODE' => 'required|unique:clientes'
        ]);

        $datosCliente = request()->except('_token');
        cliente::insert($datosCliente);

        return redirect()->back()->with('rgcmessage', 'Client cargado con exito!...');
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
        $datosCliente = request()->except(['_token','_method']);
        cliente::where('CLI_ID','=', $id)->update($datosCliente);


        Session::flash('msjupdate', '¡El Cliente se a actualizado correctamente!...');
        return redirect()->back();
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
        /* cliente::where('CLI_ID', $id)->delete(); */
        cliente::where('CLI_ID', $id)->update(['CLI_ESTADO' => '0']);
        return redirect()->back()->with('msjdelete', 'Client borrado correctamente!...');
    }
}
