<?php
 
class employees_notation_ajaxDisplayEmployerNotationForProjectForEmployeeAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployee()) 
           $this->forwardTo401Action();
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;  
     /*  echo "<pre>"; 
        foreach ($this->project->getEmployeeReviews()->forEmployee() as $category)
        {
         foreach ($category->getCriterias() as $criteria)
         {    
             var_dump($criteria);
         }
        }*/
 
    }
}

