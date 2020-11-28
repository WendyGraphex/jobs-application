<?php

require_once __DIR__."/../locales/Forms/CustomerCourseCategoryNewForm.class.php";
require_once __DIR__."/../locales/Forms/CustomerCourseCategoryNodeForm.class.php";

class customers_academy_ajaxNewCategoryI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
        $form=new CustomerCourseCategoryNodeForm(); //$this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('CustomerCourseCategoryNode'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCategory');  
        }             
        $this->item_i18n=new CustomerCourseCategoryI18n(array('lang'=>$form->getLanguage()->get('code'))); 
        $this->form = new CustomerCourseCategoryNewForm($form->getLanguage()->get('code'));   
        $this->node = $form->getNode();       
    }
}
