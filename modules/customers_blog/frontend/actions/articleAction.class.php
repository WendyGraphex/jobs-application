<?php


class customers_blog_articleAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {                    
         $messages = mfMessages::getInstance();              
        $this->article_i18n= new CustomerBlogArticleI18n(array('url'=>new mfString($request->getRequestParameter('url')),'lang'=>$this->getUser()->getLanguage()));                
        $this->forwardif($this->article_i18n->isNotLoaded(),$this->getModuleName(), 'article404');
      
        $this->article_i18n->set('number_of_views',$this->article_i18n->getNumberOfViews() + 1)->save();
    }

}
