<?php

 

class employers_displayGalleryActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}