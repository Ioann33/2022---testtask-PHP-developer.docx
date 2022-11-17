<?php


namespace Controllers;

use Core\View;

abstract class Controller
{
    /**
     * @var View
     */
    protected $view;
    public function __construct()
    {
        $this->view = new View();
    }
}