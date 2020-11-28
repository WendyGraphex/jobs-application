<?php

require_once __DIR__."/../locales/Forms/CustomerBlogActivityI18nMultipleNewForm.class.php";
require_once __DIR__."/../locales/Forms/CustomerBlogActivityNodeForm.class.php";


class customers_blog_ajaxNewMultipleActivityI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new CustomerBlogActivityNodeForm(); 
        $form->bind($request->getPostParameter('CustomerBlogActivityNode'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__("Language is not valid."));
         //   $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialActivity');  
        }                    
        $this->node = $form->getNode();  
        $this->form= new CustomerBlogActivityI18nMultipleNewForm($form->getLanguage());       
    }

}

