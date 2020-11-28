<?php

class CreateDatabaseMySqlForm extends mfForm {
    
    function configure()
    {
        $this->setValidators(array(
            'login'=>new mfValidatorString(),
            'password'=>new mfValidatorString(array('required'=>false)),
            'host'=>new mfValidatorString(),     
            'database'=>new mfValidatorString(),     
        ));
    }
}

class site_ajaxCreateDatabaseMySqlServerAction extends mfAction {
    
   
    function execute(mfWebRequest $request)
    {
       
        $messages = mfMessages::getInstance();                                     
        $form=new CreateDatabaseMySqlForm();        
        if ($request->getPostParameter('CreateDatabaseMySql'))
        {
            try 
            {               
                $form->bind($request->getPostParameter('CreateDatabaseMySql'));
                if ($form->isValid())
                {
                    $sql=new mfMySQLDatabase(array('password'=>$form->getValue('password'),
                                                   'host'=>$form->getValue('host'),
                                                   'user'=>$form->getValue('login'), 
                                        ));
                    $sql->connect();
                    $sql->executeQuery(sprintf("CREATE DATABASE IF NOT EXISTS %s;",$form->getValue('database')));                    
                    $response=array(
                        'info'=>__("MySql Server database created.")
                    );
                }                
            }
            catch (mfException $e)
            {
              $messages->addError($e);
            }
       }
       return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
   
}

