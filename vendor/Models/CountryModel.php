<?php

namespace Models;

class CountryModel extends Model
{
    /**
     * @return array|false
     */
    public function all(){
        $sql = "SELECT * FROM countries;";
        return $this->db->query($sql)->fetchAll();
    }
}