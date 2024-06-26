@extends('layouts.admindashboard')
@section('title', 'Email Template Setup')

@section('content')

            <!-- content @s -->
            <div class="nk-content nk-content-fluid">
                <div class="container-xl wide-xl">
                    <div class="nk-content-inner">
                        <div class="nk-content-body">
                            <div class="components-preview wide-md mx-auto">
                                <div class="nk-block-head nk-block-head-lg wide-sm">
                                    <div class="nk-block-head-content">
                                        <div class="nk-block-head-sub"><a class="back-to" href="{{ route('dashboard') }}"><em class="icon ni ni-arrow-left"></em><span>Dashboard</span></a></div>
                                        <h2 class="nk-block-title fw-normal">Email Template Setup</h2>
                                    </div>
                                </div><!-- .nk-block-head -->

                                <div class="nk-block nk-block-lg">
                                    <div class="card card-bordered">
                                        <div class="card-inner">
                                            <form method="POST" action="{{route('template.update')}}" enctype="multipart/form-data" class="form-validate">
                                                {{ csrf_field() }}
                                                <div class="row g-gs">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label class="form-label" for="smsapi">SMS API</label>
                                                            <div class="form-control-wrap">
                                                                <input type="text" class="form-control" id="smsapi" name="smsapi" value="{{$temp->smsapi}}" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label class="form-label" for="esender">Email Sender</label>
                                                            <div class="form-control-wrap">
                                                                <input type="text" class="form-control" id="esender" name="esender" value="{{$temp->esender}}" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="form-label" for="emessage">Message Template</label>
                                                            <div class="form-control-wrap">
                                                                <textarea class="form-control form-control-sm summernote-basic" id="emessage" name="emessage">{!! $temp->emessage !!}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-lg btn-primary">Save Information</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div><!-- .nk-block -->
                            </div><!-- .components-preview -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- content @e -->

@endsection
@section('script')
	<script type="text/javascript">
        $('#summernote').summernote({
            placeholder: "{!!$temp->emessage!!}",
            tabsize: 2,
            height: 100
        }).summernote('code', `{!!$temp->emessage!!}`);
	</script>
@stop
