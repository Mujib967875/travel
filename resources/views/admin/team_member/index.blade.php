@extends('admin.layout.master')
@section('main_content')
@include('admin.layout.nav')
@include('admin.layout.sidebar')
    <div class="main-content">
        <section class="section">
            <div class="section-header justify-content-between">
                <h1>Team Member</h1>
                  <div class="ml-auto">
                    <a href="{{ route('admin_team_member_create') }}" class="btn btn-primary"><i class="fas fa-plus"></i>Add New</a>
                  </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                 
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="example1">
                                            <thead>
                                                <tr>
                                                    <th>SL</th>
                                                    <th>Photo</th>
                                                    <th>Name</th>
                                                    <th>Designation</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($team_members as $team_member)
                                                <tr>
                                                    <td>{{ $loop->iteration}}</td>
                                                    <td>
                                                      <img src="{{ asset('uploads/'.$team_member->photo) }}" alt="" class="w_100">
                                                    </td>
                                                    <td>{{ $team_member->name }}</td>
                                                    <td>{{ $team_member->designation }}</td>
                                                    <td class="pt_10 pb_10">
                                                        <a href="{{ route('admin_team_member_edit',$team_member->id) }}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                                        <a href="{{ route('admin_team_member_delete', $team_member->id)}}" class="btn btn-danger" onClick="return confirm('Are you sure?');"><i class="fas fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                               @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
