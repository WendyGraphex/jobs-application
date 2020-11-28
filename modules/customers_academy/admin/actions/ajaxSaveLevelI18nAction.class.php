<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyLevelViewForm.class.php";
 
class  customers_academy_ajaxSaveLevelI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new CustomerAcademyLevelViewForm($request->getPostParameter('CustomerAcademyLevelI18n'));                 
        try
        {   
                     
            $this->item_i18n=new CustomerAcademyLevelI18n($this->form->getDefault('level_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerAcademyLevelI18n'),$request->getFiles('CustomerAcademyLevelI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForLevelI18n());
                $this->item_i18n->getLevel()->add($this->form->getValuesForLevel());  
                if ($this->item_i18n->getLevel()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" ContractLevel already exists"));                 
                $this->item_i18n->getLevel()->setIcon($this->form->getIcon());             
                $this->item_i18n->getLevel()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('ContractLevel has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialLevel');
            }   
            else
            {                    
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
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

