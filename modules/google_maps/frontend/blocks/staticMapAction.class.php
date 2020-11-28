<?php
 
class google_maps_staticMapActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {                   
        $this->language=$this->getUser()->getCulture();        
        $this->options=$this->getParameter('options');
    }
    
}    