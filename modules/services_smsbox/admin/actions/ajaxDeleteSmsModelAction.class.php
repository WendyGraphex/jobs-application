<?php


class services_smsbox_ajaxDeleteSmsModelAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        try 
        {
            $item= new SmsBoxModel($request->getPostParameter('SmsBox'));
            $item->delete();
            $response = array("action"=>"DeleteSmsModel",
                              "info"=>"Le modèle a été supprimée.",
                              "id" =>$item->get('id')); 
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}
