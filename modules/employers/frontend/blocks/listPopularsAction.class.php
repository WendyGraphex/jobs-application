<?php


class employers_listPopularsActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');      
        $this->employers=EmployerUserUtils::getPopulars($this->getUser()->getLanguage());                           
        //echo "<pre>"; var_dump($this->employers[9]);die(__METHOD__);
    } 
    
    
}