<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Jobs\SendEmailJob;
use Carbon\Carbon;
use App\User;
use App\Mail\welcomemail;
use Illuminate\Support\Facades\Mail;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $users = User::where('created_at', '<', Carbon::now()->subMinutes(5)->toDateTimeString())
                        ->where('mailsent', 0)
                        ->get();

        foreach ($users as $key => $user) {
            Mail::to($user->email)->send(new welcomemail(['userData' => $user]));
            User::where('id', $user->id)->update(['mailsent' => 1]);
        }

        // $fourthFridayMonthly = new Carbon('fourth friday of ' . $month . ' ' . $year);

        // $schedule->job(new SendEmailJob)->monthlyOn($fourthFridayMonthly->format('d'), '13:46');
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
