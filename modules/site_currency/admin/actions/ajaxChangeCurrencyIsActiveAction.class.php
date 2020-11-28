<?php

class site_currency_ajaxChangeCurrencyIsActiveAction extends mfAction {
    
    
     
    function execute(mfWebRequest $request) {       
      $messages = mfMessages::getInstance();   
      try 
      {         
          $form= new ChangeForm();
          $form->bind($request->getPostParameter('SiteCurrencyChangeIsActive'));
          if (!$form->isValid())
               throw new mfException(__('Form has some errors.')) ;
          $currency=new SiteCurrency($form->getValue('id')) ;
          if ($currency->isNotLoaded())
              throw new mfException(__('Currency is invalid.')) ;
          $currency->set('is_active',$form->getToggle())->save();          
             $response = array("action"=>"ChangeCurrencyIsActive",
                               "id"=>$currency->get('id'),
                               "value" =>$currency->get('is_active'));
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

