<?php
 
class google_maps_mapOfCompanyActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {                   
        $this->language=$this->getUser()->getCulture();        
        $this->options=$this->getParameter('options');
        $this->company=CompanyUtils::getSiteCompany();     
        $this->width=$this->getParameter('width','500px');
        $this->height=$this->getParameter('height','380px');
        $this->zoom=$this->getParameter('zoom',8);
        $this->settings=new GoogleMapsSettings();        
    }
    
}    