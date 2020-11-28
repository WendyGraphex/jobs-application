<?php


class employees_listPopularsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
        $this->employees=EmployeeUtils::getPopulars($this->getUser()->getLanguage());                           
        //echo "<pre>"; var_dump($this->employers[9]);die(__METHOD__);
    } 
    
    
}