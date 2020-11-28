<?php

require_once __DIR__."/../locales/Forms/CustomerBlogActivityI18nMultipleNewForm.class.php";



class customers_blog_ajaxSaveNewMultipleActivityI18nAction extends mfAction {
           
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                                             
        try
        {              
            $this->form= new CustomerBlogActivityI18nMultipleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerBlogActivityI18nMultiple'));   
            $this->form->bind($request->getPostParameter('CustomerBlogActivityI18nMultiple'));
            if ($this->form->isValid())
            {    
              //  ProductActivityI18n::create($this->form->getValues(),$this->form->getLanguage());
                $this->form->getCollection()->create();
                $messages->addInfo(__("Activities  has been saved."));
                $request->addRequestParameter('lang',(string)$this->form->getLanguage());
                
                 $request->addRequestParameter('node',$this->form->getNode());
                $request->addRequestParameter('lang',(string)$this->form->getLanguage());
                $this->forward($this->getModuleName(),'ajaxListPartialActivity');
            }   
            else
            {               
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());               
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
        $this->node = $this->form->getNode();  
    }

}

