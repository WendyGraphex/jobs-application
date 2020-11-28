<?php


 require_once dirname(__FILE__)."/../locales/Forms/SiteWarningViewForm.class.php";
 
class  site_warning_ajaxSaveWarningI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new SiteWarningViewForm($request->getPostParameter('SiteWarningI18n'));                 
        try
        {   
                     
            $this->item_i18n=new SiteWarningI18n($this->form->getDefault('warning_i18n'));               
            $this->form->bind($request->getPostParameter('SiteWarningI18n'),$request->getFiles('SiteWarningI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForWarningI18n());
                $this->item_i18n->getWarning()->add($this->form->getValuesForWarning());  
                if ($this->item_i18n->getWarning()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Warning already exists"));                 
                $this->item_i18n->getWarning()->setIcon($this->form->getIcon());             
                $this->item_i18n->getWarning()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Warning has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialWarning');
            }   
            else
            {                    
               // var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getWarning()->add($this->form->getValuesForWarning());
               $this->item_i18n->add($this->form->getValuesForWarningI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

