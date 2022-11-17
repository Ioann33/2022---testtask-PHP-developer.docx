<?php

namespace Models;

class EmailModel extends Model
{
    /**
     * @param $user_id
     * @param $owner
     * @return array|false
     */
    public function getEmails($user_id, $owner = false){
        $sql = "select * from emails where user_id ={$user_id}";
        if (!$owner){
            $sql .= "and public = 1";
        }
        return $this->db->query($sql)->fetchAll();
    }


    /**
     * @param $id
     * @param $email
     * @param $user_id
     * @param $public
     * @return false|\PDOStatement
     */
    public function create($email, $user_id, $public){
        $sql = "insert into emails (email, user_id, public) values ('{$email}', {$user_id}, {$public})";
        return $this->db->query($sql);
    }


    /**
     * @param $id
     * @param $email
     * @param $public
     * @return false|\PDOStatement
     */
    public function update($id, $email, $public){
        $sql = "update emails set email = '{$email}', public = {$public} where id = {$id}";
        return $this->db->query($sql);
    }
}