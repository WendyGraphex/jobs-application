<?php
 
class site_gallery_nivoSliderActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {                   
        $this->pictures=$this->getParameter('pictures');       
    }
    
}    