<!DOCTYPE html>
<html lang="en">

<head>
    @include('user.inc.css')
</head>

<body>
    @include('user.inc.nav')
    <div class="content mt-5" style="min-height: 100vh;" data-color='orange'>
        <div class="row">
            <?php 
    if ($user->role == '1')
    {
        if (isset($plans_with_id->id)) {
            ?>
            <div class="card text-center">
                <div class="card-header">
                    <h4>Complete the Payment</h4>
                </div>
                <div class="card-body p-3">
                    <form action="{{ url('/uploads') }}/{{ $plans_with_id->id }}" method="post"
                        enctype="multipart/form-data">
                        @csrf

                        <h5>Please pay Rs {{ $plans_with_id->charges }}</h5>
                        <h5>Select Account</h5>
                        <div class="row">
                            <div class="col-lg-4"></div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <input type="hidden" name="plan" value="plaind">
                                    <select required name="payment" class="form-control">
                                        @foreach ($pmethods as $pmethod)
                                            <option value="{{ $pmethod->id }}">
                                                Name:{{ $pmethod->name }} Acc_Number:{{ $pmethod->account_number }}
                                                Acc_Name:{{ $pmethod->account_name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input required id="image" type="file" name="image" class="hidden">
                                    <label for="image" class="btn btn-round"
                                        style="background-color: #E3E3E3; color: #f96332;"><i
                                            class="fa-solid fa-image"></i> Upload Image</label>
                                </div>

                                <div class="form-group">
                                    <input type="submit" value="Confirm" name="confirmplan"
                                        class="btn btn-primary btn-round">
                                </div>
                            </div>
                            <div class="col-lg-4"></div>
                        </div>
                    </form>
                </div>
            </div>
            <?php
        }
        elseif ($user_has_plan_count == 1) {
            ?>
            {{-- <div class="col-lg-6"> --}}
            @if (session()->has('withdraw_failed'))
                <div class="alert alert-danger alert-dismissible text-light fade show mt-4" role="alert">
                    {{ session()->get('withdraw_failed') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @elseif (session()->has('withdraw_success'))
                <div class="alert alert-success alert-dismissible text-light fade show mt-4" role="alert">
                    {{ session()->get('withdraw_success') }}
                    <button type="button" class="btn-close btn-light" data-bs-dismiss="alert"
                        aria-label="Close"></button>
                </div>
            @endif
            <div class="col-lg-12">
                <div class="card text-center mt-5 d-flex flex-row align-items-center rounded-4">
                    <div class="card-body col-lg-6 m-5 p-0 text-center">
                        <h3 class="card-title">Welcome: <span class="text-warning">{{ $user->name }}</span></h3>
                    </div>
                    <div class="card-body col-lg-5 m-5 p-0 text-center">
                        <h3 class="card-title">Plan: <span class="text-warning">{{ $user_plan->name }}</span></h3>
                    </div>
                    <div class="card-body col-lg-1 m-5 p-0 text-center">
                        <a href="{{ route('logout') }}">
                            <i class="fa-solid fa-right-from-bracket text-danger" style="font-size: 40px;"></i>
                        </a>
                    </div>
                </div>
            </div>
            {{-- </div> --}}
            <div class="col-lg-6 ">
                <div class="card text-center col-lg-12 d-flex flex-row align-items-center mb-0 rounded-4">
                    <div class="card-body col-lg-6 m-5 p-0 text-center">
                        <h3 class="card-title">Balance</h3>
                        <h4 class="text-success card-text fw-bold">
                            Rs.
                            @if ($user->balance == 0.0)
                                0.00
                            @else
                                {{ $user->balance }}
                        </h4>
                    </div>
                    <div class="card-body col-lg-6 m-0 p-0">
                        <h5 class="card-text">
                            <button type="button" class="btn btn-success btn-lg" data-toggle="modal"
                                data-target="#withdraw">Withdraw</button>
                            <div class="modal fade bd-example-modal-sm" id="withdraw" tabindex="-1" role="dialog"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-sm" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title text-success" id="exampleModalLabel" >
                                                Withdraw Payment</h5>
                                            <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="{{ route('withdraw') }}" method="POST">
                                            @csrf
                                            <div class="modal-body">
                                                <div class="from-group d-flex flex-column">
                                                    <div class="text-left">
                                                        <p>Select Withdrawal Method: </p>
                                                        <select required class="form-control" name="method_id">
                                                            @foreach ($wmethods as $wmethod)
                                                                <option value={{ $wmethod->id }}>{{ $wmethod->name }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        <br>
                                                    </div>
                                                    <div class="text-left">
                                                        <p>Amount: </p>
                                                        <input type="number" required class="form-control"
                                                            max="{{ $user->balance }}" name="amount"
                                                            placeholder="Amount">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer ">
                                                <button type="submit" name="withdrawamnt"
                                                    class="btn btn-md btn-warning">Send Request</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            @endif
                            <?php
                            // }
                            ?>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card text-center rounded-4">
                    <div class="card-body m-5 p-0 ">
                        <h3 class="card-title">Total Withdrawn</h3>
                        <h4 style="text-transform: capitalize;" class="text-success card-text fw-bold">
                            Rs.
                            @if ($userearning_total == 0)
                                0.00
                            @else
                                {{ $userearning_total }}
                            @endif
                        </h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card text-center rounded-4">
                    <div class="card-body m-5 p-0 text-center">
                        <h3 class="card-title">Direct Comission</h3>
                        <h4 class="text-success"><span class="fw-bold">Rs.{{ $user_plan->direct }}</span></h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card text-center rounded-4">
                    <div class="card-body m-5 p-0 text-center">
                        <h3 class="card-title">Indirect Comission</h3>
                        <h4 class="text-success"><span class="fw-bold">Rs.{{ $user_plan->indirect }}</span></h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 d-flex flex-row text-center align-items-center">
                <div class="card col-lg-10  m-4 p-0 rounded-4">
                    <div class="card-body">
                        <h4>{{ url('/register') }}/{{ $user_payments->username }}</h4>
                    </div>
                </div>
                <div class="col-lg-2 m-0 p-0">
                    <button class="btn btn-warning text-light btn-lg btn-round mt-1 " id="skbtn"
                        onclick="secretkey()" data-toggle="tooltip" data-placement="top" title="Copy"><i
                            class="now-ui-icons files_single-copy-04"></i></button>
                </div>
            </div>



            <?php
        } 
        elseif($user_payments_user_count != 0) {

            if($user_payments->status == 0) {
            ?>
            <div class="col-lg-12 mt-5">
                <div class="card">
                    <div class="card-body p-3 text-center">
                        <h5>You've signed up successfully! Your Payment will be approved in 2 working days.</h5>
                        <div class="table-responsive text-center">
                            <table class="table">
                                <tr>
                                    <th colspan='2'>
                                        Your Choosen Plan
                                    </th>
                                </tr>
                                <tr>
                                    <th style="width: 50%;">Plan</th>
                                    <th style="width: 50%;">Charges</th>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">{{ $user_payments->plan_id }}</td>
                                    <td style="width: 50%;">{{ $user_payments->amount }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <?php
            }
            elseif($user_payments->status == 1){
                ?>
                <div class="col-lg-12 mt-5">
                    <div class="card">
                        <div class="card-body p-3 text-center">
                            <h5 class="text-danger">Your request can't be approved because your payment was not
                                processed to Earninglance!</h5>
                        </div>
                    </div>
                </div>
                <?php
            }
        }
        else
        {
            ?>
                <div class="col-lg-12 mt-5">
                    <div class="card">
                        <div class="card-body p-3 text-center">
                            <h3 class="">Choose Your Plan</h3>
                            <div class="row justify-content-center">
                                @foreach ($plans as $plan)
                                    <div class="col-lg-3 p-1 mx-5">
                                        <form
                                            style="background: linear-gradient(105deg, #fb730d 0%, #ff461e 100%); border-radius: 20px;">
                                            <div class="row text-center text-white">
                                                <div class="col-lg-12 p-3">
                                                    <h5>{{ $plan->name }}</h5>
                                                    <p class="text-white">Level {{ $plan->level }}</p>
                                                    <h3 class="m-0">{{ $plan->charges }}</h3>
                                                    <h4 class="m-1">Comissions</h4>
                                                    <p class="text-white">Direct: {{ $plan->direct }}</p>
                                                    <p class="text-white">Indirect: {{ $plan->indirect }}</p>
                                                    <p class="text-white">Team Bonus: {{ $plan->bonus }}</p>
                                                    <br>
                                                </div>
                                                <div class="col-lg-12">
                                                    <fieldset><a class="btn btn-white btn-round"
                                                            style="background-color: white;color: #f96332;"
                                                            href="{{ url('/dashboard/plans') }}/{{ $plan->id }}">
                                                            Continue
                                                        </a>
                                                    </fieldset>
                                                </div>
                                            </div>
                                            <div class="contact-dec">
                                                <img src="{{ url('assets/images/contact-decoration.png') }}"
                                                    alt="">
                                            </div>
                                        </form>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <?php
        }
    }
    elseif($user->role == 2)
    {    
        ?>
                <div class="col-lg-12 mt-5">
                    <div class="card text-center mt-5 d-flex flex-row align-items-center rounded-4">
                        <div class="card-body col-lg-10 m-5 p-0 text-center">
                            <h2>Welcome, Admin</h2>
                        </div>
                        <div class="card-body col-lg-2 m-5 p-0 text-center">
                            <a href="{{ route('logout') }}">
                                <i class="fa-solid fa-right-from-bracket text-danger" style="font-size: 40px;"></i>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card text-center">
                                <div class="card-header">
                                    <h4 class="card-title">Total Members</h4>
                                </div>
                                <div class="card-body">
                                    <h5 class="text-success">{{ $users }}</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card text-center">
                                <div class="card-header">
                                    <h4 class="card-title">New </h4>
                                </div>
                                <div class="card-body">
                                    <h5 class="text-danger">{{ $user_payments_status_count }}</h5>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card text-center">
                                <div class="card-header">
                                    <h4 class="card-title">Withdrawal Requests</h4>
                                </div>
                                <div class="card-body">
                                    <h5 class="text-danger">
                                        @if ($total_withdraw_amount == 0)
                                            0.00
                                        @else
                                            {{ $total_withdraw_amount }}.00
                                        @endif
                                    </h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card text-center">
                                <div class="card-header">
                                    <h4 class="card-title">Total Earnings</h4>
                                </div>
                                <div class="card-body">
                                    <h5 class="text-success">{{ $total_user_payments }}</h5>
                                </div>
                            </div>
                        </div>
                        <?php
                        // }
                        ?>
                    </div>
                </div>
                <?php
    }
                ?>
                @include('user.inc.footer')

</body>

</html>
