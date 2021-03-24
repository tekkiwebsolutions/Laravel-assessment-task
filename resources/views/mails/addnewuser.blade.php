

@component('mail::message')
<p> Hello {{$name}}, </p>  
<p> This mail sent from demo site admin  </p>

<p>Click link below to complete your registration.</p>
@component('mail::button', ['url' => $link])
Add detail
@endcomponent
Sincerely,  
Admin demo site.
@endcomponent