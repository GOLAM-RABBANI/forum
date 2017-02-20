<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','WelcomeController@index');
Route::get('/search','WelcomeController@search');
Route::get('pages/{slug}','PagesController@getSingle');

Route::post('comments/{post_id}','CommentsController@store');
Route::get('edit','CommentsController@edit');
Route::post('update','CommentsController@update');
Route::post('delete','CommentsController@destroy');

Auth::routes();

Route::get('/home', 'HomeController@index');

Route::resource('admin/posts', 'Admin\\PostsController');

//Route::post('/edit', [
//    'uses' => 'PostController@postEditPost',
//    'as' => 'edit'
//]);