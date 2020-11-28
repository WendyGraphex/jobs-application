<?php

require_once __DIR__."/../locales/Forms/PartnerWorkCategoryMenuNewForm.class.php";
require_once __DIR__."/../locales/Forms/PartnerWorkCategoryMenuNodeForm.class.php";

class partners_ajaxNewCategoryMenuI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
        $form=new PartnerWorkCategoryMenuNodeForm(); //$this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('PartnerWorkCategoryMenuNode'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCategoryMenu');  
        }             
        $this->item_i18n=new PartnerWorkCategoryMenuI18n(array('lang'=>$form->getLanguage()->get('code'))); 
        $this->form = new PartnerWorkCategoryMenuNewForm($form->getLanguage()->get('code'));   
        $this->node = $form->getNode();       
    }
}
