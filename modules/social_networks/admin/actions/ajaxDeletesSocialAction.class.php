<?php

/*
 * Generated by generator date : 28/04/13 21:56:09
 */
 
class social_networks_ajaxDeletesSocialAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();
      try 
      {         
          $itemsValidator=new mfValidatorSchemaForEach(new mfValidatorInteger(),count($request->getPostParameter('selection')));
          $itemsValidator->isValid($request->getPostParameter('selection'));
          $items= new SocialNetworkCollection($request->getPostParameter('selection'));
          $items->delete();          
        //  $this->getEventDispather()->notify(new mfEvent($items, 'taxess.change','delete')); 
          $response = array("action"=>"DeletesSocial","parameters" =>$request->getPostParameter('selection'));
      } 
      catch (mfValidatorErrorSchema $e)
      {
          $messages->addErrors(array_merge($e->getGlobalErrors(),$e->getErrors()));
      }
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

