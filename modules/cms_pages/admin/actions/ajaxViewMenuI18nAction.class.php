<?php

require_once __DIR__."/../locales/Forms/Menu/CmsMenuPageNodeViewForm.class.php";
require_once __DIR__."/../locales/Forms/Menu/CmsMenuNodeForm.class.php";
require_once __DIR__."/../locales/Forms/Menu/CmsMenuI18nNodeForm.class.php";
   
class cms_pages_ajaxViewMenuI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance();                          
        $form= new CmsMenuI18nNodeForm();
        $form->bind($request->getPostParameter('CmsMenuI18n'));
        if (!$form->isValid())
               return ;    
        $this->item_i18n=$form->getMenuI18n();  
        $this->form = new CmsMenuPageNodeViewForm($this->item_i18n);         
    }
}
