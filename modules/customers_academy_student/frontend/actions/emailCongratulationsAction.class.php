<?php


class customers_academy_student_emailCongratulationsAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {                 
           $this->user=$this->getParameter('user')->getFormatter()->toArrayForEmail();
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');    
            $this->token=$this->getParameter('token')->toArrayForEmail();   
    }
    
 
   
}


