<?php

namespace Models;

class PhoneModel extends Model
{

    /**
     * @param $user_id
     * access specifier
     * @param $owner
     * @return array|false
     */
    public function getPhones($user_id, $owner = false){
        $sql = "select * from phones where user_id ={$user_id}";
        if (!$owner){
            $sql .= "and public = 1";
        }
        return $this->db->query($sql)->fetchAll();
    }

    /**
     * @param $id
     * @param $number
     * @param $user_id
     * @param $public
     * @return false|\PDOStatement
     */
    public function create($id, $number, $user_id, $public){
        $sql = "insert into phones (id , number, user_id, public) values ({$id}, '{$number}', {$user_id}, {$public})";
        return $this->db->query($sql);
    }

    /**
     * @param $id
     * @param $number
     * @param $public
     * @return false|\PDOStatement
     */
    public function update($id, $number, $public){
        $sql = "update phones set number = '{$number}', public = {$public} where id = {$id}";
        return $this->db->query($sql);
    }
}