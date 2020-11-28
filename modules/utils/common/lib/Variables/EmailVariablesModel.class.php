<?php

class EmailVariablesModel {
    
    
    static function getVariables(mfAction $action)
    {
       $action->links=array('invite_freelancer'=>link_i18n("employees_invitation_invitation"),
                            'invite_employer'=>link_i18n("employers_invitation_invitation"),
                            'login_employer'=>link_i18n("employers_login")
                            
           ); 
       if ($have_question=CmsPageI18nUtils::getPageByNameandLang('have_question',$action->getUser()->getLanguage()))
            $action->links['have_question']=$have_question->getUrl();
       $action->socials=SocialNetworkUtils::getActiveCollectionByPosition()->toArray();            
    }
    
    
    static function getEventVariables(mfAction $action)
    {
        
       
       $action->socials=SocialNetworkUtils::getActiveCollectionByPosition()->toArray();            
    }
    
}
