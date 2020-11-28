<?php


require_once __DIR__."/../locales/Forms/CustomerBlogActivityViewForm.class.php";

class customers_blog_ajaxViewActivityI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();             
        $this->user=$this->getUser();              
        $this->form = new CustomerBlogActivityViewForm();
        $this->item_i18n=new CustomerBlogActivityI18n($request->getPostParameter('CustomerBlogActivityI18n'));         
    }
}
