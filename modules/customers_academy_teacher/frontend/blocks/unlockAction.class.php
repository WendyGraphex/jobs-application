<?php


class customers_academy_teacher_unlockActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->user=$this->getUser();      
        $this->settings=new CustomerAcademyTeacherUserSettings();     
    } 
    
    
}