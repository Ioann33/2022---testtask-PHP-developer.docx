<?php

namespace Models;

class UserModel extends Model
{
    /**
     * @return array|false
     */
    public function allAvailableUsers(){
        $sql = "SELECT id, firstname, lastname FROM users where public = 1;";
        return $this->db->query($sql)->fetchAll();
    }

    /**
     * @param $id
     * @return array|false
     */
    public function getUserById($id){
        $sql = "select u.id as id, u.firstname as uname, u.lastname as usecondname, u.address as address, u.city as city, u.public as public, c.id as country_id, c.name as country from users u left join countries c on u.country_id = c.id where u.id = {$id}";
        return $this->db->query($sql)->fetchAll();
    }

    /**
     * @param $id
     * @param $firstname
     * @param $lastname
     * @param $address
     * @param $city
     * @param $country_id
     * @param $public
     * @return false|\PDOStatement
     */
    public function updateUser($id, $firstname, $lastname, $address, $city, $country_id, $public){
        $sql = "update users set firstname = '{$firstname}', lastname = '{$lastname}', address = '{$address}', city='{$city}', country_id = {$country_id}, public = {$public} where id = {$id}";
        return $this->db->query($sql);
    }

}