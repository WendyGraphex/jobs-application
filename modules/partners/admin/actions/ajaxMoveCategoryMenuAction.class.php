<?php

require_once __DIR__."/../locales/Forms/PartnerWorkCategoryMenuMoveForm.class.php";

class partners_ajaxMoveCategoryMenuAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            $form = new PartnerWorkCategoryMenuMoveForm();
            $form->bind($request->getPostParameter('PartnerWorkCategoryMenuPositions'));
            if (!$form->isValid())
                  throw new mfException(__('Form has some errors.'));
             $form->getNode()->moveTo($form->getSibling())
                            ->asPrevSibling()
                            ->save();
             
            
            $response = array("action"=>"MoveCategoryMenu");
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
