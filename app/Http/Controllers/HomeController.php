<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Active;
use App\User;
use DB;
use Carbon\Carbon;
use App\Mail\MailtrapAddUser;
use App\Mail\welcomemail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => [
            'addUser','completeRegistration','userLogin','login'
        ]]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // Find latest users
        $loggedIn = Active::users()
                        ->get();
        $emails = [];
        // Loop through and echo user's name
        foreach ($loggedIn as $activity) {
            $emails[]= $activity->user->email;
        }

        $users = User::where('admin',0)->get();

        return view('home',['users' => $users, 'loggedIn' => $emails]);
    }

    public function blockUnblockUser($id)
    {
        $userStatus = User::where('id', $id)->first();
        if($userStatus->status == 1) 
            User::where('id', $id)->update(['status' => 0]);
        else
            User::where('id', $id)->update(['status' => 1]);
        return redirect()->back()->with('status', 'Status updated successfully');
        // return redirect()->back('Status updated successfully');
    }

    public function sendMailUser(Request $request)
    {
        $emailExists = User::where('email',$request->email)->first();
        if ($emailExists) {
            return redirect()->back()->with('status', 'Mail already sent to user '.$request->email);
        }

        $user = User::create([
            'email' => $request->email
        ]);

        Mail::to($request->email)->send(new MailtrapAddUser(['userData' => $user]));

        // $values = array('email' => $request->email);

        return redirect()->back()->with('status', 'Mail successfully sent to '.$request->email);
    }

    public function userHome()
    {
        return view('user.userhome');
    }

    public function addUser($id)
    {
        $userData = User::where('id',$id)->first();
        return view('user.adduser',['userData' => $userData]);
    }

    public function completeRegistration(Request $request)
    {
        User::where('id', $request->id)
                            ->update([
                                        'password' => Hash::make($request->pswd),
                                        'status' => 1,
                                        'register_complete' => 1
                                    ]);

        // $when = Carbon::now()->addMinutes(1);

        // Queue::later($date, 'SendEmail@send', array('message' => $message));
        
        Mail::to($request->email)->send(new welcomemail(['userData' => $request->all()]));
        //  Mail::later(5, $request->email, $data, function ($message) {
        // //
        // });
        return redirect()->back()->with('status', 'You will get account registration mail after 5 mins.');
    }

    public function userLogin()
    {
        return view('user.login');
    }
}
