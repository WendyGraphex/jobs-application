<?php

require_once __DIR__."/../locales/Forms/EmployerAdvertI18nMultipleNewForm.class.php";

class employers_ajaxPostAJobAdvertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();                 
        $this->employer_user=$this->getUser()->getStorage()->read('post_a_job_employer_user');    
        if (!$this->employer_user)
            $this->forwardTo401Action ();
        $this->form = new EmployerAdvertI18nMultipleNewForm($this->employer_user,$request->getPostParameter('EmployerAdvertMultiple'));      
    }
    
   
}


