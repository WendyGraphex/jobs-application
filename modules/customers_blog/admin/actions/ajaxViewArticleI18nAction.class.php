<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogArticleViewForm.class.php";
 
class customers_blog_ajaxViewArticleI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new CustomerBlogArticleViewForm();
        $this->article_i18n=new CustomerBlogArticleI18n($request->getPostParameter('CustomerBlogArticleI18n'));        
   }

}

