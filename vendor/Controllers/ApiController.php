<?php

namespace Controllers;

use Facade\Auth;
use Models\CountryModel;
use Models\EmailModel;
use Models\PhoneModel;
use Models\UserModel;

class ApiController
{
    public $userModel;
    public $countryModel;
    public $phoneModel;
    public $emailModel;
    public function __construct()
    {
        $this->userModel = new UserModel();
        $this->phoneModel = new PhoneModel();
        $this->emailModel = new EmailModel();
    }

    public function getAll(){
        $users = $this->userModel->allAvailableUsers();
        header('Content-type: application/json');
        echo json_encode($users);
    }

    public function showUserDetails(){
        $user = $this->userModel->getUserById($_REQUEST['id']);
        $userPhones = $this->phoneModel->getPhones($_REQUEST['id']);
        $userEmails = $this->emailModel->getEmails($_REQUEST['id']);
        $resArr = [
            'user' => $user,
            'emails' => $userEmails,
            'phones' => $userPhones,
        ];
        header('Content-type: application/json');
        echo json_encode($resArr);
    }

    public function getMyContact(){
        $this->countryModel = new CountryModel();
        $user_id = Auth::User();
        $user = $this->userModel->getUserById($user_id);
        $userPhones = $this->phoneModel->getPhones($user_id, true);
        $userEmails = $this->emailModel->getEmails($user_id, true);
        $countries = $this->countryModel->all();
        $resArr = [
            'user' => $user,
            'emails' => $userEmails,
            'phones' => $userPhones,
            'countries' => $countries,
        ];
        header('Content-type: application/json');
        echo json_encode($resArr);
    }

    public function saveMyContact(){
        $user_id = Auth::User();
        $input = json_decode(file_get_contents('php://input'));
        try {
            foreach ($input->phones as $value){
                if (empty($value->number)){
                    continue;
                }
                if ($value->update == 1){
                    $this->phoneModel->update($value->id, $value->number, $value->public);
                }else{
                    $this->phoneModel->create($value->id, $value->number, $user_id, $value->public);
                }
            }
        }catch (\Exception $e){
            echo $e->getMessage();
            http_response_code(400);
            exit();
        }

        try {
            foreach ($input->emails as $value){
                if (empty($value->email)){
                    continue;
                }
                if ($value->update == 1){
                    $this->emailModel->update($value->id, $value->email, $value->public);
                }else{
                    $this->emailModel->create($value->id, $value->email, $user_id, $value->public);
                }
            }
        }catch (\Exception $e){
            echo $e->getMessage();
            http_response_code(400);
            exit();
        }
        $user = $input->user;

        try {
            $this->userModel->updateUser($user_id, $user->firstname, $user->lastname, $user->address, $user->city, $user->country_id, $user->public);
        }catch (\Exception $e){
            echo $e->getMessage();
            http_response_code(400);
            exit();
        }
        http_response_code(200);
        echo 'ok';

    }
}