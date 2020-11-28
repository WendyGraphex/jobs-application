<?php

require_once __DIR__."/../locales/Forms/SiteCompanyForm.class.php";

class site_company_ajaxSaveAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
       
    function execute(mfWebRequest $request) 
    {             
        $messages = mfMessages::getInstance();
        $this->site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);               
        $this->forwardIf(!$this->site,"sites","Admin");       
        $this->site_company=SiteCompanyUtils::getSiteCompany($this->site);      
        $this->form=new SiteCompanyForm($request->getPostParameter('Company',array('country'=>'FR')));               
        $this->form->bind($request->getPostParameter('Company'),$request->getFiles('Company'));
        if ($this->form->isValid())
        {
            $this->site_company->add($this->form->getValues());
            $this->site_company->set('is_site','YES');
            if ($this->form->hasValue('picture'))
            {
                $file=$this->form->getValue('picture');                
                $file->setFilename($this->site_company->getNameForPicture());                
                $this->site_company->set('picture', $file->getFile());
            }
            $this->site_company->save();
            if ($file)
            {
                $file->save($this->site_company->getPicture()->getPath()); 
            }                
            $messages->addInfo(__("Company has been saved."));        
            $this->forward('site','ajaxHome');
        }
        else
        {
            $messages->addError(__("Form has some errors."));           
        }  
        
    }

}


