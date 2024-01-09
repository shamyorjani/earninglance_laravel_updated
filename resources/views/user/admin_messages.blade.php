<!DOCTYPE html>
<html lang="en">

<head>
    @include('user.inc.css')
</head>

<body>
    @include('user.inc.nav')

    <div class="content mt-5" style="min-height: 100vh;" data-color='orange'>
        <div class="row">

            <div class="col-lg-12">
                <div class="card text-center mt-5 d-flex flex-row align-items-center rounded-4">
                    <div class="card-body col-lg-6 m-5 p-0 text-center">
                        <h1 class="card-title">Welcome: <span class="text-warning">sdfds</span></h1>
                    </div>
                    <div class="card-body col-lg-5 m-5 p-0 text-center">
                        <h1 class="card-title">Plan: <span class="text-warning">dsfds</span></h1>
                    </div>
                    <div class="card-body col-lg-1 m-5 p-0 text-center">
                        <a href="{{ route('logout') }}">
                            <i class="fa-solid fa-right-from-bracket text-danger" style="font-size: 40px;"></i>
                        </a>
                    </div>
                </div>
            </div>
            </h5>
            @foreach ($admin_messages as $message)
                <div class="col-lg-12 d-flex flex-row my-4">
                    <div class="card text-center col-lg-8 rounded-4 flex-row">
                        <div class="card-body p-5 m-0 ">
                            <h2 class="card-title">Date: {{ $message->date }}</h2>
                        </div>
                        <div class="card-body p-5 m-0 text-center text-success">
                            <button type="button" class="btn btn-light btn-lg" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                                <span class="text-success fw-bold">View Message</span>
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-4 d-flex flex-row text-light">
                        <div class="card text-center rounded-4 bg-danger mx-2">
                            <a href="" class=" text-decoration-none text-light hover-shadow">
                                <div class="card-body m-5 p-0 text-center">
                                    <h2>Delete</h2>
                                </div>
                            </a>
                        </div>
                        <div class="card text-center rounded-4 bg-success ms-2">
                            <a href="" class=" text-decoration-none text-light hover-shadow">
                                <div class="card-body m-5 p-0 text-center">
                                    <h2>Reply</h2>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            @endforeach
            <div class="col-lg-12 d-flex flex-row my-4 align-items-center">
                <div class="card text-center col-lg-8 rounded-4 flex-row p-0">
                    <textarea name="textarea" id="" class="form-control fw-bold p-3 text-area-focus rounded-4"
                        placeholder="Write your message here..." rows="6" style="max-height: 100%;"></textarea>
                </div>
                <div class="col-lg-4 text-light d-flex flex-row">
                    <div class="card text-center rounded-4 bg-warning mx-5">
                        <a href="" class="text-decoration-none text-light hover-shadow">
                            <div class="card-body m-4 p-0 text-center">
                                <h2>Send Message</h2>
                                <!-- Button trigger modal -->
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    </div>


    @include('user.inc.footer')
</body>

</html>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Admin Message</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                {{ $message->message }}
            </div>
        </div>
    </div>
</div>
