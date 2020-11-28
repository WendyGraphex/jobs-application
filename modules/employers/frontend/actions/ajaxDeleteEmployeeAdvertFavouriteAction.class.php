<?php


class employers_ajaxDeleteEmployeeAdvertFavouriteAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
             
            $advert_i18n=new EmployeeAdvertI18n($request->getPostParameter('EmployeeAdvertI18n'));
            if ($advert_i18n->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item = new EmployerFavourite($advert_i18n,$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Favourite is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteEmployeeAdvertFavourite',                             
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


