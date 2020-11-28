<?php



class SitePictureI18nForm extends SitePictureI18nBaseForm {
      
               
    function configure()
    {
       parent::configure();
       unset($this['id'],$this['picture']);
    }
 
}
