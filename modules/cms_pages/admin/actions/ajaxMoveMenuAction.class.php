<?php

require_once __DIR__."/../locales/Forms/Menu/CmsMenuMoveForm.class.php";

class cms_pages_ajaxMoveMenuAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            $form = new CmsMenuMoveForm();
            $form->bind($request->getPostParameter('CmsMenuPositions'));
            if (!$form->isValid())
            {
                var_dump($form->getErrorSchema()->getErrorsMessage());
                  throw new mfException(__('Form has some errors.'));
            }
             $form->getNode()->moveTo($form->getSibling())
                            ->asPrevSibling()
                            ->save();
             
            
            $response = array("action"=>"MoveMenu");
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
