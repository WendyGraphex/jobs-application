<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerActivityNewForm.class.php";

class employers_ajaxSaveNewActivityI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployerActivityNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployerActivityI18n'));             
            $this->item_i18n=new EmployerActivityI18n();
            $this->form->bind($request->getPostParameter('EmployerActivityI18n'),$request->getFiles('EmployerActivityI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getActivity()->add($this->form['activity']->getValues());
                $this->item_i18n->add($this->form['activity_i18n']->getValues());
                 if ($this->item_i18n->getActivity()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getActivity()->setIcon($this->form->getIcon());                
                $this->item_i18n->getActivity()->save();                                                                      
                $this->item_i18n->set('activity_id',$this->item_i18n->getActivity());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Employer Activity has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialActivity');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['activity_i18n']->getValues());
                $this->item_i18n->getActivity()->add($this->form['activity']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
