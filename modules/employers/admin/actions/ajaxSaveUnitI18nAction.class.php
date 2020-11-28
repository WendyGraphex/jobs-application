<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployerBudgetUnitViewForm.class.php";
 
class  employers_ajaxSaveUnitI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployerBudgetUnitViewForm($request->getPostParameter('EmployerBudgetUnitI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployerBudgetUnitI18n($this->form->getDefault('unit_i18n'));               
            $this->form->bind($request->getPostParameter('EmployerBudgetUnitI18n'),$request->getFiles('EmployerBudgetUnitI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForUnitI18n());
                $this->item_i18n->getUnit()->add($this->form->getValuesForUnit());  
                if ($this->item_i18n->getUnit()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Budget Unit already exists"));                 
                $this->item_i18n->getUnit()->setIcon($this->form->getIcon());             
                $this->item_i18n->getUnit()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Budget Unit has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialUnit');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getUnit()->add($this->form->getValuesForUnit());
               $this->item_i18n->add($this->form->getValuesForUnitI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

