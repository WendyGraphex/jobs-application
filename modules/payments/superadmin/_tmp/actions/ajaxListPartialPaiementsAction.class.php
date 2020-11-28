<?php

class paymentsFormFilter extends mfFormFilterBase {   
    
    function configure()
    {              
       $this->setDefaults(array(
            'order'=>array(
                            "id"=>"asc",                        
            ),
            'search'=>array(
                        
            ),
            'nbitemsbypage'=>"10",
       ));
       $this->setClass('');
       // Validators 
       $this->setQuery("SELECT * FROM ".payment::getTable().";");
       $this->setValidators(array(
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),    
                            "module"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                            "position"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),  
                           ),array("required"=>false)),
            'equal' => new mfValidatorSchema(array(
                            "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),                            
                           ),array("required"=>false)),
         /*   'search' => new mfValidatorSchema(array(
                            "application"=>new mfValidatorChoice(array("choices"=>array(""=>"","admin"=>"admin","frontend"=>"frontend"),"required"=>false)),
                            "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO"),"required"=>false)),
                           ),array("required"=>false)), */
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"))),         
        ));
    }
 
}


class payments_ajaxListPartialpaymentsAction extends mfAction {
    
     const SITE_NAMESPACE = 'system/site';
     
    function execute(mfWebRequest $request) {                      
        $messages = mfMessages::getInstance();       
        $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE); 
        $this->forwardIf(!$site,"sites","Admin");       
        try
        {
            $this->formFilter= new paymentsFormFilter();
            $this->pager=new Pager('payment');    
            $this->formFilter->bind($request->getPostParameter('filter'));
            if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
            {    
                $this->pager->setQuery($this->formFilter->getQuery());
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                $this->pager->setPage($request->getGetParameter('page'));            
                $this->pager->executeSite($site);
            }
            else
            {
              $messages->addErrors(array_merge($this->formFilter->getErrorSchema()->getGlobalErrors(),
                                               $this->formFilter->getErrorSchema()->getErrors()));  
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }  
        // Load static text from each module
        foreach ($this->pager as $payment)
            $payment->loadTextI18nStatic();  
    //    var_dump($this->pager); return mfView::NONE;
    }

}

