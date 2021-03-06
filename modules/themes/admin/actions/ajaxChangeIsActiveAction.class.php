<?php
/*
 * Generated by SuperAdmin Generator date : 24/04/13 15:45:29
 */
 
class themes_ajaxChangeIsActiveAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {         
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('Theme'));
          if ($form->isValid())
          {
             
             $item= new ThemeFrontend($form->getValue('id'));              
             if ($item->isLoaded())
             {  
                $value=((string)$form['value']=='YES')?"NO":"YES"; 
                $item->set('is_active',$value);
                $item->save();
                // $this->getEventDispather()->notify(new mfEvent($item, 'product.change','change')); 
                $response = array("action"=>"ChangeIsActiveTheme","id"=>$item->get('id'),"state" =>$value);
             }
          }                  
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

