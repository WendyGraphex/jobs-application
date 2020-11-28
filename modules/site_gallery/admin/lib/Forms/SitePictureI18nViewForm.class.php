<?php



class SitePictureI18nViewForm extends mfForm {
      
   
            
    function configure()
    {
        $this->embedForm('picture_i18n', new SitePictureI18nBaseForm($this->getDefault('picture_i18n')));               
        unset($this->picture_i18n['id']);
        $this->embedForm('picture', new SitePictureBaseForm($this->getDefault('picture')));   
        unset($this->picture['height'],$this->picture['width'],$this->picture['is_active']);
        $this->picture['name']->setOption('required',false);   
        $this->picture_i18n['picture']->setOption('required',false);   
    }
    
    
    function getDefaultsForPictureI18n()
    {
        return array('lang'=>$this->defaults['picture_i18n']['lang'],
                     'picture_id'=>$this->defaults['picture']['id']);
    }
    
    function getValuesForPictureI18n()
    {
        $values=$this['picture_i18n']->getValue();
        unset($values['picture']);
        return $values;
    }
    
    function getValuesForPicture()
    {
        return $this['picture']->getValue();
    }
 
}
