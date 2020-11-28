<?php


 require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskStateViewForm.class.php";
 
class  projects_ajaxSaveTaskStateI18nAction extends mfAction {
    
   
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new ProjectTaskStateViewForm($request->getPostParameter('ProjectTaskStateI18n'));                    
        try
        {            
            $this->item_i18n=new ProjectTaskStateI18n($this->form->getDefault('state_i18n'));               
            $this->form->bind($request->getPostParameter('ProjectTaskStateI18n'),$request->getFiles('ProjectTaskStateI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['state_i18n']->getValues());
                $this->item_i18n->getState()->add($this->form['state']->getValues());  
                if ($this->item_i18n->getState()->isExist() || $this->item_i18n->isExist())
                            throw new mfException (__("State already exists"));                                                      
                if ($this->item_i18n->isNotLoaded())                
                {                           
                    $this->item_i18n->set('state_id',$this->item_i18n->getState());  
                    if ($this->form['state']->hasValue('icon'))
                    {
                        $iconFile=$this->form['state']['icon']->getValue();     
                        $this->item_i18n->getState()->set('icon',$iconFile->getFilename()); 
                        if ($iconFile)
                        {
                           $iconFile->save($this->item_i18n->getState()->getIcon()->getPath());  
                        }                               
                    }                                                                                                                                              
                }         
                $this->item_i18n->getState()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('State has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward('projects','ajaxListPartialTaskState');
            }   
            else
            {                    
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getState()->add($this->form['state']->getValues());
               $this->item_i18n->add($this->form['state_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

