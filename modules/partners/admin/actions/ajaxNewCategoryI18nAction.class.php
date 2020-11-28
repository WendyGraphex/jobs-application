<?php

require_once __DIR__."/../locales/Forms/PartnerWorkCategoryNewForm.class.php";
require_once __DIR__."/../locales/Forms/PartnerWorkCategoryNodeForm.class.php";

class partners_ajaxNewCategoryI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
        $form=new PartnerWorkCategoryNodeForm(); //$this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('PartnerWorkCategoryNode'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCategory');  
        }             
        $this->item_i18n=new PartnerWorkCategoryI18n(array('lang'=>$form->getLanguage()->get('code'))); 
        $this->form = new PartnerWorkCategoryNewForm($form->getNode(),$form->getLanguage()->get('code'));   
        $this->node = $form->getNode();       
    }
}
