<?php

class CmsMenuPageI18nForm extends mfForm {

    
    function configure()
    {       
        $this->embedForm('page', new CmsPageForm($this->getDefault('page')) ,array('required'=>false));
        $this->embedForm('page_i18n', new CmsPageI18nForm($this->getDefault('page_i18n')),array('required'=>false));              
    }
             
}

