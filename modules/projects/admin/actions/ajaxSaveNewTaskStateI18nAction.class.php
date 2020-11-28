<?php

require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskStateNewForm.class.php";

class projects_ajaxSaveNewTaskStateI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                     
        $messages = mfMessages::getInstance();                                  
        try
        {                  
            $this->form= new ProjectTaskStateNewForm($this->getUser()->getLanguage(),$request->getPostParameter('ProjectTaskState'));             
            $this->item_i18n=new ProjectTaskStateI18n();
            $this->form->bind($request->getPostParameter('ProjectTaskState'),$request->getFiles('ProjectTaskState'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getState()->add($this->form['state']->getValues());
                $this->item_i18n->add($this->form['state_i18n']->getValues());
                if ($this->item_i18n->getState()->isExist())
                    throw new mfException (__("State already exists"));   
                if ($this->form['state']->hasValue('icon'))
                {
                  $iconFile=$this->form['state']['icon']->getValue();                  
                  $this->item_i18n->getState()->set('icon',$iconFile->getFile()); 
                }     
                $this->item_i18n->getState()->save();
                if ($iconFile)
                {
                   $iconFile->save($this->item_i18n->getState()->getIcon()->getPath());  
                }                                                              
                $this->item_i18n->set('state_id',$this->item_i18n->getState());                                    
                if ($this->item_i18n->isExist())
                    throw new mfException (__("State already exists"));                                                                                                                                       
                $this->item_i18n->save();
                $messages->addInfo(__("State has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward('projects','ajaxListPartialTaskState');
            }   
            else
            {               
                // Repopulate
                $this->item_i18n->add($this->form['state_i18n']->getValues());
                $this->item_i18n->getState()->add($this->form['state']->getValues());
                $messages->addError(__("Form has some errors.")); 
               // var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
