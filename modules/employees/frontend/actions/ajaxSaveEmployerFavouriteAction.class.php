<?php


class employees_ajaxSaveEmployerFavouriteAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
           if (!$this->getUser()->isEmployee()) 
                 $this->forwardTo401Action();  
             
            $employer_user=new EmployerUser($request->getPostParameter('EmployerUser'));
            if ($employer_user->isNotLoaded())
                throw new mfException(__('Employer is invalid.'));
            $item = new EmployeeFavourite($employer_user,$this->getUser()->getGuardUser());
            $item->save(); 
            $response=array('action'=>'SaveEmployerFavourite',                                                         
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


