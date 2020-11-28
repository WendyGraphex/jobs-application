<?php

require_once __DIR__."/../locales/Forms/GoogleMapCalculateCoordinatesForm.class.php";

class google_maps_ajaxCalculateCoordinatesAction extends mfAction {

   
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();                     
     
      try 
      {       
           $response=array('action'=>'CalculateCoordinates');
           $form=new GoogleMapCalculateCoordinatesForm();
           $form->bind($request->getPostParameter('GoogleMapAddress'));
           if (!$form->isValid())
                throw new mfException(__('Form has some errors.'));
            $log=new GoogleMapAddress();             
            $api=new GoogleMapApi();
            if ($api->getCoordinatesFromAddress($form->getValue('address')))
            {                     
               $response['info']=__("latitude [%s] longitude [%s]",array($api->getLatitude(),$api->getLongitude()));
            }   
            else
            {                                  
               $response['error']=__("Error: %s",$api->getError());
            }   
            $log->record($api);       
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;

    }

}

