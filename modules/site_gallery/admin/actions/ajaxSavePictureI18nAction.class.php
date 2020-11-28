<?php

require_once __DIR__."/../locales/Forms/SitePictureI18nViewForm.class.php";
 
class site_gallery_ajaxSavePictureI18nAction extends mfAction {
    

    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();      
        try
        {
            $form = new SitePictureI18nViewForm();
            $form->bind($request->getPostParameter('SitePictureI18n'));                          
            if (!$form->isValid())
            {    
               // var_dump($form->getErrorSchema()->getErrorsmessage());
                throw new mfException(__('Form has some errors.'));
            }    
            $form->getPictureI18n()->save();
            $response=array("action"=>"SavePictureI18n",  
                            "title"=>$form->getPictureI18n()->get('title'),    
                            "info"=>__("Picture has been saved."),
                            "id"=>$form->getPicture()->get('id'));           
        }
        catch (mfException $ex)
        {
            $messages->addError($ex);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

