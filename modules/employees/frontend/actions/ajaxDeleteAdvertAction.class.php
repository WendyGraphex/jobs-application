<?php


class employees_ajaxDeleteAdvertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $item = new EmployeeAdvert($request->getPostParameter('EmployeeAdvert'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteAdvert',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


