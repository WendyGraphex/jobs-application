<?php

require_once __DIR__."/../locales/Forms/GoogleMapCalculateDistanceAndTimeForm.class.php";

class google_maps_ajaxCalculateDistanceAndTimeAction extends mfAction {

   
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();                     
     
      try 
      {       
           $response=array('action'=>'CalculateCoordinates');
           $form=new GoogleMapCalculateDistanceAndTimeForm();
           $form->bind($request->getPostParameter('GoogleMapAddressCoding'));
           if (!$form->isValid())
                throw new mfException(__('Form has some errors.'));
           if ($form->getValue('by_address'))
           {    
                $origin= new CustomerAddress();
                $origin->set('address',$form->getValue('origin'));           
                $destination= new CustomerAddress();
                $destination->set('address',$form->getValue('destination'));
                 $matrix_api=new GoogleMatrixApi(array('key'=>GoogleMapsSettings::load()->get('key')));
                 $itinaries=$matrix_api->getItineraryFromAddresses($origin, $destination);
                 if ($matrix_api->hasErrors())
                     throw new mfException($matrix_api->getErrors());
           }
           else
           {
                $api=new GoogleMapApi();
                if (!$api->getCoordinatesFromAddress($form->getValue('origin')))
                    throw new mfException(__("Error origin")); 
                $origins=new CustomerAddressLocalizationCollection();
                $origin= new CustomerAddressLocalization();
                $origin->add(array('lat'=>$api->getLatitude(),'lng'=>$api->getLongitude()));
                $origins[]=$origin;
                if (!$api->getCoordinatesFromAddress($form->getValue('destination')))
                   throw new mfException(__("Error destination")); 
                $destinations=new CustomerAddressLocalizationCollection();
                $destination= new CustomerAddressLocalization();
                $destination->add(array('lat'=>$api->getLatitude(),'lng'=>$api->getLongitude()));
                $destinations[]=$destination;
                
                $matrix_api=new GoogleMatrixApi(array('key'=>GoogleMapsSettings::load()->get('key')));
                 $itinaries=$matrix_api->getItineraryFromCoordinates($origins, $destinations);
                 if ($matrix_api->hasErrors())
                     throw new mfException($matrix_api->getErrors());
                 //var_dump($itinaries[0]);
                 $response['info']=__("Distance:%s Time:%s",[$itinaries[0]->getDistance(),$itinaries[0]->getTime() ]);
           }    
        //    var_dump($itinaries);
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;

    }

}

