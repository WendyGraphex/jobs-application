<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeGraduateDiplomaNewForm.class.php";

class employees_ajaxSaveNewGraduateI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new EmployeeGraduateDiplomaNewForm($this->getUser()->getLanguage(),$request->getPostParameter('EmployeeGraduateDiplomaI18n'));             
            $this->item_i18n=new EmployeeGraduateDiplomaI18n();
            $this->form->bind($request->getPostParameter('EmployeeGraduateDiplomaI18n'),$request->getFiles('EmployeeGraduateDiplomaI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getGraduate()->add($this->form['graduate']->getValues());
                $this->item_i18n->add($this->form['graduate_i18n']->getValues());
                 if ($this->item_i18n->getGraduate()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                                    
                $this->item_i18n->getGraduate()->save();                                                                      
                $this->item_i18n->set('graduate_id',$this->item_i18n->getGraduate());                                                                                                                                                                                  
                $this->item_i18n->save();
                $messages->addInfo(__("Employee graduate diploma has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialGraduate');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['graduate_i18n']->getValues());
                $this->item_i18n->getGraduate()->add($this->form['graduate']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
