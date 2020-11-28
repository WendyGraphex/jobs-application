<?php


class cms_pages_ajaxDeleteMenuAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $menu= new CmsMenu($validator->isValid($request->getPostParameter('CmsMenu')));
          if ($menu->isNotLoaded())
            throw new mfException(__('Menu is invalid.'));
        $menu->delete();
        $response = array("action"=>"DeleteMenu","id" =>$menu->get('id'));          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
