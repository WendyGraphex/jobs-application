<?php

 

class customers_academy_bestSellersActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                     
        $this->tpl=$this->getParameter('tpl','default');       
    } 
    
    
}



