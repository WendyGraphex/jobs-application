<?php


class employers_ajaxDeleteAdvertDocumentProfileAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
            $employer_user=$this->getUser()->getStorage()->read('post_a_job_employer_user');    
            if (!$employer_user)
                 $this->forwardTo401Action();         
            $item = new EmployerAdvertDocument($request->getPostParameter('EmployerAdvertDocument'),$employer_user);
            if ($item->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteAdvertDocumentProfile',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


