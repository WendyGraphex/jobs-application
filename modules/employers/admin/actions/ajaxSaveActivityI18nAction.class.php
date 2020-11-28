<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployerActivityViewForm.class.php";
 
class  employers_ajaxSaveActivityI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployerActivityViewForm($request->getPostParameter('EmployerActivityI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployerActivityI18n($this->form->getDefault('activity_i18n'));               
            $this->form->bind($request->getPostParameter('EmployerActivityI18n'),$request->getFiles('EmployerActivityI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForActivityI18n());
                $this->item_i18n->getActivity()->add($this->form->getValuesForActivity());  
                if ($this->item_i18n->getActivity()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__(" Activity already exists"));                 
                $this->item_i18n->getActivity()->setIcon($this->form->getIcon());             
                $this->item_i18n->getActivity()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employer Activity has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialActivity');
            }   
            else
            {                    
             //   var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getActivity()->add($this->form->getValuesForActivity());
               $this->item_i18n->add($this->form->getValuesFortActivityI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

