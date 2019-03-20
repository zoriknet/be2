<?php

namespace App\Http\Controllers;
use App\Category;
use App\Product;
use DB;

use Illuminate\Http\Request;

class ProductController extends Controller
{
//    public function create(Request $request)
//    {
//        $product = new Product;
//        $product->title = 'Fitness Tracker';
//        $product->price = 74;
//
//        $product->save();
//
//        $category = Category::find([4]);
//        $product->categories()->attach($category);
//
//        return 'Success';
//    }



    public function productsone()
    {
        $products = DB::select('select products.id, products.title as name, products.price from products, category_product, categories where products.id=category_product.product_id and category_product.category_id=categories.id group by products.id having count(products.id)>1');
        return response()->json(array('items'=>$products), 200);
    }

    public function productstwo()
    {
        $products = DB::select('select distinct
if(p1.title<p2.title,concat(p1.title,\' + \',p2.title),concat(p2.title,\' + \',p1.title)) as fulltitle,
p1.price+p2.price as thesum, 
if(p1.id<p2.id,concat(p1.id,p2.id),concat(p2.id,p1.id)) as checksum
from products p1, products p2, category_product cp1, category_product cp2
where p1.id=cp1.product_id and p2.id=cp2.product_id and cp1.category_id<>cp2.category_id and p1.id<>p2.id
order by thesum desc 
limit 3');
        return response()->json(array('items'=>$products), 200);
    }

    public function index()
    {
        return Product::all();

    }

    public function show($product)
    {
        $product = Product::find($product);
        return $product;
    }

    public function create(Request $request)
    {
        $product = Product::create($request->all());

        return response()->json($product, 201);
    }

    public function update(Request $request, $product)
    {
        $product->update($request->all());

        return response()->json($product, 200);
    }

    public function delete(Request $request, $product)
    {
        $product->delete();

        return response()->json(null, 204);
    }

}
