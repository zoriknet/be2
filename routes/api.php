<?php

use Illuminate\Http\Request;
Use App\Product;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//Route::get('product/create', 'ProductController@create')->name('product.create');

//Route::get('products', function() {
//    // If the Content-Type and Accept headers are set to 'application/json',
//    // this will return a JSON structure. This will be cleaned up later.
//    return Product::all();
//});

//Route::get('products', 'ProductController@index');
//Route::get('products/{product}', 'ProductController@show');
//Route::post('products', 'ProductController@create');
//Route::put('products/{product}', 'ProductController@update');
//Route::delete('products/{product}', 'ProductController@delete');

Route::get('productsone', 'ProductController@productsone');
Route::get('productstwo', 'ProductController@productstwo');