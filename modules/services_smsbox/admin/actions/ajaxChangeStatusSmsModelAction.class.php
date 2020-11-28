<?php

class services_smsbox_ajaxChangeStatusSmsModelAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
       $messages = mfMessages::getInstance();
        try 
        {

            $form=new ChangeStatusForm();
            $form->bind($request->getPostParameter('SmsBox'));
            if (!$form->isValid())
                throw new mfException("Le formulaire comporte des erreurs.");         
            $item= new SmsBoxModel($form->getValue('id'));

            if ($item->isNotLoaded())
               throw new mfException("Invalide");                               
            $item->set('status',$form->getStatus());
            $response = array("action"=>"ChangeStatusSmsModel",
                              "id"=>$item->get('id'),
                              "state"=>$item->toArrayStatus());
            $item->save();
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response; 
    }

}

