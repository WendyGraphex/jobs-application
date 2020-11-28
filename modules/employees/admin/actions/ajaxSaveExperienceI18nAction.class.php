<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployeeExperienceViewForm.class.php";
 
class  employees_ajaxSaveExperienceI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployeeExperienceViewForm($request->getPostParameter('EmployeeExperienceI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployeeExperienceI18n($this->form->getDefault('experience_i18n'));               
            $this->form->bind($request->getPostParameter('EmployeeExperienceI18n'),$request->getFiles('EmployeeExperienceI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForExperienceI18n());
                $this->item_i18n->getExperience()->add($this->form->getValuesForExperience());  
                if ($this->item_i18n->getExperience()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Experience already exists"));                 
                $this->item_i18n->getExperience()->setIcon($this->form->getIcon());             
                $this->item_i18n->getExperience()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Experience has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialExperience');
            }   
            else
            {                    
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getExperience()->add($this->form->getValuesForExperience());
               $this->item_i18n->add($this->form->getValuesForExperienceI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

