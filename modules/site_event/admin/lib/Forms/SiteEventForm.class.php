<?php


 class SiteEventForm extends SiteEventBaseForm {
 
      function configure()
      {
          parent::configure();
          $this->addValidators(array(
              'place_id'=>new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>SiteEventPlace::getActivePlacesForSelect()->unshift(array(''=>__("Select a place")))))
          ));                    
          return $this;
      }
}


