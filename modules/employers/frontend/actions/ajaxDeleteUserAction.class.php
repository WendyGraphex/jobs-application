<?php


class employers_ajaxDeleteUserAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
              if (!$this->getUser()->getGuardUser()->isAdmin())
                 $this->forwardTo401Action();                
              $item=new mfValidatorInteger();
              $id=$item->isValid($request->getPostParameter('EmployerUser'));          
              $item= new EmployerUser($id,$this->getUser()->getGuardUser()); 
              if ($item->isNotLoaded())
                  throw new mfException(__('User is invalid.'));
               $item->disable();      
              $response=array('action'=>'DeleteUser','id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


