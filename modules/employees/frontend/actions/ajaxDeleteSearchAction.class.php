<?php


class employees_ajaxDeleteSearchAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $item = new EmployeeAdvertSearch($request->getPostParameter('EmployeeSearch'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Search is invalid.'));
             $item->delete();
            
            $response=array('action'=>'DeleteSearch',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


