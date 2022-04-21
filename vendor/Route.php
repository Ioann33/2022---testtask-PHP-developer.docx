<?php


class Route
{
    static public function init(){
        $uri = $_SERVER['REQUEST_URI'];
        $uriComponents = explode('/', $uri);
        array_shift($uriComponents);
        if (count($uriComponents)>2){
            self::notFound();
        }
        $controllerName = 'index';
        $action = 'index';
        if (!empty($uriComponents[0])){
            $controllerName = mb_strtolower(urldecode($uriComponents[0]));
        }
        if (!empty($uriComponents[1])){
            $action = mb_strtolower(urldecode($uriComponents[1]));
        }
        $controllerClass = '\Controllers\\'.mb_ucfirst($controllerName);
        if (!class_exists($controllerClass)){
            self::notFound();
        }
        $controller = new $controllerClass();
        if (!method_exists($controller, $action)){
            self::notFound();
        }
        $controller->$action();




    }

    static public function notFound(){
        http_response_code(404);
        //TODO pretty view for 404 status
        exit();
    }
}