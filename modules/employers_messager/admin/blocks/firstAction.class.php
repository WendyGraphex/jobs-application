<?php


class employers_messager_firstActionComponent extends mfActionComponent {

    function execute(mfWebRequest $request)
    {                
           $this->employer=$this->getParameter('employer_user')->getFormatter()->toArrayForEmail();                      
           $this->model_i18n= $this->getParameter('model_i18n');                        
    } 
    
    
}