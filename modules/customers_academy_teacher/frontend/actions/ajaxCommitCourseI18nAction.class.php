<?php


class customers_academy_teacher_ajaxCommitCourseI18nAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {           
           if (!$this->getUser()->isTeacherUser())             
            $this->forwardTo401Action();         
            $item = new CustomerAcademyCourseI18n($request->getPostParameter('CustomerAcademyCourseI18n'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Course is invalid.'));
             $item->commit();
            
            $response=array('action'=>'CommitCourseI18n',
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


