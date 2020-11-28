<?php


class SitePictureGalleryChangesIsActiveForm extends mfForm {

    function configure()
    {
       $this->setValidators(array(
           "selection"=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection'))),
           "value"=>new mfValidatorBoolean()
       )); 
       $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'reorganize'))));
    }
    
    function reorganize($validator,$values)
    {      
        $values['value']=$values['value']?"YES":"NO";
        foreach ($values['selection'] as $index=>$item)
        {
            $values['pictures'][$index]['id']=$item;
            $values['pictures'][$index]['is_active']=$values['value'];
        }    
        return $values;
    }
}
