<?php


 require_once dirname(__FILE__)."/../locales/Forms/EmployeeGraduateDiplomaViewForm.class.php";
 
class  employees_ajaxSaveGraduateI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new EmployeeGraduateDiplomaViewForm($request->getPostParameter('EmployeeGraduateDiplomaI18n'));                 
        try
        {   
                     
            $this->item_i18n=new EmployeeGraduateDiplomaI18n($this->form->getDefault('graduate_i18n'));               
            $this->form->bind($request->getPostParameter('EmployeeGraduateDiplomaI18n'),$request->getFiles('EmployeeGraduateDiplomaI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForGraduateDiplomaI18n());
                $this->item_i18n->getGraduate()->add($this->form->getValuesForGraduateDiploma());  
                if ($this->item_i18n->getGraduate()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Employee Graduate Diploma already exists"));                              
                $this->item_i18n->getGraduate()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Employee Graduate Diploma has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialGraduate');
            }   
            else
            {                    
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getGraduate()->add($this->form->getValuesForGraduateDiploma());
               $this->item_i18n->add($this->form->getValuesForGraduateDiplomaI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

