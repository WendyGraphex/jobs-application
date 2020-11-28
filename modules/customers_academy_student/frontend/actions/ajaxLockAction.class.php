<?php
 

class customers_academy_student_ajaxLockAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        $this->getUser()->getGuardUser()->lock();                        
        return array('action'=>'Lock');
    }
    
   
}


