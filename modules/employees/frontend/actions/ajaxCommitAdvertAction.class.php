<?php


class employees_ajaxCommitAdvertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {                       
            $item = new EmployeeAdvert($request->getPostParameter('EmployeeAdvert'));
            if ($item->isNotLoaded())
                throw new mfException(__('Advert is invalid.'));
            $item->commit();
            
            $response=array('action'=>'CommitAdvert',
                            'committed_at'=>$item->getFormatter()->getCommittedAt()->getText(),
                            'state'=>$item->getStateI18n(),
                            'state_i18n'=>__('Approval'),
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


