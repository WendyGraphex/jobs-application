<?php

require_once __DIR__."/../locales/Forms/EmployeeWantMission/EmployeeCoordinatesWantMissionForm.class.php";

class employees_wantMissionAction extends mfAction {             
    
    function execute(mfWebRequest $request) {                   
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->form=new EmployeeCoordinatesWantMissionForm($this->getUser());
        $this->employee=new Employee();
        $this->settings=new SiteSettings();
        
         //$this->getController()->setRenderMode(mfView::RENDER_JSON);
       // return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
       
}


