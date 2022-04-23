<?php

namespace Controllers;

use Core\View;

class Index
{
    protected $view;

    public function __construct()
    {
        $this->view = new View();
    }

    public function index(){
        $this->view->render('index_index_page');
    }

}