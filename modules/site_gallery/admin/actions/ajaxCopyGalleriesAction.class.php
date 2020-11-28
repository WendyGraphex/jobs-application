<?php

require_once __DIR__."/../locales/Forms/CopyGalleriesForm.class.php";

class site_gallery_ajaxCopyGalleriesAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {   
            $form=new CopyGalleriesForm($request->getPostParameter('SiteGalleryCopy'));
            $form->bind($request->getPostParameter('SiteGalleryCopy'));
            if ($form->isValid())
            {    
                
                SiteGalleryUtils::copyGalleriesI18nToLangugages($form->getGalleriesI18n(),$form->getLanguages());
                $response=array(
                    'action'=>'CopyGalleries',
                    'info'=>format_number_choice('[0]no gallery copied.|[1]one gallery copied.|(1,Inf]%s galleries copied.',$form->getGalleriesI18n()->count(),$form->getGalleriesI18n()->count())
                       );
            }   
            else
            {
                $messages->addError(__("Form has some errors."));
              //  var_dump($form->getErrorSchema()->getErrorsMessage());
            }     
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

