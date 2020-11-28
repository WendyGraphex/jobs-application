<?php

require_once __DIR__."/../locales/Forms/CustomerBlogActivityMenuMoveForm.class.php";

class customers_blog_ajaxMoveActivityMenuAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            $form = new CustomerBlogActivityMenuMoveForm();
            $form->bind($request->getPostParameter('CustomerBlogActivityMenuPositions'));
            if (!$form->isValid())
                  throw new mfException(__('Form has some errors.'));
             $form->getNode()->moveTo($form->getSibling())
                            ->asPrevSibling()
                            ->save();
             
            
            $response = array("action"=>"MoveActivityMenu");
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
