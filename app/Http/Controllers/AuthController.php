<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Image;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('api');
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {

    	$credentials = $request->only('email', 'password');

    	try {
    	    if (! $token = JWTAuth::attempt($credentials)) {
    	        return response()->json(['error' => 'invalid_credentials'], 400);
    	    }
    	} catch (JWTException $e) {
    	    return response()->json(['error' => 'could_not_create_token'], 500);
    	}

    	return $this->respondWithToken($token);
    	// return response()->json(compact('token'));



        // $credentials = request(['email', 'password']);

        // if (! $token = auth()->attempt($credentials)) {
        //     return response()->json(['error' => 'Unauthorized'], 401);
        // }

        // return $this->respondWithToken($token);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
    	dd(auth()->user());
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            // 'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }

    public function uploadImg(Request $request)
    {
    	dd(Auth::id());
    	$img = $request->image;
    	// dd($credentials);
    	$image = $img;
    	$input['imagename'] = time().'.'.$image->extension();
    	

    	$destinationPath = public_path('/images');
    	$img = Image::make($image->path());
    	
    	// Uploading 64X64 image
    	$img->resize(64, 64, function ($constraint) {
    	    $constraint->aspectRatio();
    	})->save($destinationPath.'/img-64X64/'.$input['imagename']);
    	// Uploading 256X256 image
    	$img->resize(256, 256, function ($constraint) {
    	    $constraint->aspectRatio();
    	})->save($destinationPath.'/img-256X256/'.$input['imagename']);
    	
    	$destinationPath = public_path('/images');
    	$image->move($destinationPath, $input['imagename']);
    	
    	// Image uploaded to user record
    	User::where('id',Auth::id())->update(['image' => $input['imagename']]);


    	return response()->json(['message' => 'Both type of images uploaded successfully']);

    }
}