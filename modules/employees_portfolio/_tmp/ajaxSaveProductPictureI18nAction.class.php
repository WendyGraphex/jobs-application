<?php

class ProductPictureI18nViewForm extends mfForm {
    
    protected $picture_i18n=null;
    
    function configure() {
        $this->setValidators(array(
           'title' => new mfValidatorString(),
           'picture_id' => new ObjectExistsValidator('ProductPicture',array()),
           "lang"=> new LanguagesExistsValidator(array(),'frontend'),
        ));
    }
    
    function getPictureI18n()
    {
        return $this->picture_i18n=$this->picture_i18n===null?new ProductPictureI18n(array('picture_id'=>$this['picture_id']->getValue(),'lang'=>(string)$this['lang']->getValue())):$this->picture_i18n;
    }
    
    function getTitle()
    {
        return $this['title']->getValue();
    }
}

class products_ajaxSaveProductPictureI18nAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {       
      $messages = mfMessages::getInstance();   
      try 
      {         
          $form= new ProductPictureI18nViewForm();
          $form->bind($request->getPostParameter('ProductPictureI18n'));
          if (!$form->isValid())
          {
            //  var_dump($form->getErrorSchema()->getErrorsMessage());
               throw new mfException(__('Form has some errors.')) ;
          }     
          $form->getPictureI18n()->set('title',$form->getTitle())->save();      
          $response = array("action"=>"SaveProductPictureI18n",
                               "picture_id"=>$form->getPictureI18n()->get('picture_id'),
                               "title"=>$form->getTitle()
                              );
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
