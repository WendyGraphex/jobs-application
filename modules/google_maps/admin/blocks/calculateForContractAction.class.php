<?php
 
class google_maps_calculateForContractActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {  
         if (!$this->getUser()->hasCredential(array(array('superadmin','contract_view_googlemap_calculate'))))
                return mfView::NONE;
        $this->settings=new GoogleMapsSettings();           
    }
    
}    