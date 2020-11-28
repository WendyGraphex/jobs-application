<?php

 

class employers_displayPopularAdvertActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');        
        $this->populars = EmployerAdvertPopularUtils::getPopulars();        
    } 
    
    
}