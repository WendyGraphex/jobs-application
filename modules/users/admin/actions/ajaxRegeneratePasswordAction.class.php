<?php

class users_ajaxRegeneratePasswordAction extends mfAction {
    
    
       
    function execute(mfWebRequest $request) {       
        $messages = mfMessages::getInstance();      
        $this->user = new User($request->getPostParameter('id'), 'admin');
        if ($this->user->isLoaded()) {
            $this->password = mfTools::generatePassword(8);
            $this->user->add(array("password" => md5($this->password),"last_password_gen"=>date("Y-m-d H:i:s")));
            $this->user->save();
            try 
            {
                $this->company=SiteCompany::getSiteCompany();             
                if (!$this->company)
                     throw new mfException(__("Company information has to be completed."));              
              //  $this->getMailer()->debug();
                $this->getMailer()->sendMail('users','emailPasswordRegenerated',$this->company->getEmailWithName(), 
                                $this->user->get('email'), __("New password"),$this); 
                $response = array("info" =>__("Email has been sent with new password to (%s).",$this->user->get('email')),
                                  "action"=>"RegeneratePasswordUser",
                                  "params"=>array("id"=>$this->user->get('id'),
                                                "date"=>$this->user->get('last_password_gen')
                                                )
                                 );
            } catch (Exception $e) {
                $messages->addError($e);
            }
        }        
        return $messages->hasErrors() ? array("error" => $messages->getDecodedErrors()) : $response;
    }

}
