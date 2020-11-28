<?php 

class LinkedInOauthData {
    
    
    private $id, $firstName, $lastName, $picture;
    
    function __construct($data) {
        //var_dump($data);
        foreach (array('id','localizedFirstName'=>'firstName','localizedLastName'=>'lastName') as $key=>$field)
        {
            $this->$field=$data[is_numeric($key)?$field:$key];
        };
    }
    
    function getId(){
        return $this->id;
    }
    
    function setId($id){
        $this->id = $id;
    }

    function getFirstName(){
       return  $this->firstName;
    }

    function setFirstName($firstName){
       $this->firstName = $firstName;
    }
        
    function getLastName(){
       return $this->lastName;
    }
 
    function setLastName($lastName){
       $this->lastName = $lastName;
    }
    
    function getPicture(){
        return $this->picture;
    }
    
    function setPicture($picture){
        $this->picture = $picture;
    }

    function __toString(){
        return $this->firstName." ".$this->lastName;
    }
}
