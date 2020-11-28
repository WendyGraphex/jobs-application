<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademySoftwareForCategoryI18nViewForm.class.php";
 
class  customers_academy_ajaxSaveSoftwareI18nForCategoryI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new CustomerAcademySoftwareForCategoryI18nViewForm($request->getPostParameter('CustomerAcademySoftwareI18n'));                 
        try
        {                        
            $this->item_i18n=new CustomerAcademySoftwareI18n($this->form->getDefault('software_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerAcademySoftwareI18n'),$request->getFiles('CustomerAcademySoftwareI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForSoftwareI18n());
                $this->item_i18n->getSoftware()->add($this->form->getValuesForSoftware());  
                if ($this->item_i18n->getSoftware()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Software already exists"));                 
                $this->item_i18n->getSoftware()->setIcon($this->form->getIcon());             
                $this->item_i18n->getSoftware()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Software has been updated.'));              
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $request->addRequestParameter('node',$this->item_i18n->getSoftware()->getCategory());                                           
                $this->forward($this->getModuleName(),'ajaxListPartialSoftwareForCategoryI18n');
            }   
            else
            {                    
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getSoftware()->add($this->form->getValuesForSoftware());
               $this->item_i18n->add($this->form->getValuesForSoftwareI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

