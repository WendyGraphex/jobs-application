<?php

/*
 * Generated by SuperAdmin Generator date : 28/04/13 17:43:38
 */
 
class social_networks_ajaxMoveSocialAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();            
        $response=array();
        try {
                   
            $form=new movePositionForm();
            $form->bind($request->getPostParameter('socialnetwork'));
            if ($form->isValid())
            {
                $item=new SocialNetwork($form->getValue('id'));
                $item->moveTo($form->getValue('node'));
                $item->save();             
                $response=array("action"=>"moveSocialNetwork","id"=>$item->get('id'),"info"=>__("social network has been moved."));
            }               
        } catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

