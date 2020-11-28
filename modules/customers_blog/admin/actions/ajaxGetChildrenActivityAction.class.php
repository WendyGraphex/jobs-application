<?php


class customers_blog_ajaxGetChildrenActivityAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {              
          $this->item_i18n= new  CustomerBlogActivityI18n($request->getPostParameter('CustomerBlogActivityI18n'));         
          if ($this->item_i18n->getActivity()->isNotLoaded()) 
              throw new mfException(__('Activity is invalid'));       
      } 
      catch (mfException $e) {
          $messages->addError($e);
      } 
    }

}



