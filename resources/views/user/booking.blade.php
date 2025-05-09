@extends('front.layout.master')

@section('main_content')

 <div class="page-top" style="background-image: url({{asset('uploads/banner.jpg') }})">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Booking</h2>
                        <div class="breadcrumb-container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home')}}">Home</a></li>
                                <li class="breadcrumb-item active">Booking</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-content user-panel pt_70 pb_70">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-12">
                        <div class="card">
                            @include('user.sidebar')
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <th>SL</th>
                                        <th>Invoice No</th>
                                        <th>Total Person</th>
                                        <th>Paid Amount</th>
                                        <th>Payment Method</th>
                                        <th>Payment Status</th>
                                        <th class="w-100">
                                            Action
                                        </th>
                                    </tr>
                                    @foreach ($all_data as $item)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>
                                            {{ $item->invoice_no }}
                                        </td>
                                        <td>
                                            {{ $item->total_person }}
                                        </td>
                                        <td>Rp.{{ $item->paid_amount }}</td>
                                        <td>
                                            @if ($item->payment_method == 'Midtrans')
                                                <p> Non-tunai </p>
                                                @elseif ($item->payment_method == 'Cash')
                                                <p> Cash </p>
                                                @elseif ($item->payment_method == 'Stripe')
                                                <p> Stripe </p>
                                                @elseif ($item->payment_method == 'PayPal')
                                                <p> Paypal </p>
                                            @endif
                                        </td>   
                                        <td>
                                            @if ($item->payment_status == 'Completed')
                                                <div class="badge bg-success">Completed</div>
                                            @elseif ($item->payment_status == 'Pending')
                                                <div class="badge bg-danger">Pending</div>
                                            @elseif ($item->payment_status == 'Denied')
                                                <div class="badge bg-danger">Denied</div>
                                            @elseif ($item->payment_status == 'Expired')
                                                <div class="badge bg-warning">Expired</div>
                                            @elseif ($item->payment_status == 'Cancelled')
                                                <div class="badge bg-primary">Cancelled</div>
                                            @endif
                                        </td>
                                        <td>
                                            <a href="" class="btn btn-secondary btn-sm mb-1 w-100-p" data-bs-toggle="modal" data-bs-target="#exampleModal{{ $loop->iteration }}">Detail</a>
                                            <a href="{{ route('user_invoice', $item->invoice_no) }}" class="btn btn-secondary btn-sm w-100-p">Invoice</a>
                                        </td>
                                    </tr>
                                    <!-- Modal -->
                                <div class="modal fade" id="exampleModal{{ $loop->iteration }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Detail</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3 row modal-seperator">
                                                    <div class="col-md-5">
                                                        <b>Invoice No:</b>
                                                    </div>
                                                    <div class="col-md-7">
                                                        {{ $item->invoice_no }}
                                                    </div>
                                                </div>
                                                <div class="mb-3 row modal-seperator">
                                                    <div class="col-md-5">
                                                        <b>Package Detail:</b>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <b>Name :</b> {{ $item->package->name }}<br>
                                                        <a href="{{ route('package', $item->package->slug) }}" target="_blank">See Details</a>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row modal-seperator">
                                                    <div class="col-md-5">
                                                        <b>Tour Detail:</b>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <b>Start Date : </b>
                                                        {{ $item->tour->tour_start_date ?? 'Tour Not Found.' }}<br>
                                                        <b>End Date : </b>
                                                        {{ $item->tour->tour_end_date ?? 'Tour Not Found.' }}<br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row modal-seperator">
                                                    <div class="col-md-5">
                                                        <b>Total Persons:</b>
                                                    </div>
                                                    <div class="col-md-7">
                                                        {{ $item->total_person }}
                                                    </div>
                                                </div>
                                                <div class="mb-3 row modal-seperator">
                                                    <div class="col-md-5">
                                                        <b>Paid Amount:</b>
                                                    </div>
                                                    <div class="col-md-7">
                                                        Rp. {{ $item->paid_amount }}
                                                    </div>
                                                </div>
                                                <div class="mb-3 row modal-seperator">
                                                    <div class="col-md-5">
                                                        <b>Payment Method:</b>
                                                    </div>
                                                    <div class="col-md-7">
                                                        {{ $item->payment_method }}
                                                    </div>
                                                </div>
                                                    <div class="mb-3 row modal-seperator">
                                                        <div class="col-md-5">
                                                            <b>Payment Status:</b>
                                                        </div>
                                                        <div class="col-md-7">
                                                            <div class="badge bg-success">Completed</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- // Modal -->
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection