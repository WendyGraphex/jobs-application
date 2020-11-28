<?php


class site_gallery_ajaxDeletePictureI18nAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {           
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SitePictureI18n'));
          $picture= new SitePictureI18n($id);           
       //   $picture->delete();   
          $response=array(             
             'id'=>$item->get('id'),
             'info' => __("Picture in %s language has been deleted.",format_language($picture->get('lang'))) 
          );        
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }    
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

