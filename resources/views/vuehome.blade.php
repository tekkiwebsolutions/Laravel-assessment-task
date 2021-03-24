<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">   
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="{{ asset('/css/app.css') }}">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        @if(Auth::check()) 
            <meta name="user-id" content="{{ Auth::user()->id }}"> 
            <meta name="user-name" content="{{ Auth::user()->user_name }}"> 
            <meta name="user-user-type" content="{{ Auth::user()->user_type }}"> 
        @else   
            <meta name="user-id" content=""> 
            <meta name="user-name" content=""> 
            <meta name="user-user-type" content=""> 
        @endif
    </head>
    <body>
        <!-- template for the modal component -->
        <script type="text/x-template" id="modal-template">
          <transition name="modal">
            <div class="modal-mask">
              <div class="modal-wrapper">
                <div class="modal-container">

                  <div class="modal-header">
                    <slot name="header">
                      default header
                    </slot>
                  </div>

                  <div class="modal-body">
                    <slot name="body">
                      default body
                    </slot>
                  </div>

                  <div class="modal-footer">
                    <slot name="footer">
                      <a href="#" class="btn btn-custm cancl-submisin" @click="$emit('close')">
                        Close
                      </a>
                    </slot>
                  </div>
                </div>
              </div>
            </div>
          </transition>
        </script>
        <div id="app">
            <header-view></header-view>
            <div class="vue-container">
                <router-view></router-view>
            </div>
            <footer-view></footer-view>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script>
        
            // setTimeout(function(){ 
            //     $('.alert').fadeOut('slow') 
            // }, 3000);
        </script>
        <script src="{{ asset('/js/app.js') }}"></script>

    </body>
</html>
