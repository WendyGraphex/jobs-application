<?php


class EmployeeSkillBundling {
    
     function __construct($skill,$number_of_adverts) {
         $this->skill=$skill;
         $this->number_of_employees=new mfInteger($number_of_adverts);
     }
    
    
    function getSkill()
    {
        return $this->skill; 
    }
    
    function getNumberOfEmployees()
    {
        return $this->number_of_employees;
    }
    
    
    function getEmployees()
    {
        return $this->employees=$this->employees===null?new EmployeeCollection():$this->employees;
    }
}
