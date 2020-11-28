<?php


class cms_pages_ajaxGetChildrenMenuAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {              
          $this->item_i18n= new  CmsMenuI18n($request->getPostParameter('CmsMenuI18n'));         
          if ($this->item_i18n->getMenu()->isNotLoaded()) 
              throw new mfException(__('Menu is invalid'));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      } 
    }

}



