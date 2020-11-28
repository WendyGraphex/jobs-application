<?php

class customers_blog_ajaxChangeIsActiveActivityAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {        
        $form=new ChangeForm();
        $form->bind($request->getPostParameter('CustomerBlogActivity'));
        if (!$form->isValid())
        {
           // var_dump($form->getErrorSchema()->getErrorsMessage());
             throw new mfException(__('Form has some errors'));    
        }
        $item= new CustomerBlogActivity($form->getValue('id'));    
        if ($item->isNotLoaded())
              throw new mfException(__('Activity is invalid'));       
        $item->set('is_active',$form->getToggle())->save();                
        $response = array("action"=>"ChangeIsActiveActivity","id"=>$item->get('id'),"value" =>$item->get('is_active'));                                              
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


