<?php



class SitePictureI18nForGalleryI18nViewForm extends mfForm {
      
   
            
    function configure()
    {
        $this->embedForm('picture_i18n', new SitePictureI18NBaseForm($this->getDefault('picture_i18n')));                       
        $this->embedForm('picture', new SitePictureBaseForm($this->getDefault('picture')));   
        unset($this->picture['height'],$this->picture['width'],$this->picture['is_active'],
              $this->picture_i18n['id'],$this->picture_i18n['lang'],$this->picture['id']);
        $this->picture['name']->setOption('required',false); 
        if (!isset($this->defaults['picture_i18n']['picture']))
            unset($this->picture_i18n['picture']); 
    }
 
}
