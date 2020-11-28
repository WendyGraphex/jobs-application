<?php


class SitePictureNewForGallery extends mfForm {
    
       
    
    
    function configure()
    {             
       $this->embedForm('picture_i18n', new SitePictureI18nNewForm($this->getDefault('picture_i18n')));           
       $this->embedForm('picture', new SitePictureBaseForm($this->getDefault('picture')));
       $this->picture['name']->setOption('required',false);
       unset($this->picture['id'],$this->picture['height'],$this->picture['width'],$this->picture['is_active'],
             $this->picture_i18n['lang']
               );
    }
}


