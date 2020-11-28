<?php


require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskEditForm.class.php";

class projects_ajaxSaveEditTaskAction extends mfAction {
                        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isEmployee() && !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
        $this->item=new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser());         
        $this->form= new ProjectTaskEditForm($this->item,$request->getPostParameter('ProjectTask'));  
        if (!$request->getPostParameter('ProjectTask') || $this->item->isNotLoaded())
            return ;
        $this->form->bind($request->getPostParameter('ProjectTask')); 
        if ($this->form->isValid())
        {
            $this->item->add($this->form->getValues());
           // if ($this->item->isExist())
           //         throw new mfException(__('Task already exists.'));              
            $this->item->save();   
            $this->item->getProject()->process();
            $request->addRequestParameter('task', $this->item);
            $this->forward($this->getModuleName(), 'ajaxDisplayTask');
        }   
        else 
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }
    }

}
