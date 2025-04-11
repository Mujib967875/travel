@extends('admin.layout.master')

@section('main_content')
    @include('admin.layout.nav')
    @include('admin.layout.sidebar')
        <div class="main-content">
            <section class="section">
                <div class="section-header justify-content-between">
                    <h1>Reviews</h1>
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
                                                    <th>Package</th>
                                                    <th>User</th>
                                                    <th>Rating</th>
                                                    <th>Comment</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($reviews as $item)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        {{ $item->package->name }}<br>
                                                        <a href="{{ route('package',$item->package->slug) }}" target="_blank">See Detail</a>
                                                    </td>
                                                    <td>
                                                        {{ $item->user->name }}<br>
                                                        {{ $item->user->email }}
                                                    </td>
                                                    <td>
                                                        @for ($i = 1; $i <= 5; $i++)
                                                            @if ($i <= $item->rating)
                                                                <i class="fas fa-star"></i>
                                                            @else
                                                                <i class="far fa-star"></i>
                                                            @endif
                                                        @endfor
                                                    </td>
                                                    <td>{{ $item->comment }}</td>
                                                    <td class="pt_10 pb_10">
                                                        <a href="{{ route('admin_review_delete',$item->id) }}" class="btn btn-danger" onClick="return confirm('Review will be move to trash. Are you sure?');"><i class="fas fa-trash"></i></a>
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
