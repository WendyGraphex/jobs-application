<?php

class users_guard_geolocalisationActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {                     
        if ($this->getUser()->hasLocation())
             return mfView::NONE;
    } 
    
    
}
