<?php


class customers_academy_teacher_ajaxPublicCourseDocumentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if ( !$this->getUser()->isTeacherUser())          
                $this->forwardTo401Action();
            $item = new CustomerAcademyCourseDocument($request->getPostParameter('CustomerAcademyCourseDocument'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Course is invalid.'));
            $item->opened();
            
            $response=array('action'=>'PublicCourseDocument',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


