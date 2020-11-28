<?php
 
class google_maps_mapFromAddressActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {                   
        $this->language=$this->getUser()->getCulture();        
        $this->options=$this->getParameter('options');
        $this->address=$this->getParameter('address');
        $this->width=$this->getParameter('width',500);
        $this->height=$this->getParameter('height',380);
        $this->settings=new GoogleMapsSettings();           
    }
    
}    