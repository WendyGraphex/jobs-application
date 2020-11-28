<?php


class EmployeeAdvertCommentCollection extends CustomerAdvertCommentCollection {
    
    protected $employer_user=null;
    
    function __construct($data) {
        if ($data instanceof EmployerUser)
        {
          $this->employer_user=$data;
          return parent::__construct(null);    
        }   
        parent::__construct($data);
    }
    
    function getEmployerUser()
    {
       return $this->employer_user;
    }
    
    function getAll()
    {
        
    }
    
}
