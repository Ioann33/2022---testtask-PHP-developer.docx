<?php
namespace Facade;
class Auth
{
    public static function User(){
        session_start();
        if (isset($_SESSION['auth_user'])){
            return $_SESSION['auth_user'];
        }else{
            return null;
        }
    }
}