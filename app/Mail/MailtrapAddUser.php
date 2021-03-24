<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class MailtrapAddUser extends Mailable
{
    use Queueable, SerializesModels;
    public $email,$id;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($arr)
    {
        $this->email = $arr['userData']['email'];
        $this->id = $arr['userData']['id'];
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('sarbjitgrewaltekkiweb@gmail.com', 'Add user')
            ->subject('Add new user link')
            ->markdown('mails.addnewuser')
            ->with([
                'name' => $this->email,
                'link' => route('adduser',['id'=>$this->id])
            ]);
    }
}
