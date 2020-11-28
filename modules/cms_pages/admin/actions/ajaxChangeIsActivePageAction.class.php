<?php

class cms_pages_ajaxChangeIsActivePageAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        $form=new ChangeForm();
          $form->bind($request->getPostParameter('Page'));
          if (!$form->isValid())
              throw new mfException(__('Page is invalid.'));
          $item= new CmsPage($form->getValue('id'));    
          if ($item->isNotLoaded())
                throw new mfException(__('Page is invalid.'));
            $item->set('is_active',$form->getToggle())->save();                     
            $response = array("action"=>"ChangeIsActivePage","id"=>$item->get('id'),"value" =>$item->get('is_active'));                                                       
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

