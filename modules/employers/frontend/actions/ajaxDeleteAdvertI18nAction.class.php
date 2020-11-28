<?php


class employers_ajaxDeleteAdvertI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {   
              if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $item = new EmployerAdvertI18n($request->getPostParameter('EmployerAdvertI18n'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteAdvertI18n',  
                            'number_of_languages'=>$item->getAdvert()->getFormatter()->getNumberOfLanguages()->getChoicesText("[0]no language|[1]one language|(1,Inf]%s languages"),
                            'advert_id'=>$item->getAdvert()->get('id'),
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


