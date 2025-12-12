<?php

namespace App\Http\Controllers\backEnd;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        $users = User::whereNotIn('role', [1, 2])->orderBy('id', 'desc')->paginate(15);
        return view('backEnd.user.index', compact('users'));
    }

    /**
     * Show the form for creating a new user.
     */
    public function create()
    {
        return view('backEnd.user.create');
    }

    /**
     * Store a newly created user in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users,email',
            'password' => 'required|min:6',
            'role' => 'required|in:3,4',
            'status' => 'required',
        ]);

        $userDataSet = $request->only((new User)->getFillable());
        $userDataSet['password'] = bcrypt($request->password);
        if($userDataSet['role'] == 3){
            $userDataSet['role_name'] = 'volunteer';
        }elseif($userDataSet['role'] == 4){
            $userDataSet['role_name'] = 'judge';
        }
        User::create($userDataSet);
        return redirect()->back()->with('success', 'User created successfully.');
    }

    /**
     * Display the specified user.
     */
    public function show(User $user)
    {
        // return view('backEnd.user.show', compact('user'));
    }

    /**
     * Show the form for editing the specified user.
     */
    public function edit(User $user)
    {
        return view('backEnd.user.edit', compact('user'));
    }

    /**
     * Update the specified user in storage.
     */
    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users,email,' . $user->id,  // Corrected unique rule for email
            'role' => 'required|in:3,4',
            'status' => 'required',
        ]);

        $userDataSet = $request->only((new User)->getFillable());
        if ($request->filled('password')) {
            $userDataSet['password'] = bcrypt($request->password);
        }else{
            unset($userDataSet['password']);
        }
        if($userDataSet['role'] == 3){
            $userDataSet['role_name'] = 'volunteer';
        }elseif($userDataSet['role'] == 4){
            $userDataSet['role_name'] = 'judge';
        }
        $user->update($userDataSet);

        return redirect()->route('users.index')->with('success', 'User updated successfully.');
    }

    /**
     * Remove the specified user from storage.
     */
    public function destroy(User $user)
    {
        $user->delete();
        return redirect()->route('users.index')->with('success', 'User deleted successfully.');
    }
}
