<?php

class GeoLocationForm extends mfForm {
    
    function configure()
    {
        $this->setValidators(array(
            'lat'=>new mfValidatorI18nNumber(array('min'=>-90,"max"=>90)),
            'lng'=>new mfValidatorI18nNumber(array('min'=>-90,"max"=>90))
        ));
    }
}

class users_guard_ajaxGeoLocationAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $form=new GeoLocationForm();
        $form->bind($request->getPostParameter('GeoLocation'));
        if ($form->isValid())
        {            
            $this->getUser()->setLocation($form->getValues());
        }    
    }
    
   
}


