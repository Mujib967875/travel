@extends('admin.layout.master')
@section('main_content')
@include('admin.layout.nav')
@include('admin.layout.sidebar')
    <div class="main-content">
        <section class="section">
            <div class="section-header justify-content-between">
                <h1>Create Team Member</h1>
                  <div class="ml-auto">
                    <a href="{{ route('admin_team_member_index') }}" class="btn btn-primary"><i class="fas fa-plus"></i>View All</a>
                  </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                 
                                    <form action="{{ route('admin_team_member_create_submit')}}" method="post" enctype="multipart/form-data">
                                  @csrf
                                  <div class="mb-3">
                                    <label class="form-label">Photo *</label>
                                    <div><input type="file" name="photo"></div>
                                  </div>
                                  <div class="row">
                                    <div class="col-md-6 mb-3"> 
                                        <label class="form-label">Name *</label>
                                        <input type="text" class="form-control" name="name" 
                                        value="{{ old('name') }}">
                                    </div>
                                    <div class="col-md-6 mb-3"> 
                                        <label class="form-label">Slug *</label>
                                        <input type="text" class="form-control" name="slug" 
                                        value="{{ old('slug') }}">
                                    </div>
                                    </div>
                                    <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Designation *</label>
                                        <input type="text" class="form-control" name="designation" 
                                        value="{{ old('designation') }}">
                                    </div>
                                    <div class="col-md-6 mb-3"> 
                                        <label class="form-label">Address *</label>
                                        <input type="text" class="form-control" name="address" 
                                        value="{{ old('address') }}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Email *</label>
                                        <input type="text" class="form-control" name="email" 
                                        value="{{ old('email') }}">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Phone *</label>
                                        <input type="text" class="form-control" name="phone" 
                                        value="{{ old('phone') }}">
                                    </div>
                                  </div>
                                   
                                    
                                   
                                    
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                        <label class="form-label">Facebook</label>
                                        <input type="text" class="form-control" name="facebook" 
                                        value="{{ old('facebook') }}">
                                    </div>
                                        <div class="col-md-6 mb-3"> 
                                        <label class="form-label">Twitter</label>
                                        <input type="text" class="form-control" name="twitter" 
                                        value="{{ old('twitter') }}">
                                    </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">  
                                        <label class="form-label">Linkedin</label>
                                        <input type="text" class="form-control" name="linkedin" 
                                        value="{{ old('linkedin') }}">
                                    </div>
                                        <div class="col-md-6 mb-3">
                                        <label class="form-label">Instagram</label>
                                        <input type="text" class="form-control" name="instagram" 
                                        value="{{ old('instagram') }}">
                                    </div>
                                    </div>
                                    
                                   
                                  
                                    
                                    <div class="mb-3">
                                        <label class="form-label">Biography</label>
                                        <textarea name="biography" class="form-control editor" cols="30" rows="10">{{ 
                                        old('biography') }}</textarea>
                                    </div>
                                        <div class="mb-3">
                                        <label class="form-label"></label>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
