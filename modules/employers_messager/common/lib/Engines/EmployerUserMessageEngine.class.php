<?php

class EmployerUserMessageEngine extends  mfEmailEngineCore {
    
    protected $employer_user=null,$settings=null;
   
    function __construct(EmployerUser $employer_user) {
        $this->employer_user=$employer_user;
        parent::__construct();
        $this->settings=new CustomerMessagerSettings();
        $this->debug();      
    }
    
    function getSettings()
    {
        return $this->settings;
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
    }
    
     
    
    function sendFirstMessage()
    {  
        try 
        {     
            $model_i18n = $this->getSettings()->getEmployerFirstMessageModel();
             $message=mfContext::getInstance()->getComponentController()->getComponentContent('/employers_messager/first', array(
                                'COMMENT'=>false,
                                'employer_user'=>$this->getEmployerUser(),
                                'model_i18n'=>$model_i18n));    
             if ($this->isDebug())
                 echo $message;
             
             $employer_message = new CustomerEmployerMessage();
             $employer_message->add(array(
                                 'sender'=>'ADMIN',
                                 'message'=>$message,
                                 'employer_user_id'=>$this->getEmployerUser(),
                                 'subject'=>$model_i18n->get('subject',__('First message...'))
                                ));
             $employer_message->create();                          
        } 
        catch (SmartyCompilerException $e)
        {
            trigger_error($e->getMessage());
            throw new mfException(__("Error Syntax in model."));              
        }                      
        catch (mfException $e) {
           throw new mfException(__('Error occurs during message sending.'));
        }  
        return $this;      
    }
    
    
}

