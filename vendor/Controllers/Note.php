<?php


namespace Controllers;


use Core\View;
use Models\NoteModel;

class Note extends AbstractController
{
    /**
     * @var NoteModel
     */
    protected $model;

    public function __construct()
    {
        parent::__construct();
        $this->model = new NoteModel();
    }

    public function index()
    {
        $this->view->render('note_index_page', [
            'notes'=>$this->model->all(),
        ]);
    }

    public function create(){
        $this->view->render('note_create_page',[
            'errors'=>\Route::getErrors()
        ]);
    }

    public function store(){
        $noteText = filter_input(INPUT_POST, 'note');
        $errors = [];
        if (empty($noteText)){
            $errors[]='Note can not be empty';
            \Route::addErrors($errors);
            \Route::redirect($_SERVER['HTTP_REFERER']);
        }
        $this->model->add($noteText);
        \Route::redirect(\Route::url('note'));
    }

    public function update(){
        $oldText = filter_input(INPUT_POST, 'oldNote');
        $index = filter_input(INPUT_POST, 'index');
        $this->view->render('note_update_page', [
            'oldText'=>$oldText,
            'index'=>$index,
        ]);
    }

    public function save(){
        $newNote = filter_input(INPUT_POST, 'note');
        $index = (int) filter_input(INPUT_POST, 'index');
        $this->model->update($newNote, $index);
        \Route::redirect(\Route::url('note'));
    }

    public function delete(){
        $index = (int) filter_input(INPUT_POST, 'index');
        $this->model->delete($index);
        \Route::redirect(\Route::url('note'));
    }
}