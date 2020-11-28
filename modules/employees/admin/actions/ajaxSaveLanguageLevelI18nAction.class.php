<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployeeLanguageLevelViewForm.class.php";
 
class  employees_ajaxSaveLanguageLevelI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployeeLanguageLevelViewForm($request->getPostParameter('EmployeeLanguageLevelI18n'));                 
        try
        {                        
            $this->item_i18n=new EmployeeLanguageLevelI18n($this->form->getDefault('level_i18n'));               
            $this->form->bind($request->getPostParameter('EmployeeLanguageLevelI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForLevelI18n());
                $this->item_i18n->getLevel()->add($this->form->getValuesForLevel());  
                if ($this->item_i18n->getLevel()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" ContractLevel already exists"));                                    
                $this->item_i18n->getLevel()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employee Language Level has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialLanguageLevel');
            }   
            else
            {                    
              //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getLevel()->add($this->form->getValuesForLevel());
               $this->item_i18n->add($this->form->getValuesForLevelI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

