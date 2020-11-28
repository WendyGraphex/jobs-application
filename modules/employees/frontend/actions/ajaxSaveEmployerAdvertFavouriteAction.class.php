<?php


class employees_ajaxSaveEmployerAdvertFavouriteAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {    
            if (!$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();  
            
            $advert_i18n=new EmployerAdvertI18n($request->getPostParameter('EmployerAdvertI18n'));
            if ($advert_i18n->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item = new EmployeeFavourite($advert_i18n,$this->getUser()->getGuardUser());
            $item->save(); 
            $response=array('action'=>'SaveEmployerAdvertFavourite',                                                         
                           );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


