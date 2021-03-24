@extends('layouts.app')
@section('content')
<div class="container">
	<div class="col-md-offset-3 col-md-6  ">
		@if (session('status'))
		    <div class="alert alert-success" role="alert">
		        {{ session('status') }}
		        <a href="{{ url('/userlogin') }}">User Login</a>
		    </div>
		@endif
		<h2>Complete your registration </h2>
		<form  method="post" action="{{ url('adduser/complete_registration') }}">
			@csrf
			<div class="form-group">
				<label for="email">Email:</label>
				<input type="email" class="form-control" id="email" placeholder="Enter email" value="{{ $userData->email }}" name="email">
			</div>
			<input type="hidden" name="id" value="{{ $userData->id }}">
			<div class="form-group">
				<label for="pwd">Create Password:</label>
				<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>
@endsection