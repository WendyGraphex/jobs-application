<?php

class MoveActivityForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(
            'node'=>new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false)),
            'sibling_id'=>new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false,'required'=>false,'empty_value'=>null)),
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

class customers_blog_ajaxMoveActivityAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            $form = new MoveActivityForm();
            $form->bind($request->getPostParameter('CustomerBlogActivityPositions'));
            if (!$form->isValid())
                  throw new mfException(__('Form has some errors.'));
            $form->getNode()->moveTo($form->getSibling())
                            ->asPrevSibling()
                            ->save();
            
            
            $response = array("action"=>"MoveActivity");
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
