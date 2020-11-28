<?php


 require_once __DIR__."/../locales/Forms/SystemModelTextViewForm.class.php";
 
class  system_texts_ajaxSaveModelI18nAction extends mfAction {
    
    
    
   
        
    function execute(mfWebRequest $request) {                  
        $messages = mfMessages::getInstance();     
        $this->form = new SystemModelTextViewForm($request->getPostParameter('SystemModelTextI18n'));                    
        try
        {            
            $this->item=new SystemModelTextI18n($this->form->getDefault('model_i18n'));               
            $this->form->bind($request->getPostParameter('SystemModelTextI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item->add($this->form['model_i18n']->getValues());
                $this->item->getModel()->add($this->form['model']->getValues());  
                if ($this->item->getModel()->isExist() || $this->item->isExist())
                            throw new mfException (__("Model already exists"));                                                      
                if ($this->item->isNotLoaded())                
                {                           
                    $this->item->set('model_id',$this->item->getModel());                                                                                                                                                             
                }         
                $this->item->getModel()->save();
                $this->item->save();
                $messages->addInfo(__("Model [%s] has been saved.",$this->item->get('value')));
                $request->addRequestParameter('lang',$this->item->get('lang'));
                $this->forward('system_texts','ajaxListPartialModel');
            }   
            else
            {                    
               $messages->addError(__('Form has some errors.'));              
               $this->item->getModel()->add($this->form['model']->getValues());
               $this->item->add($this->form['model_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        $this->country=$this->getUser()->getCountry();
   }

}

