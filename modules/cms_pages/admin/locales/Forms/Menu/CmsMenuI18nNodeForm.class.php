<?php


class CmsMenuI18nNodeForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'lang'=>new LanguagesExistsValidator(array(),'frontend'), 
            'menu_id'=>new ObjectExistsValidator('CmsMenu',array('key'=>false))
        ));
    }
    
    function getMenuI18n()
    {        
        return $this->i18n=$this->i18n===null?new CmsMenuI18n($this->getValues()):$this->i18n;                
    }
}
