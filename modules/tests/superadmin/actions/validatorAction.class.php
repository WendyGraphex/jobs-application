<?php

class tests_validatorAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
      echo __METHOD__;
      
        try
        {
            // $validator=new mfValidatorChoice(array('choices'=>range(2015,2033)));
            // $value=$validator->isValid('2015');
          // echo "Card number=";  var_dump($value);
          //   var_dump($validator->getOption('choices'));
        }
        catch (mfException $e)
        {
            echo "Error=".$e->getMessage();
        }
        return mfView::NONE;
        
    } 
}