<?php

require_once __DIR__."/../locales/Forms/GroupNewForm.class.php";

class users_guard_ajaxSaveNewGroupI18nAction extends mfAction {
    
       
            
    function execute(mfWebRequest $request) {                     
        $messages = mfMessages::getInstance();              
        try
        {      
            $this->form= new GroupNewForm($this->getUser()->getCountry(),$request->getPostParameter('Group'));             
            $this->item_i18n=new GroupI18n();
            $this->form->bind($request->getPostParameter('Group'));
            if ($this->form->isValid())
            {
                //echo "<pre>"; var_dump($this->form['partner_vehicle_i18n']->getValues()); echo "</pre>";
                $this->item_i18n->getGroup()->add($this->form['group']->getValues());
                $this->item_i18n->add($this->form['group_i18n']->getValues());
                if ($this->item_i18n->isExist() || $this->item_i18n->getGroup()->isExist())
                    throw new mfException (__("Group already exists"));  
                $this->item_i18n->getGroup()->save();                                                                                                         
                $this->item_i18n->set('group_id',$this->item_i18n->getGroup());                                                                                                                                                                                    
                $this->item_i18n->save();            
                $messages->addInfo("Group has been created.");
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward('users_guard','ajaxListPartialGroup');  
            }   
            else
            {   
               // echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
                // Repopulate
                $this->item_i18n->add($this->form['group_i18n']->getValues());                               
                $this->item_i18n->getGroup()->add($this->form['group']->getValues());
                $messages->addError("Form has some errors."); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
