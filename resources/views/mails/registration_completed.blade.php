@component('mail::message')
<p> Hello {{$email}}, </p>  
<p> This is a welcome mail from demo site  </p>

<p>Your registration is successfullty completed. Now you can login with the site.</p>
@component('mail::button', ['url' => $link])
Login
@endcomponent
Sincerely,  
Admin demo site.
@endcomponent