<?php


namespace Models;


class NoteModel
{
    /**
     * @var
     */
    protected $db;

    public function __construct()
    {
        $this->db = new \mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if ($this->db->connect_errno !== 0){
            //TODO log
            throw new \Exception($this->db->connect_error);
        }
    }

    /**
     * return all notes
     * @return array
     */
    public function all(){
        $sql = "SELECT * FROM notes;";
        $result = $this->db->query($sql);
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    /**
     * add new note
     * @param string $noteText
     * @return bool|
     */
    public function add(string $noteText){
        $sql = "INSERT INTO notes (text) VALUES ('$noteText');";
        return $this->db->query($sql);
    }

    /**
     * update note
     * @param string $newNote
     * @param int $index
     * @return bool
     */
    public function update(string $newNote, int $index){
        $sql = "UPDATE notes SET text = '$newNote' WHERE notes.id = '$index';";
        return $this->db->query($sql);
    }

    /**
     * delete note by id
     * @param int $index
     * @return bool
     */
    public function delete(int $index){
        $sql = "DELETE FROM notes WHERE id = {$index};";
        return $this->db->query($sql);
    }

}