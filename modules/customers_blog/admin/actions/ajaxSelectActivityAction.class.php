<?php



class customers_blog_ajaxSelectActivityAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();                     
        $this->item=new CustomerBlogActivity($request->getPostParameter('CustomerBlogActivityNode'));         
    }
}

