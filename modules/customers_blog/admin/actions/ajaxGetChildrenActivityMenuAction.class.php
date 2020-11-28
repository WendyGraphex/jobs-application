<?php


class customers_blog_ajaxGetChildrenActivityMenuAction extends mfAction {
                
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {              
          $this->item_i18n= new  CustomerBlogActivityMenuI18n($request->getPostParameter('CustomerBlogActivityMenuI18n'));         
          if ($this->item_i18n->getMenu()->isNotLoaded()) 
              throw new mfException(__('Menu is invalid'));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      } 
    }

}



