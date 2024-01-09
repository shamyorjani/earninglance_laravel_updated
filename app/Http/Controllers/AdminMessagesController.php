<?php

namespace App\Http\Controllers;

use App\Models\AdminMessages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\WithdrawalRequest;
use App\Models\Contact;

class AdminMessagesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        $admin_messages = AdminMessages::all();

        $withdrawal_request_desc_order = WithdrawalRequest::where('username', $user->username)
            ->orderBy('id', 'desc')
            ->limit(4)
            ->get();
        $withdrawal_request_all = WithdrawalRequest::where('status', 0)->get();
        $total_withdraw_requests = WithdrawalRequest::count();
        $total_withdraw_requests_zero = WithdrawalRequest::where('status', 0)->count();
        $contacts = Contact::all();
        $data = compact('contacts', 'user', 'total_withdraw_requests_zero', 'total_withdraw_requests', 'withdrawal_request_all', 'withdrawal_request_desc_order','admin_messages');
        return view('user/admin_messages')->with($data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(AdminMessages $adminMessages)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(AdminMessages $adminMessages)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, AdminMessages $adminMessages)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AdminMessages $adminMessages)
    {
        //
    }
}
