@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif


                    <div class="row">
                        <div class="col-md-6 text-left">
                            <h3>Users List</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add new user</button>
                        </div>
                    </div>
                    

                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th>Sr.no</th>
                          <th>Name</th>
                          <th>Email</th>
                          <th>Avatar</th>
                          <th>Signed Up</th>
                          <th>Status</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($users as $key => $user)
                                <tr class="{{ ($user->register_complete == 0) ? 'bg1-danger': '' }}">
                                  <td>{{ $key+1 }}</td>
                                  <td>{{ $user->name }}</td>
                                  <td>{{ $user->email }}</td>
                                  <td>{{ $user->name }}</td>
                                  @if(in_array($user->email, $loggedIn))
                                      <td>Logged in</td>
                                  @else
                                      <td>Not Logged in</td>
                                  @endif
                                  <td>
                                    @if($user->status == 1)
                                        <a href="{{ route('blockUnblockUser', $user->id) }}">
                                            <i class="fas fa-ban"></i> Block
                                        </a>
                                    @else
                                        <a href="{{ route('blockUnblockUser', $user->id) }}">
                                            <i class="fas fa-ban"></i> Unblock
                                        </a>

                                    @endif
                                </td>
                                </tr>
                        @endforeach


                      </tbody>
                    </table>
                    <p>* Record/Records background marked red means "User registration is about to complete". </p>
                </div>
            </div>
        </div>
    </div>
</div>


{{-- Add new user modal start --}}
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="{{url('newUserMail')}}">
            @csrf
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Email:</label>
            <input type="email" class="form-control" id="recipient-name" name="email" placeholder="Add new user email">
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection

<style>
    .bg1-danger {
        background-color: #e46a65 !important;
        color: #fff;
    }
</style>
