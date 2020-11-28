<?php

 

class site_comment_displayGalleryActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}