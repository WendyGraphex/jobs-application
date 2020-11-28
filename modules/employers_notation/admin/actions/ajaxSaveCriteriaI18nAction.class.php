<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCriteriaViewForm.class.php";
 
class  employers_notation_ajaxSaveCriteriaI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployerNotationCriteriaViewForm($request->getPostParameter('EmployerNotationCriteriaI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployerNotationCriteriaI18n($this->form->getDefault('criteria_i18n'));               
            $this->form->bind($request->getPostParameter('EmployerNotationCriteriaI18n'),$request->getFiles('EmployerNotationCriteriaI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForCriteriaI18n());
                $this->item_i18n->getCriteria()->add($this->form->getValuesForCriteria());  
                if ($this->item_i18n->getCriteria()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" ContractCriteria already exists"));                 
                $this->item_i18n->getCriteria()->setIcon($this->form->getIcon());             
                $this->item_i18n->getCriteria()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employer Criteria has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCriteria');
            }   
            else
            {                    
              //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getCriteria()->add($this->form->getValuesForCriteria());
               $this->item_i18n->add($this->form->getValuesForCriteriaI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

