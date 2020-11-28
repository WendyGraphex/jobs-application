<?php

require_once __DIR__."/../locales/Forms/CopyPicturesForm.class.php";

class site_gallery_ajaxCopyPicturesAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {   
            $form=new CopyPicturesForm($request->getPostParameter('SiteGalleryPicturesCopy'));
            $form->bind($request->getPostParameter('SiteGalleryPicturesCopy'));
            if ($form->isValid())
            {    
                
                PictureUtils::copyPicturesI18nToLangugages($form->getPicturesI18n(),$form->getLanguages());
                $response=array(
                    'action'=>'CopyPictures',
                    'info'=>format_number_choice('[0]no picture copied.|[1]one picture copied.|(1,Inf]%s pictures copied.',$form->getPicturesI18n()->count(),$form->getPicturesI18n()->count())
                       );
            }   
            else
            {
                $messages->addError(__("Form has some errors."));
                //var_dump($form->getErrorSchema()->getErrorsMessage());
            }     
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

