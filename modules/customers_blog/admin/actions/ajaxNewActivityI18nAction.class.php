<?php

require_once __DIR__."/../locales/Forms/CustomerBlogActivityNewForm.class.php";
require_once __DIR__."/../locales/Forms/CustomerBlogActivityNodeForm.class.php";

class customers_blog_ajaxNewActivityI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
        $form=new CustomerBlogActivityNodeForm(); //$this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('CustomerBlogActivityNode'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialActivity');  
        }             
        $this->item_i18n=new CustomerBlogActivityI18n(array('lang'=>$form->getLanguage()->get('code'))); 
        $this->form = new CustomerBlogActivityNewForm($form->getNode(),$form->getLanguage()->get('code'));   
        $this->node = $form->getNode();       
    }
}
