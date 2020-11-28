<?php

class SocialNetworksFormFilter extends mfFormFilterBase {
 
    
    
    function configure()
    {
        $this->setDefaults(array(
                      'order'=>array("position"=>"asc","id"=>"asc","name"=>"asc","created_at"=>"asc","updated_at"=>"asc"),
                      'range'=>array(
                            "created_at"=>array("from"=>SocialNetworkUtils::getMinimumDate('created_at'),"to"=>date("Y-m-d",time()+24*60*60)),
                            "updated_at"=>array("from"=>SocialNetworkUtils::getMinimumDate('created_at'),"to"=>date("Y-m-d",time()+24*60*60))
                       ),
                      'nbitemsbypage'=>"*",
       ));
       // Base Query
       $this->setQuery("SELECT * FROM ".SocialNetwork::getTable().";");
       // Validators 
       $this->setValidators(array(       
            'order' => new mfValidatorSchema(array(
                        "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "position"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "link"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "created_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                        "updated_at"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),
                       ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(   
                            "name"=>new mfValidatorString(array("required"=>false)), 
                            "position"=>new mfValidatorString(array("required"=>false)),
                            ),array("required"=>false)),   
            'equal' => new mfValidatorSchema(array(   
                              "is_active"=>new mfValidatorChoice(array("choices"=>array(""=>"","YES"=>"YES","NO"=>"NO",),"required"=>false,"key"=>true)),
                            ),array("required"=>false)),   
            'range' => new mfValidatorSchema(array(   
                            "created_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),
                            "updated_at"=>new mfValidatorI18nDateRangeCompare(array("required"=>false)),                                                                                  
                            ),array("required"=>false)),           
           'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>"5","10"=>"10","20"=>"20","*"=>"*"))),         
        ));
    }
}




 
class social_networks_ajaxListPartialSocialAction extends mfAction {

    
    function preExecute()
    {
       $this->getResponse()->addJavascript('ui/i18n/jquery.ui.datepicker-'.str_replace('_','-',$this->getUser()->getCulture()).'.js');
    }  
    
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();       
        $this->formFilter= new SocialNetworksFormFilter();
        $this->pager=new Pager('SocialNetwork');
        try
        {
               $this->formFilter->bind($request->getPostParameter('filter'));
               if ($this->formFilter->isValid()||$request->getPostParameter('filter')==null)
               {    
                $this->pager->setQuery($this->formFilter->getQuery()); 
                $this->pager->setNbItemsByPage($this->formFilter['nbitemsbypage']);
                                
                $this->pager->setPage($request->getGetParameter('page'));
                $this->pager->execute();              
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
    }
    
}    