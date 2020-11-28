<?php

 
class SitePictureI18nSaveForm extends SitePictureI18nBaseForm {

    function configure() { 
        parent::configure();
        unset($this['id']);        
        $this->setValidator('picture_id',new SitePictureExistsValidator());
    }
    
}