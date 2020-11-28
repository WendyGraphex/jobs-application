<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployerLanguageLevelViewForm.class.php";
 
class  employers_ajaxSaveLanguageLevelI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployerLanguageLevelViewForm($request->getPostParameter('EmployerLanguageLevelI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployerLanguageLevelI18n($this->form->getDefault('level_i18n'));               
            $this->form->bind($request->getPostParameter('EmployerLanguageLevelI18n'),$request->getFiles('EmployerLanguageLevelI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForLevelI18n());
                $this->item_i18n->getLevel()->add($this->form->getValuesForLevel());  
                if ($this->item_i18n->getLevel()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" ContractLevel already exists"));                 
                $this->item_i18n->getLevel()->setIcon($this->form->getIcon());             
                $this->item_i18n->getLevel()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employer Language Level has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialLanguageLevel');
            }   
            else
            {                    
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
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

