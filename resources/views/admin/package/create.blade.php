@extends('admin.layout.master')
@section('main_content')
@include('admin.layout.nav')
@include('admin.layout.sidebar')
    <div class="main-content">
        <section class="section">
            <div class="section-header justify-content-between">
                <h1>Create Package</h1>
                  <div class="ml-auto">
                    <a href="{{ route('admin_package_index') }}" class="btn btn-primary"><i class="fas fa-plus"></i>View All</a>
                  </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                 
                                    <form action="{{ route('admin_package_create_submit')}}" method="post" enctype="multipart/form-data">
                                  @csrf
                                  <div class="row">
                                    <div class="col-md-6">
                                      <div class="mb-3">
                                    <label class="form-label">Featured Photo *</label>
                                    <div><input type="file" name="featured_photo"></div>
                                    </div>
                                    </div>
                                    <div class="col-md-6">
                                      <div class="mb-3">
                                    <label class="form-label">Banner  *</label>
                                    <div><input type="file" name="banner"></div>
                                  </div>
                                    </div>
                                  </div>
                                  
                                  
                                  <div class="row">
                                    <div class="col-md-6"> <div class="mb-3">
                                        <label class="form-label">Name *</label>
                                        <input type="text" class="form-control" name="name" 
                                        value="{{ old('name') }}">
                                    </div>
                                  </div>
                                    <div class="col-md-6">
                                         <div class="mb-3">
                                        <label class="form-label">Slug *</label>
                                        <input type="text" class="form-control" name="slug" 
                                        value="{{ old('slug') }}">
                                    </div>
                                    </div>
                                  </div>
                                    <div class="mb-3">
                                        <label class="form-label">Description *</label>
                                        <textarea name="description" class="form-control editor" cols="30" rows="10">{{ 
                                        old('description') }}</textarea>
                                    </div>
                                    <div class="row">
                                      <div class="col-md-4 mb-3">
                                        <label class="form-label">Price *</label>
                                        <input type="text" class="form-control" name="price" 
                                        value="{{ old('price') }}">
                                      </div>
                                      <div class="col-md-4 mb-3">
                                        <label class="form-label">Old Price *</label>
                                        <input type="text" class="form-control" name="old_price" 
                                        value="{{ old('old_price') }}">
                                      </div>
                                      <div class="col-md-4 mb-3">
                                      <label class="form-label">Select Destination *</label>
                                      <select name="destination_id" class="form-select">
                                        @foreach ($destinations as $destination)
                                          <option value="{{ $destination->id }}"@if(old('destination_id') == $destination->id) selected @endif>{{ $destination->name }}</option>
                                        @endforeach
                                      </select>
                                      </div>
                                    </div>
                                    
                                    
                                    
                                    <div class="mb-3">
                                        <label class="form-label"> Map (iframe code) *</label>
                                        <textarea name="map" class="form-control h_100" cols="30" rows="10">{{ 
                                        old('map') }}</textarea>
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