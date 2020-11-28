<?php

 
class SiteGalleryI18n extends SiteGalleryI18nBase {
       
    static $sliderFields=array('slices'=>'integer','boxCols'=>'integer','boxRows'=>'integer','animSpeed'=>'integer',
                                'pauseTime'=>'integer','startSlide'=>'integer','directionNav'=>'boolean','width'=>'integer',
                                'height'=>'integer',
                                'controlNav'=>'boolean','controlNavThumbs'=>'boolean','pauseOnHover'=>'boolean',
                                'manualAdvance'=>'boolean','randomStart'=>'boolean','is_fullscreen'=>'boolean');
    
  /*  function getOptions($fields=array())
    {
        $options=array();
        foreach ($fields as $name=>$id)
        {
            if (is_numeric($name))
               $name=$id;
            if (isset(self::$sliderFields[$name]))
            {
                switch (self::$sliderFields[$name])
                {
                    case 'integer': $value=intval($this->get($name)); break;
                    case 'boolean': $value=($this->get($name)=='YES')?true:false; break;
                    default: $value=$this->get($name);
                }
                $options[$id]=$value;
            }    
        }    
        return $options;
    }
        
    function  getOptionsJson($fields=array())
    {
        return json_encode($this->getOptions($fields));            
    }
    
    protected function getBooleanForJS($value)
    {
        return $value?"true":"false";
    }
    
    function getAutoloadForJS()
    {
        return $this->getBooleanForJS(($this->get('manualAdvance')=='NO'));
    }
    
    function getControlNavigationThumbsForJS()
    {
      return $this->getBooleanForJS(($this->get('controlNavThumbs')=='YES'));  
    }*/
    
    
    function getPictures()
    {                    
        /* $pictures=array();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array("lang"=>$lang,"name"=>$name))
            ->setObjects(array('SitePictureI18n','SitePictureGallery','SitePicture'))
            ->setQuery("SELECT {fields} FROM ".SitePictureI18n::getTable().
                       " LEFT JOIN ".SitePictureI18n::getOuterForJoin('picture_id')." AND ".SitePictureI18n::getTableField('lang')."='{lang}'".
                       " LEFT JOIN ".SitePictureGallery::getInnerForJoin('picture_id').
                       " LEFT JOIN ".SitePictureGallery::getOuterForJoin('gallery_id').
                       " LEFT JOIN ".SiteGalleryI18n::getInnerForJoin('gallery_id')." AND ".SiteGalleryI18n::getTableField('lang')."='{lang}'".                     
                       " WHERE ".SiteGallery::getTableField('name')."='{name}'".
                       " AND ".SitePictureGallery::getTableField('is_active')."='YES'".
                       " AND ".SiteGalleryI18n::getTableField('is_active')."='YES'".
                       " ORDER BY position ASC ".
                        ";")
            ->makeSiteSqlQuery(); 
       if (!$db->getNumRows())
            return null; 
       while ($item=$db->fetchObjects())
       {
           $pictures[]=$item;
       }        
       return $pictures;     */                       
    }
}



