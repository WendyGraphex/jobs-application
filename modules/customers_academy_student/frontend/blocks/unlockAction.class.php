<?php


class customers_academy_student_unlockActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->user=$this->getUser();      
        $this->settings=new CustomerAcademyStudentUserSettings();     
    } 
    
    
}