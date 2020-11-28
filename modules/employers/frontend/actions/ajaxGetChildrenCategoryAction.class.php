<?php


class employers_ajaxGetChildrenCategoryAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {              
          $this->item_i18n= new  EmployerWorkCategoryI18n($request->getPostParameter('EmployerWorkCategoryI18n'));         
          if ($this->item_i18n->getCategory()->isNotLoaded()) 
              throw new mfException(__('Category is invalid'));          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      } 
    }

}



