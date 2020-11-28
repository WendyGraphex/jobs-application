<?php


class SiteGalleryBaseForm extends mfForm {
    
    function configure()
    {
         $this->setValidators(array(
             "id"=>new mfValidatorInteger(),      
             "name"=>new mfValidatorName(),  
             'component'=>new mfValidatorString(), //
             'template'=>new mfValidatorString(array("required"=>false)), //
             'parameters'=>new mfValidatorJSON(array("required"=>false)), 
             'height'=>new mfValidatorInteger(array('max'=>1000,'min'=>100,'required'=>false,'empty_value'=>"")),//
             'width'=>new mfValidatorInteger(array('max'=>1000,'min'=>100,'required'=>false,'empty_value'=>"")),//
             'effect'=>new mfValidatorString(),       //    
             'slices'=>new mfValidatorInteger(),//
             'boxCols'=>new mfValidatorInteger(),//
             'boxRows'=>new mfValidatorInteger(),//
             'animSpeed'=>new mfValidatorInteger(), //
             'pauseTime'=>new mfValidatorInteger(), //
             'startSlide'=>new mfValidatorInteger(), // Default (position)
             'directionNav'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'controlNav'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'controlNavThumbs'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'pauseOnHover'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'manualAdvance'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'randomStart'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'is_fullscreen'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'is_active'=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")), //
             'start_at'=>new mfValidatorI18nDate(array("date_format"=>"a","required"=>false)),            
             'expired_at'=>new mfValidatorI18nDate(array("date_format"=>"a","required"=>false)),  
         ));    
    }
    
}