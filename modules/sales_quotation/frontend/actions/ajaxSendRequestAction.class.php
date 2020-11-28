<?php

class EmployerAdvertRequestForm extends mfForm {
    
    protected $employer=null;
    
    function __construct(EmployerUser $employer,$defaults = array(), $options = array()) {
        $this->employer=$employer;
        parent::__construct($defaults, $options);
    }
    
    function getEmployer()
    {
        return  $this->employer;
    }
    
    function configure()
    {
        $this->setValidators(array(
            'description'=>new mfValidatorString(),           
        ));
        if ($this->getEmployer()->getNumberOfProjects() > 1 || $this->getEmployer()->getNumberOfProjects()==0)
        {           
             $this->setValidator('projects',new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('projects'))));
        }
    }
    
  /*  function getProject()
    {
        return $this->project=$this->project===null?new EmployerProject($this->getEmployer()):$this->project;
    }*/
    
    function getProjects()
    {      
       return $this->_projects=$this->_projects===null?EmployerProject::getProjectsForEmployerAndSelection($this->getEmployer(),$this['projects']->getArray()):$this->_projects;
    }
    
    function getDescription()
    {
        return $this['description']->getValue();
    }
}
 
class sales_quotation_ajaxSendRequestAction extends mfAction {
    

    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isEmployerUser() || !$this->getUser()->getStorage()->read('advert_i18n'))  
            $this->forwardTo401Action ();       
        try 
        {    
            $response=array('action'=>'SendRequest');                
            $form = new   EmployerAdvertRequestForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerAdvertRequest'));
            $form->bind($request->getPostParameter('EmployerAdvertRequest'));
            if (!$form->isValid())
            {
               $response['errors']=$form->getErrorSchema()->getErrorsMessage();
               return $response;  
            }            
            
            $quotation_request=new EmployerQuotationRequest($this->getUser()->getStorage()->read('advert_i18n'),$this->getUser()->getGuardUser());            
            $quotation_request->setDescription($form->getDescription());
            $quotation_request->setProjects($form->getProjects());
            $quotation_request->create();
            
            $engine=new EmployerSaleQuotationRequestEmailEngine($quotation_request);
            $engine->sendEmployeeRequest();
            $engine->sendEmployerRequest();
            
            $this->getUser()->getStorage()->remove('advert_i18n');   
            
            
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
         
    }
    
   
}


