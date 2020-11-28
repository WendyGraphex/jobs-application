<?php

require_once __DIR__."/../locales/Forms/CustomerBlogActivityMenuNewForm.class.php";
require_once __DIR__."/../locales/Forms/CustomerBlogActivityMenuNodeForm.class.php";

class customers_blog_ajaxNewActivityMenuI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
        $form=new CustomerBlogActivityMenuNodeForm(); //$this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('CustomerBlogActivityMenuNode'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialActivityMenu');  
        }             
        $this->item_i18n=new CustomerBlogActivityMenuI18n(array('lang'=>$form->getLanguage()->get('code'))); 
        $this->form = new CustomerBlogActivityMenuNewForm($form->getLanguage()->get('code'));   
        $this->node = $form->getNode();       
    }
}
