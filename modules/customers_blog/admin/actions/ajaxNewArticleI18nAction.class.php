<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogArticleNewForm.class.php";

class customers_blog_ajaxNewArticleI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Article is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialArticle');  
        }       
        $this->form= new CustomerBlogArticleNewForm((string)$form['lang'],array());
        $this->article_i18n=new CustomerBlogArticleI18n(array('lang'=>(string)$form['lang']));        
    }

}
