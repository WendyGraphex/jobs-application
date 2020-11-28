<?php


class SitePictureI18nNewForm extends SitePictureI18nBaseForm {
         
    function configure()
    {
        parent::configure();                
        unset($this['id']);
    }
}

