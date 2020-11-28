<?php


class CmsPageI18nDialogFormFilter extends mfFormFilterBase {
     
    
    function __construct($language) {       
        $this->language=$language;
        parent::__construct();
    }
        
    
     function getLanguage()
    {
      return $this->language;
    }
    
    function configure()
    {       
        $this->setClass('CmsPage');
        $this->setFields(array(                        
            "meta_title"=>array(
                'class'=>'CmsPageI18n',
                'search'=>array('conditions'=>"(".
                            CmsPageI18n::getTableField('meta_title')." COLLATE UTF8_GENERAL_CI LIKE '%%{meta_title}%%' OR ".
                            CmsPageI18n::getTableField('url')." COLLATE UTF8_GENERAL_CI LIKE '%%{meta_title}%%' OR ".
                            CmsPage::getTableField('name')." COLLATE UTF8_GENERAL_CI LIKE '%%{meta_title}%%' ".
                                ")"
                      ),     
            )
        ));
        $this->setDefaults(array(
            'lang'=>$this->getLanguage(),    
            'order'=>array( "id"=>"asc",
               
            ),
            'search'=>array(
            ),
            'equal'=>array(                         
            ),
            'nbitemsbypage'=>"10",
       ));
       // Base Query
       $this->setQuery("SELECT {fields} ".
                       " FROM ".CmsPage::getTable().
                       " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND lang='{lang}'".
                       " LEFT JOIN ".CmsMenu::getInnerForJoin('page_id').
                  //     " LEFT JOIN ". CmsBlockPage::getInnerForJoin('page_id').
                       " GROUP BY ".CmsPage::getTableField('id').
                       ";");
       // Validators 
       $this->setValidators(array(
            'lang'=>new languagesExistsValidator(array(),'frontend'), 
            'order' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                    
                            "name"=>new mfValidatorChoice(array("choices"=>array("asc","desc"),"required"=>false)),                            
                           ),array("required"=>false)),
            'search' => new mfValidatorSchema(array(
                            "id"=>new mfValidatorInteger(array("required"=>false)), 
                            "name"=>new mfValidatorString(array("required"=>false)), 
                         //   "url"=>new mfValidatorString(array("required"=>false)), 
                            "meta_title"=>new mfValidatorString(array("required"=>false)), 
                           ),array("required"=>false)),
            'equal'=>new mfValidatorSchema(array(                        
                          
                           // "in_block"=> new mfValidatorChoice(array("choices"=>array(""=>"","IS_NOT_NULL"=>__("YES"),"IS_NULL"=>__("NO")),"key"=>true,"required"=>false)),
                           ),array("required"=>false)),
           'range' => new mfValidatorSchema(array(
               
             ),array("required"=>false)),
            'selected' =>new mfValidatorInteger(array('required'=>false)), 
            'nbitemsbypage'=>new mfValidatorChoice(array("choices"=>array("5"=>5,"10"=>10,"20"=>20,"50"=>50,"100"=>100,"500"=>500,"*"=>"*"),"required"=>false)),         
        ));
    }
    
    function getSelected()
    {
        return $this['selected']->getValue();
    }
}

