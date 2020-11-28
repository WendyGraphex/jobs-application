<?php


class employers_ajaxSaveEmployeeAdvertFavouriteAction extends mfAction {
    
     
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
            $item->save(); 
            $response=array('action'=>'SaveEmployeeAdvertFavourite',                                                         
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


