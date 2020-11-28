<?php

//www.project55.net/tests/test

class tests_testAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
         
         echo __METHOD__;
      /*  $docx=new MicrosoftDocxExtractor(new File(realpath(__DIR__."/../data/test_cv.docx")),null,array('text'=>true));
        $docx->execute();           
        
      echo  $docx->getText();*/
        try
        {
            $validator=new mfValidatorIntegerRangeCompare(array('min'=>50,'max'=>200));


            var_dump($validator->isValid(array('min'=>60,'max'=>250)));
       
            
        }
        catch (mfValidatorError $ex)
        {
            
            echo "Error:".(string)$ex->getMessage();
        }
      //    var_dump($docx->getPictures());
      //  $doc=new SystemCatDoc(new File(realpath(__DIR__."/../data/test_cv.doc")));
    //    $doc->setOptions("-s cp1252 -d utf-8");
    //   $doc->execute();    
     //   var_dump($doc->getVersion());
       
        die();
    } 
    
    
}

