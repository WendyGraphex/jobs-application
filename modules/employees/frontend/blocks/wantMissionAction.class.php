<?php

require_once __DIR__."/../locales/Forms/EmployeeWantMissionForm.class.php";

class employees_wantMissionActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {                    
        $this->step=$this->getUser()->getStorage()->read('step','coordinates');
        $this->employee=$this->getUser()->getStorage()->read('employee',new Employee());        
        $this->form = new EmployeeWantMissionForm($this->getUser());
        $this->settings=new SiteSettings();
    } 
    
    
}
