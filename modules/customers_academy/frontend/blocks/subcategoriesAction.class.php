<?php

 

class customers_academy_subcategoriesActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->node=$this->getParameter('node');
        $this->tpl=$this->getParameter('tpl','default');       
    } 
    
    
}



