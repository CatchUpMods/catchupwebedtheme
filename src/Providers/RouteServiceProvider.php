<?php namespace WebEd\Themes\Sedna\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Routing\Router;

class RouteServiceProvider extends ServiceProvider
{
    protected $namespace = 'WebEd\Themes\Sedna\Http\Controllers';

    public function map(Router $router)
    {
        $router->group(['namespace' => $this->namespace, 'middleware' => 'web'], function (Router $router) {

            $moduleRoute = 'sedna';

            $router->group(['prefix' => $moduleRoute], function (Router $router) use ($moduleRoute) {
                /**
                 * Put some route here
                 */
            });
        });
    }
}
