<?php

namespace Controllers;

use Models\UserModel;

class AuthController
{
    public $authUser;
    public $userModel;

    public function __construct()
    {
        session_start();
        if (isset($_SESSION['auth_user'])){
            $this->authUser = $_SESSION['auth_user'];
        }else{
            $this->authUser = null;
        }
        $this->userModel = new UserModel();
    }
    public function login(){

        $sql = "select * from users where login = '{$_POST['uname']}'";
        $res = $this->userModel->db->query($sql)->fetchObject();
        if (!$res){
            $errors[]="Login didn't match!";
            \Route::addErrors($errors);
            \Route::redirect(\Route::url());
            exit();
        }
        $pass = md5($_POST['pass']);
        $sql .= " and password = '{$pass}'";
        $res = $this->userModel->db->query($sql)->fetchObject();
        if (!$res){
            $errors[]="Password didn't match!";
            \Route::addErrors($errors);
            \Route::redirect(\Route::url());
            exit();
        }
        $_SESSION['auth_user'] = $res->id;
        \Route::redirect(\Route::url());
    }

    public function logout(){
        unset($_SESSION['auth_user']);
        \Route::redirect(\Route::url());
    }
}