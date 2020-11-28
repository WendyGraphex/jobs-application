<?php

class EmployeeUserMessageEngine  {
    
    protected $employee_user=null,$debug=false,$settings=null;
   
    function __construct(Employee $employee_user) {
        $this->employee_user=$employee_user;
        $this->settings=new CustomerMessagerSettings();
        $this->debug=false;        
    }
    
    function getSettings()
    {
        return $this->settings;
    }
    
    function getEmployeeUser()
    {
        return $this->employee_user;
    }
    
    function debug()
    {
        $this->debug=true;
        return $this;
    }
    
    function isDebug()
    {
        return $this->debug;
    }
    
    
    function sendFirstMessage()
    {  
        try 
        {     
            $model_i18n = $this->getSettings()->getEmployeeFirstMessageModel();
             $message=mfContext::getInstance()->getComponentController()->getComponentContent('/employees_messager/first', array(
                                'COMMENT'=>false,
                                'employee_user'=>$this->getEmployeeUser(),
                                'model_i18n'=>$model_i18n));    
             if ($this->isDebug())
                 echo $message;
             
             $employee_message = new CustomerEmployeeMessage();
             $employee_message->add(array(
                                 'sender'=>'ADMIN',
                                 'message'=>$message,
                                 'employee_user_id'=>$this->getEmployeeUser(),
                                 'subject'=>$model_i18n->get('subject',__('First message...'))
                                ));
             $employee_message->create();                          
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

