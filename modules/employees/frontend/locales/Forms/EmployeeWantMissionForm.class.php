<?php

require_once __DIR__."/EmployeeWantMission/EmployeeCoordinatesWantMissionForm.class.php";
require_once __DIR__."/EmployeeWantMission/EmployeeAdvertWantMissionForm.class.php";
require_once __DIR__."/EmployeeWantMission/EmployeeAdvertsI18nWantMissionForm.class.php";

class EmployeeWantMissionForm extends mfForm {
    
    protected $user=null;
    
    function __construct($user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    function configure()
    {        
        $this->embedForm('coordinates', new EmployeeCoordinatesWantMissionForm($this->getUser()));
        $this->embedForm('advert', new EmployeeAdvertWantMissionForm());
        $this->embedFormForEach('adverts_i18n', new EmployeeAdvertsI18nWantMissionForm(),$this->getLanguages()->count());
    }
    
    function getLanguages()
    {
        return LanguageUtils::getActiveLanguagesFrontend();
    }
}

