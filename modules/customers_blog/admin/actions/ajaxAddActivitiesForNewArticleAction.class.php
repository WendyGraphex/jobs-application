<?php

require_once __DIR__."/../locales/Forms/CustomerBlogActivitiesAddForNewArticleForm.class.php";
    
 
class customers_blog_ajaxAddActivitiesForNewArticleAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();              
        $this->form=new CustomerBlogActivitiesAddForNewArticleForm($request->getPostParameter('AddActivitiesForArticle'));
        $this->form->bind($request->getPostParameter('AddActivitiesForArticle'));                     
    }

}


