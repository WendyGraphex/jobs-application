<?php


class tests_emailTestAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {
       // $this->toto='testtoto';
       // var_dump($this->getParameter('test'));
       // var_dump($this->parameters->getVariables());
        $this->parametersToVariables();
    //    var_dump($this->parameters->getVariables()->getAll());
        
    //    foreach ($this->parameters->getVariables()->getAll() as $name=>$value)
    //    {
    //        echo "Name:=".$name." value".$value."<br/>";
    //    }    
    //    var_dump($this->getVariables()) ;
    }
}

