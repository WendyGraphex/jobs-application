<?php

class MoveCategoryForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'node'=>new ObjectExistsValidator('CustomerCourseCategory',array('key'=>false)),
            'sibling_id'=>new ObjectExistsValidator('CustomerCourseCategory',array('key'=>false,'required'=>false,'empty_value'=>null)),
        ));
    }
    
    function getNode()
    {
        return $this['node']->getValue();
    }
    
    function hasSibling()
    {
        return (boolean)$this['sibling_id']->getValue(); 
    }
    
    function getSibling()
    {
        return $this['sibling_id']->getValue();
    }
}

class customers_academy_ajaxMoveCategoryAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            $form = new MoveCategoryForm();
            $form->bind($request->getPostParameter('CustomerCourseCategoryPositions'));
            if (!$form->isValid())
                  throw new mfException(__('Form has some errors.'));
            $form->getNode()->moveTo($form->getSibling())
                            ->asPrevSibling()
                            ->save();
            
            
            $response = array("action"=>"MoveCategory");
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
