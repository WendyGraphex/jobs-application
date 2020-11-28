<?php

require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskPriorityEditForm.class.php";

class projects_ajaxSaveTaskPriorityAction extends mfAction {
    
        
    
        
    function execute(mfWebRequest $request) {                     
        $this->item=new ProjectTask($request->getPostParameter('ProjectTask'),$this->getUser()->getGuardUser());   
        if ($this->item->isNotLoaded())
            return ;
        $this->form= new ProjectTaskPriorityEditForm();  
        $this->form->bind($request->getPostParameter('ProjectTask'));
        if ($this->form->isValid())
        {
            $this->item->add($this->form->getValues());
            $this->item->save();
            $this->forward('projects','ajaxDisplayTaskPriority');
        }   
        else
        {
            $this->item->add($request->getPostParameter('ProjectTask'));
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }

}
