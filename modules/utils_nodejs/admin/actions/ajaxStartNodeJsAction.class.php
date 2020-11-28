<?php

//  nodejs server.js 6969 > /var/www/html/graphex/www/log/node-server.js.log 2>&1 & echo $!

class utils_nodejs_ajaxStartNodeJsAction extends mfAction {
    
    public function execute(mfWebRequest $request) {
        $messages= mfMessages::getInstance();
        try{
               $node=new UtilsNodeJsSettings();               
               if($node->start()->getReturn())
                    $response = array("action"=>"StartNode",
                                      "pid"=>$node->getPID(),
                                      "info"=>__('Server is started, PID: [%s]',$node->getPID()));                
               else
                   $messages->addError(__('Server is not started.'));
               
              
        } catch (mfException $ex) {
            $messages->addError($ex);
        }
         return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}
