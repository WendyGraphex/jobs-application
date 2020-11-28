<?php


class employers_alert_ajaxDeleteAlertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $item = new EmployerAlert($request->getPostParameter('EmployerAlert'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Alert is invalid.'));
             $item->delete();
            
            $response=array('action'=>'DeleteAlert',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


