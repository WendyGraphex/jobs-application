<?php

 

class customers_academy_upcomingActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                     
        $this->tpl=$this->getParameter('tpl','default');       
    } 
    
    
}



