<?php

class SitePicturesSelectionForm extends mfForm {
    
    protected $gallery_i18n=null;
    
    function __construct(SiteGalleryI18n $gallery_i18n,$defaults = array()) {
        $this->gallery_i18n=$gallery_i18n;
        parent::__construct($defaults, array());
    }
    
    function getGalleryI18n()
    {
        return $this->site_gallery_i18n;
    }
    
    function configure()
    {
         $this->setValidators(array(
             "selection"=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('selection')),array("required"=>false))
             ));
         $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this,'checkAndOrganize'))));
    }
    
    function checkAndOrganize($validator,$values)
    {
        if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
             return $values;   
        if (count($values['selection'])==0)
             return $values;
        return $values; //TO REMOVE        
        // Check si tous les categories existent et ne sont pas dans la products_category (et langue ?)
        $db=mfSiteDatabase::getInstance()      
            ->setParameters(array('gallery_id'=>$this->getGalleryI18n()->get('id'),
                                  'lang'=>$this->getGalleryI18n()->get('lang')))     
            ->setQuery("SELECT ".SitePictureI18n::getTableKey()." FROM ".SitePictureI18n::getTable().
                       " LEFT JOIN ".SitePictureI18n::getOuterForJoin('picture_id').
                       " LEFT JOIN ".SitePictureGallery::getInnerForJoin('picture_id').
                            " AND ".SitePictureGallery::getTableField('gallery_id')."={gallery_id}".
                       " WHERE ".SitePictureGallery::getTableField('picture_id')." IS NULL".
                       " AND ".SitePictureI18n::getTableField('lang')."='{lang}'".
                       " AND ".SitePictureI18n::getTableField('id')." IN ('".implode("','",$values['selection'])."');"
                    )     
            ->makeSqlQuery(); 
        // Liste des ProductCategory à créer
        if ($db->getNumRows()!=count($values['selection']))
             throw new mfValidatorErrorSchema($this->selection,array('selection'=>__("Some pictures don't exist.")));
        $values['selection']=array();
        while (($row=$db->fetchArray()))
        { 
             $values['selection'][]=$row['id'];          
        }                
        return $values;
    }
    
}

