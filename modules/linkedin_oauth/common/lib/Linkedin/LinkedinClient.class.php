<?php
//$data['id'], $data['localizedFirstName'], $data['localizedLastName']);
class LinkedinClient{
    private $id, $firstName, $lastName, $profilePicture;
    
    function __construct($data) {
        foreach (array('id','localizedFirstName'=>'firstName','localizedLastName'=>'lastName') as $key=>$field)
        {
            $this->$field=$data[is_numeric($key)?$field:$key];
        }             
    }
    
    function getId(){
        return $this->id;
    }

    function getFirstName(){
       return  $this->firstName;
    }
        
    function getLastName(){
       return $this->lastName;
    }
        
    function getProfilePicture(){
        return $this->profilePicture;
    }

    function __toString(){
        return $this->firstName." ".$this->lastName;
    }

}
