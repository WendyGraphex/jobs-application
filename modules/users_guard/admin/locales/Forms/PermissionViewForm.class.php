<?php

class PermissionViewForm extends PermissionBaseForm {

    function configure() {       
        parent::configure();
        $this->addValidators(array('title' => new mfValidatorName(),
                                   'lang' =>new LanguagesExistsValidator(array(),'frontend'),
                                   'permission_id'=>new ObjectExistsValidator('Permission',array('application'=>'admin')),
                                   'group_id'=>new mfValidatorChoice(array("required"=>false,"key"=>true,"choices"=>array(0=>"")+PermissionGroupUtils::getPermissionsGroupForI18nSelect())
                                           ))); 
        unset($this['id']);
    }
    
    function getValuesI18n()
    {
       return array('title'=>$this['title']->getValue(),'lang'=>$this['lang']->getValue());    
    }
    
}