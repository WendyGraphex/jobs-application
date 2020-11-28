<?php


class tests_googlemapAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
      
        $googlemap_api=new GoogleMapApi();
        
        echo $googlemap_api->getCoordinatesFromAddress("rue du bois"); // saint jacques sur darnetal");
        return mfView::NONE;
    } 
}

