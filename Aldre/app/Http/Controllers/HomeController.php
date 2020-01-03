<?php

namespace App\Http\Controllers;

use App\User_app;
use Illuminate\Http\Request;




class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
//        return view('home');
//        auth()->user()->assignRole('mentor'); // 1 คน
//        auth()->user()->removeRole('admin'); // ลบ
//        auth()->user()->syncRoles(['doctor','nurse']); // มากกว่า 1
//        $user = auth()->user();
////        $user->givePermissionTo("manageuser");
//
//        $user->syncPermissions(['addpost','editpost','readpost']);


//        if(auth()->user()->hasRole("admin")){
//            return view('home');
//        }else{
////            $user = auth()->user();
////            $user->syncPermissions(['readpost']);
//            return view('home');
//        }

//        auth()->user()->assignRole('therapist'); -> ระบุบตำแหน่ง

//        $user = auth()->user();
//        $user->syncPermissions(['manageuser','addpost','editpost','deletepost','viewpost']); -> ให้ใครทำตำแหน่งไร
        if(auth()->user()->hasRole("admin")){
            $user_apps = User_app::all();
            return view('home',compact('user_apps'));
        }else{
            $user_apps = User_app::all();
            return view('home',compact('user_apps'));
        }

    }

    public function create(){
        return view('views.Activity');
    }



}
