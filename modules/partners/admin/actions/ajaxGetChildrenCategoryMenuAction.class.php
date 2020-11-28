<?php


class partners_ajaxGetChildrenCategoryMenuAction extends mfAction {
                
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {              
          $this->item_i18n= new  PartnerWorkCategoryMenuI18n($request->getPostParameter('PartnerWorkCategoryMenuI18n'));         
          if ($this->item_i18n->getMenu()->isNotLoaded()) 
              throw new mfException(__('Menu is invalid'));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      } 
    }

}



