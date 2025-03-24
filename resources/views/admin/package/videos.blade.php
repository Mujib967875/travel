@extends('admin.layout.master')
@section('main_content')
@include('admin.layout.nav')
@include('admin.layout.sidebar')
    <div class="main-content">
        <section class="section">
            <div class="section-header justify-content-between">
                <h1>Videos of {{ $package->name }}</h1>
                  <div class="ml-auto">
                    <a href="{{ route('admin_package_index') }}" class="btn btn-primary"><i class="fas fa-plus"></i> bact to previous</a>
                  </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-7">
                        <div class="card">
                            <div class="card-body">
                                  <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>SL</th>
                                                    <th> Video</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                              @foreach ($package_videos as $item)                          
                                              <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td> 
                                                  <iframe class="iframe1" width="560" height="315" src="https://www.youtube.com/embed/{{ $item->Video }}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                                                </td>
                                                <td>
                                                  <a href="{{ route('admin_package_video_delete',$item->id) }}" class="btn btn-danger btn-sm" onClick="return confirm('Are you sure?');">Delete</a>
                                                </td>
                                              </tr>
                                               @endforeach
                                            </tbody>
                                        </table>
                                  </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="card">
                            <div class="card-body">
                                   <form action="{{ route('admin_package_video_submit',$package->id) }}" method="POST">
                                  @csrf
                                  <div class="mb-3">
                                    <label class="form-label">Video *</label>
                                    <input type="text" name="video" class="form-control">
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