<?php
 
class employers_notation_ajaxDisplayEmployeeNotationForProjectForEmployerAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
       $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployerUser()) 
           $this->forwardTo401Action();
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;     
     /*  echo "<pre>";
        foreach ($this->project->getReviews()->forEmployer() as $category)
        {
           foreach ($category->getCriterias() as $criteria)
           {
                  var_dump($criteria->hasReview());
           }
        } */
    }
}

