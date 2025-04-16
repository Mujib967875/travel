@extends('admin.layout.master')

@section('main_content')
    @include('admin.layout.nav')
    @include('admin.layout.sidebar')
    <div class="main-content">
        <section class="section">
            <div class="section-header justify-content-between">
                <h1>Edit Home Item</h1>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_home_page_item_update', $home_items->id) }}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <h3>Destination Section</h3>
                                    <div class="mb-3">
                                        <label class="form-label">Destination Heading *</label>
                                        <input type="text" class="form-control" name="destination_heading"
                                            value="{{ $home_items->destination_heading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Destination Sub Heading *</label>
                                        <input type="text" class="form-control" name="destination_subheading"
                                            value="{{ $home_items->destination_subheading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Destination Status</label>
                                        <select name="destination_status" class="form-select">
                                            <option value="Show" @if ($home_items->destination_status == 'Show') selected @endif>Show
                                            </option>
                                            <option value="Hide" @if ($home_items->destination_status == 'Hide') selected @endif>Hide
                                            </option>
                                        </select>
                                    </div>
                                    <br>

                                    <h3>Featured Section</h3>
                                    <div class="mb-3">
                                        <label class="form-label">Feature Status</label>
                                        <select name="featured_status" class="form-select">
                                            <option value="Show" @if ($home_items->featured_status == 'Show') selected @endif>Show
                                            </option>
                                            <option value="Hide" @if ($home_items->featured_status == 'Hide') selected @endif>Hide
                                            </option>
                                        </select>
                                    </div>
                                    <br>

                                    <h3>Package Section</h3>
                                    <div class="mb-3">
                                        <label class="form-label">Package Heading *</label>
                                        <input type="text" class="form-control" name="package_heading"
                                            value="{{ $home_items->package_heading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Package Sub Heading *</label>
                                        <input type="text" class="form-control" name="package_subheading"
                                            value="{{ $home_items->package_subheading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Package Status</label>
                                        <select name="package_status" class="form-select">
                                            <option value="Show" @if ($home_items->package_status == 'Show') selected @endif>Show
                                            </option>
                                            <option value="Hide" @if ($home_items->package_status == 'Hide') selected @endif>Hide
                                            </option>
                                        </select>
                                    </div>
                                    <br>

                                    <h3>Testimonial Section</h3>
                                    <div class="row">
                                        <div class="col md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Testimonial Existing Background</label>
                                                <div><img src="{{ asset('uploads/'.$home_items->testimonial_background) }}" class="w_200"></div>
                                            </div>
                                        </div>
                                        <div class="col md-6">
                                            <div class="mb-3">
                                                <div><label class="form-label">Testimonial Change Background *</label></div>
                                                <div><div class="upload-wrapper">
                                                    <div class="mini-drop-zone">
                                                      <input type="file" name="testimonial_background" name="fileInput1" class="file-input" accept="image/*">
                                                      <div class="drop-content">
                                                        <span class="drop-title"> <i class="upload-icon">📷</i> Pilih Foto</span>
                                                      </div>
                                                    </div>
                                                    <div class="preview-container" id="previewContainer1"></div>
                                                </div></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Testimonial Heading *</label>
                                        <input type="text" class="form-control" name="testimonial_heading"
                                            value="{{ $home_items->testimonial_heading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Testimonial Sub Heading *</label>
                                        <input type="text" class="form-control" name="testimonial_subheading"
                                            value="{{ $home_items->testimonial_subheading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Testimonial Status</label>
                                        <select name="testimonial_status" class="form-select">
                                            <option value="Show" @if ($home_items->testimonial_status == 'Show') selected @endif>Show
                                            </option>
                                            <option value="Hide" @if ($home_items->testimonial_status == 'Hide') selected @endif>Hide
                                            </option>
                                        </select>
                                    </div>
                                    <br>

                                    <h3>Blog Section</h3>
                                    <div class="mb-3">
                                        <label class="form-label">Blog Heading *</label>
                                        <input type="text" class="form-control" name="blog_heading"
                                            value="{{ $home_items->blog_heading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Blog Sub Heading *</label>
                                        <input type="text" class="form-control" name="blog_subheading"
                                            value="{{ $home_items->blog_subheading }}">
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Blog Status</label>
                                        <select name="blog_status" class="form-select">
                                            <option value="Show" @if ($home_items->blog_status == 'Show') selected @endif>Show 
                                            </option>
                                            <option value="Hide" @if ($home_items->blog_status == 'Hide') selected @endif>Hide
                                            </option>
                                        </select>
                                    </div>
                                    <br>

                                    <div class="mb-3">
                                        <label class="form-label"></label>
                                        <button type="submit" class="btn btn-primary">Updated</button>
                                    </div>
                            </div>
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
