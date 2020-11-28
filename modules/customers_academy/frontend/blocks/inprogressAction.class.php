<?php

 

class customers_academy_inprogressActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                     
        $this->tpl=$this->getParameter('tpl','default');       
    } 
    
    
}



