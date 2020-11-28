<?php

class site_gallery_ajaxMoveGalleryPictureAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $response=array();
        try 
        {           
            $form=new MovePositionForm();
            $form->bind($request->getPostParameter('SiteGalleryPicture'));
            if ($form->isValid())
            {
                $item=new SitePictureGallery($form->getValue('id'));
                $item->moveTo($form->getValue('node'));
                $item->save();             
                $response=array("action"=>"MoveGalleryPicture","id"=>$item->get('id'),"info"=>__("Position is updated."));
            }                
        } 
        catch (mfException $e) 
        {
            $messages->addError($e);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

