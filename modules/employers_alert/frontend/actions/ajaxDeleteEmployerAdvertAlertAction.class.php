<?php


class employers_alert_ajaxDeleteEmployerAdvertAlertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
             
            $advert_i18n=new EmployerdvertI18n($request->getPostParameter('EmployerAdvertI18n'));
            if ($advert_i18n->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item = new EmployerAlert($advert_i18n,$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Alert is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteEmployerAdvertAlert',                             
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


