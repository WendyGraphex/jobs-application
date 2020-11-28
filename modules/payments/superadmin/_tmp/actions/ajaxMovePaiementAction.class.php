<?php

class payments_ajaxMovepaymentAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $response=array();
        try 
        {
            $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);     
            if (!$site)  
               throw new mfException(__("thanks to select a site"));  
            $form=new movePositionForm();
            $form->bind($request->getPostParameter('payment'));
            if ($form->isValid())
            {
                $item=new payment($form->getValue('id'),$site);
                $item->moveTo($form->getValue('node'));
                $item->save();             
                $response=array("action"=>"movepayment","id"=>$item->get('id'),"info"=>__("position is updated."));
            }                
        } 
        catch (mfException $e) 
        {
            $messages->addError($e);
        }
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

