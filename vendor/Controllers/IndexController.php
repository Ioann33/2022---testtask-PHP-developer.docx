<?php

namespace Controllers;

use Core\View;

class IndexController extends Controller
{
    public function index(){
        $this->view->render('index_index_page');
    }
}