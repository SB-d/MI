<?php

use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// -----------------------------------      GENERAL      -----------------------------------


//GENERAL :: USUARIOS
Route::get('/Users', [App\Http\Controllers\Main\UserController::class, 'index'])->name('Users.index');

//GENERAL :: ROLES

Route::resource('Roles', App\Http\Controllers\Main\RolController::class);
/* Route::get('/Roles', [App\Http\Controllers\Main\RolController::class, 'index'])->name('Roles.index');
Route::patch('/Roles/update/{id}', [App\Http\Controllers\Main\RolController::class, 'update'])->name('Roles.update');
Route::post('/Roles/store', [App\Http\Controllers\Main\RolController::class, 'store'])->name('Roles.store'); */


// -----------------------------------      MALLA      -----------------------------------

//MALLA :: AJAX SELECTS
Route::get('/mallagrupal/select/cam', [App\Http\Controllers\Malla\SelectController::class, 'mallagrupal_select'])->name('select.malla.grupal');
Route::get('/select/cli', [App\Http\Controllers\Malla\SelectController::class, 'Cli_cam'])->name('select.campana');
Route::get('/select/mun', [App\Http\Controllers\Malla\SelectController::class, 'dep_mun'])->name('select.municipio');

//MALLA :: CALENDARIO AJAX
Route::get('/calendario/agente', [App\Http\Controllers\Malla\CalendarioController::class, 'calendario_Agente'])->name('Calendario.agente');
Route::get('/supervisor/calendario/agente', [App\Http\Controllers\Malla\CalendarioController::class, 'calendario_Supervisor_Agente'])->name('Calendario.supervisor.agente');


//MALLA :: CARGOS
Route::get('/Cargos', [App\Http\Controllers\Malla\CargosController::class, 'index'])->name('Cargo.index');
Route::post('/Cargos', [App\Http\Controllers\Malla\CargosController::class, 'create'])->name('Cargo.create');
Route::delete('/Cargos/delete/{id}', [App\Http\Controllers\Malla\CargosController::class, 'destroy'])->name('Cargo.delete');
Route::put('/Cargos/update/{id}', [App\Http\Controllers\Malla\CargosController::class, 'update'])->name('Cargo.update');

//MALLA :: JORNADA
Route::get('/Jornadas', [App\Http\Controllers\Malla\JornadasController::class, 'index'])->name('Jornada.index');
Route::post('/Jornadas', [App\Http\Controllers\Malla\JornadasController::class, 'create'])->name('Jornada.create');
Route::delete('/Jornadas/delete/{id}', [App\Http\Controllers\Malla\JornadasController::class, 'destroy'])->name('Jornada.delete');
Route::put('/Jornadas/update/{id}', [App\Http\Controllers\Malla\JornadasController::class, 'update'])->name('Jornada.update');

//MALLA :: EMPLEADO
Route::get('/Empleado', [App\Http\Controllers\Malla\EmpleadosController::class, 'index'])->name('Empleado.index');
Route::post('/Empleado', [App\Http\Controllers\Malla\EmpleadosController::class, 'create'])->name('Empleado.create');
Route::delete('/Empleado/delete/{id}', [App\Http\Controllers\Malla\EmpleadosController::class, 'destroy'])->name('Empleado.delete');
Route::put('/Empleado/update/{id}', [App\Http\Controllers\Malla\EmpleadosController::class, 'update'])->name('Empleado.update');
Route::post('/Empleado/import', [App\Http\Controllers\Malla\EmpleadosController::class, 'importData'])->name('Empleado.import');

//MALLA :: UNIDAD DE NEGOCIO
Route::get('/Unidad de negocios', [App\Http\Controllers\Malla\Unidad_negociosController::class, 'index'])->name('Unidad_Negocio.index');
Route::post('/Unidad de negocios', [App\Http\Controllers\Malla\Unidad_negociosController::class, 'create'])->name('Unidad_Negocio.create');
Route::delete('/Unidad_Negocio/delete/{id}', [App\Http\Controllers\Malla\Unidad_negociosController::class, 'destroy'])->name('Unidad_Negocio.delete');
Route::put('/Unidad_Negocio/update/{id}', [App\Http\Controllers\Malla\Unidad_negociosController::class, 'update'])->name('Unidad_Negocio.update');

//MALLA :: CLIENTE
Route::get('/Cliente', [App\Http\Controllers\Malla\ClientesController::class, 'index'])->name('Cliente.index');
Route::post('/Cliente', [App\Http\Controllers\Malla\ClientesController::class, 'create'])->name('Cliente.create');
Route::delete('/Cliente/delete/{id}', [App\Http\Controllers\Malla\ClientesController::class, 'destroy'])->name('Cliente.delete');
Route::put('/Cliente/update/{id}', [App\Http\Controllers\Malla\ClientesController::class, 'update'])->name('Cliente.update');

//MALLA :: UNI_CLI
Route::get('/Uni_cli', [App\Http\Controllers\Malla\UniclisController::class, 'index'])->name('Uni_cli.index');
Route::post('/Uni_cli', [App\Http\Controllers\Malla\UniclisController::class, 'create'])->name('Uni_cli.create');
Route::delete('/Uni_cli/delete/{id}', [App\Http\Controllers\Malla\UniclisController::class, 'destroy'])->name('Uni_cli.delete');
Route::put('/Uni_cli/update/{id}', [App\Http\Controllers\Malla\UniclisController::class, 'update'])->name('Uni_cli.update');

//MALLA :: CAMPAÑA
Route::get('/Campaña', [App\Http\Controllers\Malla\CampanasController::class, 'index'])->name('Campana.index');
Route::post('/Campaña', [App\Http\Controllers\Malla\CampanasController::class, 'create'])->name('Campana.create');
Route::delete('/Campaña/delete/{id}', [App\Http\Controllers\Malla\CampanasController::class, 'destroy'])->name('Campana.delete');
Route::put('/Campaña/update/{id}', [App\Http\Controllers\Malla\CampanasController::class, 'update'])->name('Campana.update');

//MALLA :: CAMPAÑA
Route::get('/Contratos', [App\Http\Controllers\Malla\ContratosController::class, 'index'])->name('Contrato.index');
Route::post('/Contratos', [App\Http\Controllers\Malla\ContratosController::class, 'create'])->name('Contrato.create');

//MALLA :: AGENTE
Route::get('/Agente', [App\Http\Controllers\Malla\AgentesController::class, 'index'])->name('Agente.index');

//MALLA :: SUPERVISOR
Route::get('/Supervisor', [App\Http\Controllers\Malla\AgentesController::class, 'index'])->name('Supervisor.index');
Route::get('/Supervisor_consultar', [App\Http\Controllers\Malla\SupervisorController::class, 'look_for'])->name('Supervisor.look_for');
/* Route::get('/Supervisor_consultar/horario/tabla', [App\Http\Controllers\SupervisorDosController::class, 'look_for_date'])->name('Supervisor.look_for_date'); */

//MALLA :: INDIVIDUAL
Route::get('/Individual', [App\Http\Controllers\Malla\IndividualController::class, 'index'])->name('Individual.index');
Route::post('/Individual_jornada', [App\Http\Controllers\Malla\IndividualController::class, 'working_day'])->name('Individual.working_day');
Route::post('/Individual_editar', [App\Http\Controllers\Malla\IndividualController::class, 'edit'])->name('Individual.edit');
Route::post('/Individual_hora', [App\Http\Controllers\Malla\IndividualController::class, 'hour'])->name('Individual.hour');
Route::get('/Individual_empleado/{id}', [App\Http\Controllers\Malla\IndividualController::class, 'employee'])->name('Individual.employee_hours');

Route::put('/Individual_editar_time/{id}', [App\Http\Controllers\Malla\IndividualController::class, 'time_status'])->name('Individual.time_status');
Route::put('/Individual_editar_time_delete/{id}', [App\Http\Controllers\Malla\IndividualController::class, 'delete_time_status'])->name('Individual.delete_time_status');


Route::delete('/Malla/delete/{id}', [App\Http\Controllers\Malla\SupervisorController::class, 'destroy'])->name('Malla.delete');

//MALLA :: GRUPAL
Route::get('/Grupal', [App\Http\Controllers\Malla\GrupalController::class, 'index'])->name('Grupal.index');
Route::post('/Grupal/asignar', [App\Http\Controllers\Malla\GrupalController::class, 'create'])->name('Grupal.create');

//MALLA :: SELECTIVA
Route::get('/Selectiva', [App\Http\Controllers\Malla\SelectivaController::class, 'index'])->name('Selectiva.index');
Route::post('/Selectiva/asignar', [App\Http\Controllers\Malla\SelectivaController::class, 'create'])->name('Selectiva.create');

//MALLA :: NOVEDADES
Route::get('/Novedades', [App\Http\Controllers\Malla\NovedadesController::class, 'index'])->name('Novedades.index');

//MALLA :: REPORTES
Route::get('/Reportes', [App\Http\Controllers\Malla\ReportesController::class, 'index'])->name('Reporte.index');
Route::get('/Reportes_operativos', [App\Http\Controllers\Malla\ReportesController::class, 'operational'])->name('Reporte.operational');
Route::get('/Reportes_financiero',[App\Http\Controllers\Malla\ReportesController::class, 'financiero'])->name('Reporte.financiero');
Route::get('/Reportes_fecha',[App\Http\Controllers\Malla\ReportesController::class, 'fecha'])->name('Reporte.fecha');
Route::get('/Reportes_campaña',[App\Http\Controllers\Malla\ReportesController::class, 'campana'])->name('Reporte.campana');
Route::get('/Reportes_general_hoy',[App\Http\Controllers\Malla\ReportesController::class, 'diary'])->name('Reporte.diary');
Route::get('/Reportes/detallado',[App\Http\Controllers\Malla\ReportesController::class, 'details'])->name('Reporte.details');
Route::get('/Reportes/financiero',[App\Http\Controllers\Malla\ReportesController::class, 'financial'])->name('Reporte.financial');
Route::get('/Reportes/campana/fecha',[App\Http\Controllers\Malla\ReportesController::class, 'campaign'])->name('Reporte.campaign');
Route::get('/Reportes/general/fecha',[App\Http\Controllers\Malla\ReportesController::class, 'date'])->name('Reporte.date');



// -----------------------------------      INVENTARIO      -----------------------------------


//INVENTARIO :: EQUIPOS
Route::get('/Equipos', [App\Http\Controllers\Inventario\EquiposController::class, 'index'])->name('Equipo.index');
Route::put('/Inventario/Equipos/update/{id}', [App\Http\Controllers\Inventario\EquiposController::class, 'update'])->name('Equipo.update');
Route::get('/Equipos_details/{id}', [App\Http\Controllers\Inventario\EquiposController::class, 'details'])->name('Equipo.details');
Route::post('/Inventario/Equipos', [App\Http\Controllers\Inventario\EquiposController::class, 'create'])->name('Equipo.create');
Route::post('/Inventario/Software', [App\Http\Controllers\Inventario\EquiposController::class, 'software'])->name('Equipo.software');
Route::post('/Inventario/Hardware', [App\Http\Controllers\Inventario\EquiposController::class, 'hardware'])->name('Equipo.hardware');
Route::delete('/Inventario/Equipos/delete/{id}', [App\Http\Controllers\Inventario\EquiposController::class, 'destroy'])->name('Equipo.delete');
Route::put('/Inventario/Equipos/change/{id}', [App\Http\Controllers\Inventario\EquiposController::class, 'change'])->name('Equipo.change');
Route::get('/cv/{id}',[App\Http\Controllers\Inventario\EquiposController::class, 'cv'])->name('Equipo.cv');


//INVENTARIO :: ASIGANCION EQUIPOS
Route::get('/Asigancion_equipos', [App\Http\Controllers\Inventario\Equ_asignadoController::class, 'index'])->name('Asignacion_equipo.index');
Route::put('/Inventario/Asigancion_equipos/update/{id}', [App\Http\Controllers\Inventario\Equ_asignadoController::class, 'update'])->name('Asignacion_equipo.update');
Route::post('/Inventario/Asigancion_equipos', [App\Http\Controllers\Inventario\Equ_asignadoController::class, 'create'])->name('Asignacion_equipo.create');
Route::delete('/Inventario/Asigancion_equipos/delete/{id}', [App\Http\Controllers\Inventario\Equ_asignadoController::class, 'destroy'])->name('Asignacion_equipo.delete');
Route::post('/Inventario/Asigancion_equipos2', [App\Http\Controllers\Inventario\Equ_asignadoController::class, 'store'])->name('Asignacion_equipo.create2');

//INVENTARIO :: MANTENIMIENTO
Route::get('/Mantenimiento', [App\Http\Controllers\Inventario\MantenimientoController::class, 'index'])->name('Mantenimiento.index');
Route::post('/Inventario/Mantenimiento', [App\Http\Controllers\Inventario\MantenimientoController::class, 'create'])->name('Mantenimiento.create');
Route::post('/Inventario/Mantenimiento/maintenance', [App\Http\Controllers\Inventario\MantenimientoController::class, 'maintenance'])->name('Mantenimiento.maintenance');
Route::get('/Mantenimiento_details/{id}', [App\Http\Controllers\Inventario\MantenimientoController::class, 'details'])->name('Mantenimiento.details');
//AJAX :: SELECT :: MANTENIMIENTO
Route::get('/Select', [App\Http\Controllers\Inventario\SelectController::class, 'equipos_select'])->name('Select.equipo');

//INVENTARIO :: TIPO
Route::get('/Tipo', [App\Http\Controllers\Inventario\TipoController::class, 'index'])->name('Tipo.index');
Route::post('/Inventario/Tipo', [App\Http\Controllers\Inventario\TipoController::class, 'create'])->name('Tipo.create');
Route::put('/Inventario/Tipo/update/{id}', [App\Http\Controllers\Inventario\TipoController::class, 'update'])->name('Tipo.update');
Route::delete('/Inventario/Tipo/delete/{id}', [App\Http\Controllers\Inventario\TipoController::class, 'destroy'])->name('Tipo.delete');

//INVENTARIO :: SOFTWARE
Route::get('/Software', [App\Http\Controllers\Inventario\SoftwareController::class, 'index'])->name('Software.index');
Route::post('/Inventario/Software/create', [App\Http\Controllers\Inventario\SoftwareController::class, 'create'])->name('Software.create');
Route::put('/Inventario/Software/update/{id}', [App\Http\Controllers\Inventario\SoftwareController::class, 'update'])->name('Software.update');
Route::delete('/Inventario/Software/delete/{id}', [App\Http\Controllers\Inventario\SoftwareController::class, 'destroy'])->name('Software.delete');

//INVENTARIO :: HARDWARE
Route::get('/Hardware', [App\Http\Controllers\Inventario\HardwareController::class, 'index'])->name('Hardware.index');
Route::post('/Inventario/Hardware/create', [App\Http\Controllers\Inventario\HardwareController::class, 'create'])->name('Hardware.create');
Route::put('/Inventario/Hardware/update/{id}', [App\Http\Controllers\Inventario\HardwareController::class, 'update'])->name('Hardware.update');
Route::delete('/Inventario/Hardware/delete/{id}', [App\Http\Controllers\Inventario\HardwareController::class, 'destroy'])->name('Hardware.delete');

//INVENTARIO :: TECNICO
Route::get('/Tecnico', [App\Http\Controllers\Inventario\TecnicoController::class, 'index'])->name('Tecnico.index');
Route::delete('/Inventario/Tecnico/delete/{id}', [App\Http\Controllers\Inventario\TecnicoController::class, 'destroy'])->name('Tecnico.delete');
