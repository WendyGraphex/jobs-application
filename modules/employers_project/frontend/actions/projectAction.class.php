<?php

// www.project55.net/employer/project/test

class employers_project_projectAction extends mfAction {
    
    function execute(mfWebRequest $request) {                    
      $messages = mfMessages::getInstance();   
      if (!$this->getUser()->isEmployerUser() && !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
      
     $this->project=new EmployerProject(array('url'=>$request->getRequestParameter('url'),
                                              'reference'=>$request->getRequestParameter('reference'),
                                              'lang'=>$this->getUser()->getLanguage()),
                                              $this->getUser()->getGuardUser());     
             
     $this->forwardIf($this->project->isNotLoaded(),$this->getModuleName(),'project404');
     $request->addRequestParameter('project', $this->project);            
     
   //  echo "<pre>"; var_dump($this->project->getI18n());
 
    }
}
