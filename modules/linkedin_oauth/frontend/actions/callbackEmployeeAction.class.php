<?php

class linkedin_oauth_callbackEmployeeAction extends mfActions {

    function execute(mfWebRequest $request) {    
        $messages = mfMessages::getInstance();                 
        try 
        {                      
            $api = new LinkedinOauth();
            $api->setCallback($api->getSettings()->getEmployeeUri());
            $api->setCode($request->getGetParameter('code'));
            if(!$api->getToken())
                throw new Exception("-- invalid token --");
            $employee_user = new Employee(array('linkedin_user'=>$api->getMe()->getId()));          
            $employee_user->add(array(
                "firstname" => $api->getMe()->getFirstName(), 
                "lastname" => $api->getMe()->getLastName(),
                "is_locked" => 'NO',               
                    )); 
             $employee_user->validate();
             $api->getPicture($api->getMe());
             //var_dump($api);
           //  var_dump($api->getMe());
             $employee_user->uploadAvatarFromUrl(new LinkedinPicture($api->getMe()->getPicture()));             
             $this->getUser()->signin($employee_user,$request->getIp());
             $this->getEventDispather()->notify(new mfEvent($employee_user, 'employee_user.connected'));
             $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_account')));
        }      
        catch (Exception $e) {     
                 $messages->addError($e);
                 echo "<!-- ".$e->getMessage()." -->";
              //   echo $e->getMessage();
               //             die(__METHOD__);

        }
        $this->forward($this->getModuleName (), 'callbackError');
    }
}




