<?php


namespace Controllers;

use Core\View;

abstract class AbstractController
{
    /**
     * @var View
     */
    protected $view;

    public function __construct()
    {
        $this->view = new View();
    }

    abstract public function index();
}