<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogActivityNewForm.class.php";
 
class  customers_blog_ajaxSaveNewActivityI18nAction extends mfAction {
    
   
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();    
         $this->node=new CustomerBlogActivity($request->getPostParameter('CustomerBlogActivity'));
        if ($this->node->isNotLoaded())
            return ;
        $this->form = new CustomerBlogActivityNewForm($this->node,$this->getUser()->getLanguage(),$request->getPostParameter('CustomerBlogActivityI18n'));                    
        try
        {            
            $this->item_i18n=new CustomerBlogActivityI18n() ; //$this->form->getDefault('activity_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerBlogActivityI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['activity_i18n']->getValues());                 
                $this->item_i18n->set('activity_id',$this->form->getActivity());                
                $this->item_i18n->getActivity()->add($this->form['activity']->getValues());                 
                if ($this->item_i18n->getActivity()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Activity already exists"));                                                                                      
                $this->item_i18n->getActivity()->save();
                $this->item_i18n->set('activity_id',$this->item_i18n->getActivity());                      
                $this->item_i18n->save(); 
                $messages->addInfo(__('Activity has been saved.'));             
                $request->addRequestParameter('node',$this->node);
                $request->addRequestParameter('lang',(string)$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialActivity');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->add($this->form['activity_i18n']->getValues());   
               $this->item_i18n->getActivity()->add($this->form['activity']->getValues());              
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

