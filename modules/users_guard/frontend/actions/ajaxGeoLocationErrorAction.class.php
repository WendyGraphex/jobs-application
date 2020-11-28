<?php

class GeoLocationErrorForm extends mfForm {
    
    function configure()
    {
        $this->setValidators(array(
            'error'=>new mfValidatorString(),            
        ));
    }
}

class users_guard_ajaxGeoLocationErrorAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $form=new GeoLocationErrorForm();
        $form->bind($request->getPostParameter('GeoLocation'));
        if ($form->isValid())
        {            
            $this->getUser()->setLocation(false);            
        }    
    }
    
   
}


