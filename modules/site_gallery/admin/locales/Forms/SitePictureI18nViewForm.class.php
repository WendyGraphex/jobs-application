<?php


class SitePictureI18nViewForm extends SitePictureI18nBaseForm {
    
     
    
    function configure()
    {             
        parent::configure();
        $this->setValidator('name', new mfValidatorString(array('required'=>false)));     
        $this->setValidator('picture_id',new ObjectExistsValidator('SitePicture',array('key'=>false)));
        unset($this['id']);
    }
    
    
    function getPicture()
    {
        return $this['picture_id']->getValue()->set('name',$this['name']->getValue())->save();
    }
    
    
    function getPictureI18n()
    {
        if ($this->i18n===null)
        {
            $this->i18n=new SitePictureI18n(array('lang'=>$this['lang']->getValue(),'picture_id'=>$this->getPicture()->get('id')));
            $this->i18n->add($this->getValues());
        }
        return $this->i18n;
    }
}


