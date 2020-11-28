<?php

 

class employees_displayGalleryActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}