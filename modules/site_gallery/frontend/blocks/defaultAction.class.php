<?php
 
class site_gallery_defaultActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {          
         
        $this->pictures=$this->getParameter('pictures');
 
    }
    
}    