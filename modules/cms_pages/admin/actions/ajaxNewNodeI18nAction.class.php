<?php

require_once __DIR__."/../locales/Forms/Menu/CmsMenuNodeNewForm.class.php";
require_once __DIR__."/../locales/Forms/Menu/CmsMenuNodeForm.class.php";

class cms_pages_ajaxNewNodeI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
        $form=new CmsMenuNodeForm(); //$this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('CmsMenu'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialMenu');  
        }             
                       
        $this->item_i18n=new CmsMenuI18n($form->getLanguage());                
        $this->form = new CmsMenuNodeNewForm($form->getLanguage());   
        $this->node = $form->getNode();       
    }
}
