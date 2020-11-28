<?php


class utils_colorpicker_light_miniActionComponent extends mfActionComponent {
     
   
    
    function execute(mfWebRequest $request) 
    {                          
        // var_dump($this->getUser()->getExtendedCulture());
       // var_dump($this->getResponse()->getComponentJavascripts('utils_colorpicker_light/mini'));
         $this->javascripts=$this->getResponse()->getComponentJavascripts('utils_colorpicker_light/mini');   
    }    
                    
}    