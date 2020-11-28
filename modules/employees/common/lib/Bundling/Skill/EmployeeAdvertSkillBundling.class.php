<?php


class EmployeeAdvertSkillBundling {
    
     function __construct($skill,$number_of_adverts) {
         $this->skill=$skill;
         $this->number_of_adverts=new mfInteger($number_of_adverts);
     }
    
    
    function getSkill()
    {
        return $this->skill; 
    }
    
    function getNumberOfAdverts()
    {
        return $this->number_of_adverts;
    }
    
    
    function getI18nAdverts()
    {
        return $this->i18n_adverts=$this->i18n_adverts===null?new EmployeeAdvertI18nCollection():$this->i18n_adverts;
    }
}
