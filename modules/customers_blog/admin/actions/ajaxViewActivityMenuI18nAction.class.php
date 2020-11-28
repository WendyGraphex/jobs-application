<?php


require_once __DIR__."/../locales/Forms/CustomerBlogActivityMenuViewForm.class.php";

class customers_blog_ajaxViewActivityMenuI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();             
        $this->user=$this->getUser();       
        $this->form = new CustomerBlogActivityMenuViewForm();
        $this->item_i18n=new CustomerBlogActivityMenuI18n($request->getPostParameter('CustomerBlogActivityMenuI18n'));         
    }
}
