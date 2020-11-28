<?php

 
class payments_ajaxChangeIsActivepaymentAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
          $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);     
          if (!$site)  
               throw new mfException(__("thanks to select a site"));  
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('payment'));
          if ($form->isValid())
          {
             $item= new payment($form->getValue('id'),$site);    
             if ($item->isLoaded())
             {  
                $value=((string)$form['value']=='YES')?"NO":"YES"; 
                $item->set('is_active',$value);
                $item->save();
                // $this->getEventDispather()->notify(new mfEvent($item, 'product.change','change')); 
                $response = array("action"=>"ChangeIsActivepayment","id"=>$item->get('id'),"state" =>$value);
             }
          }               
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

