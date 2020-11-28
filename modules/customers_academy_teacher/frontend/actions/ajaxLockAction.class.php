<?php
 

class customers_academy_teacher_ajaxLockAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        $this->getUser()->getGuardUser()->lock();                        
        return array('action'=>'Lock');
    }
    
   
}


