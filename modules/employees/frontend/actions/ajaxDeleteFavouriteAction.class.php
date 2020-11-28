<?php


class employees_ajaxDeleteFavouriteAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $item = new EmployeeFavourite($request->getPostParameter('EmployeeFavourite'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Favourite is invalid.'));
             $item->delete();
            
            $response=array('action'=>'DeleteFavourite',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


