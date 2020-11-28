{messages}
<fieldset>
{*<div class="row" style="margin: 0;">
    <div class="col-sm-6 site-applications-header" style="padding: 0;">
        <h3 style="line-height: 60px; font-size: 25px; font-family: Lato; display: table-cell; vertical-align: middle; color: rgb(101, 109, 120);">{__("My company")}</h3>
    </div>
    <div class="col-sm-6 site-applications-header" style="padding: 0;">
        <div style="padding: 0;">
            <a class="btn btn-primary" href="#" id="Save" style="display:none; border-radius: 0; margin-top: 10px; float: right;"><i class="fa fa-floppy-o" style="margin-right:10px;"></i>{__('Save')}</a>
        </div>
    </div>
</div>*}
<div class="row admin-header-container">
    <div class="col-sm">
      <h3 class="admin-header-big-text">{__('My company')}</h3>
    </div>
    <div class="col-sm" style="padding: 0;">
        <div style="float: right;"> 
            <a class="btn btn-primary" href="#" id="Save" style="display:none; border-radius: 0; margin-top: 10px; float: right;"><i class="fa fa-floppy-o" style="margin-right:10px;"></i>{__('Save')}</a>
        </div> 
    </div>
  </div>


<div class="page-ticket" style="background-color: white; height: 40px; padding-left: 20px; display: table;
     width: 100%; text-align: left; margin-bottom: 15px;">
    <p style="display: table-cell; vertical-align: middle; font-size: 0.7em; color: #a9b2bd;">
        <i class="fa fa-home" style="color: #37bc9b;"></i>
        <i class="fa fa-angle-right" style="margin: 0 5px 0 5px; font-size: 1em;"></i>{__("Company")}
    </p>
</div>
    <div style="width: 100%; background-color: white; padding: 20px;" class="tab-form" id="Company-form" cellpadding="0" table-column="2" cellspacing="0">
        
        <div class="row">
            <div class="col-md-2">
                {*{if $site_company->isLoaded()}
                    <div class="form-group">
                        <label>{__('Picture')}</label>          
                           <img height="128" width="128" style="display:block"  id="pictureImg" {if $site_company->get("picture")}src='{$site_company->getPicture()->getUrl()}' alt="{__('my picture')}{else}style="display:none"{/if}"/>                 
                                <a id="pictureDelete" class="btn btn-default" href="#" {if !$site_company->get("picture")}style="display:none"{/if}><img src="{url('/icons/delete.gif','picture')}" alt="{__('delete')}"/>{__('delete')}</a>


                           <a id="pictureChange" class="btn btn-default" href="#" {if !$site_company->get("picture")}style="display:none"{/if}><img  src="{url('/icons/edit.gif','picture')}" alt="{__('change')}"/>{__('change picture')|capitalize}</a>
                           <a id="pictureAdd" href="#" class="btn btn-default" {if $site_company->get("picture")}style="display:none"{/if}><i class="fa fa-plus" style="margin-right:10px;"></i>{*<img  src="{url('/icons/add.gif','picture')}" alt="{__('edit')}"/>*}{__('add picture')|capitalize}</a> 

                           {*<div id="pictureForm" style="display:none">
                                 <input id="pictureFile" type="file" name="Company[picture]"/> 
                                 <a href="#" id="pictureUpload"><img src="{url('/icons/upload.png','picture')}" alt="{__('Upload')}"></a>
                                 <img id="pictureLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                           </div>    
                   </div>
                   {else}
                     <div class="form-group">
                        <label>{__('Picture')}</label>                  
                           <div id="pictureForm">
                                 <input id="pictureFile" type="file" class="files" name="Company[picture]"/>
                           </div>    
                   </div>  
                   {/if} *}
                   {if $site_company->isLoaded()}
                   <div class="form-group">                
                                    <div id="pictureForm">                            
                                        <div class="custom-FileInput" id="DivLogo">
                                            {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                            {if $site_company->get("picture")}
                                                <img id="pictureImg" alt="" src='{$site_company->getPicture()->getUrl()}' alt="{__('my picture')}"{*/if*} /><br/>
                                                {else}
                                                    <img id="pictureImg" alt="" style="display: none;" /><br/>
                                            {/if}
                                        </div>
                                        <div class="row">
                                            <div class="col-md-7">
                                                <a id="pictureAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add picture')}</a>
                                                <input id="pictureFile" type="file" name="Company[picture]" class="files" hidden=""/>
                                            </div>
                                            <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                                <div class="thumbnail media-lib-item parent">
                                                    <a href="#" class="list-action Mode" name="NORMAL" id="BtnInverse" style=""><i class="ModeIcon Normal far fa-square"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
{*                   {else}
                     <div class="form-group">
                        <label>{__('Picture')}</label>                  
                           <div id="pictureForm">
                                 <input id="pictureFile" type="file" class="files" name="Company[picture]"/>
                           </div>    
                   </div>  *}
                   {/if}
                   
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>{__("Name")}{if $form->getValidator('name')->getOption('required')}*{/if}</label>
                            <div  {if $form.name->hasError()}class="error_form"{/if}>{$form.name->getError()}</div> 
                            <input type="text" class="Company input-text form-control" name="name" value="{$site_company->get('name')|escape}" size="30"/>
                       </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>{__("Commercial name")}{if $form->getValidator('commercial')->getOption('required')}*{/if}</label>
                            <div {if $form.commercial->hasError()}class="error_form"{/if}>{$form.commercial->getError()}</div>  
                            <input type="text" class="Company input-text form-control" name="commercial" value="{$site_company->get('commercial')|escape}" size="30"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>{__("Web")}{if $form->getValidator('web')->getOption('required')}*{/if}</label>
                            <div {if $form.web->hasError()}class="error_form"{/if}>{$form.web->getError()}</div> 
                            <input type="text" class="Company input-text form-control" name="web" value="{$site_company->get('web')|escape}" size="30"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>{__("Email")}{if $form->getValidator('email')->getOption('required')}*{/if}</label>
                            <div {if $form.email->hasError()}class="error_form"{/if}>{$form.email->getError()}</div> 
                            <input type="text" class="Company input-text form-control" name="email" value="{$site_company->get('email')|escape}" size="30"/>           
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        
        {*=====================================================SECOND ROW==================================================*}
        <div class="row">
            <div  class="col-md-6">
                <div class="form-group">
                    <label>{__("Address1")}{if $form->getValidator('address1')->getOption('required')}*{/if}</label>
                    <div {if $form.address1->hasError()}class="error_form"{/if}>{$form.address1->getError()}</div> 
                    <input type="text" class="Company input-text form-control" name="address1" value="{$site_company->get('address1')|escape}" size="30" />           
                </div>   
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>{format_postal_code()}</label>
                    <div {if $form.postcode->hasError()}class="error_form"{/if}>{$form.postcode->getError()}</div> 
                    <input type="text" class="Company input-text form-control" name="postcode" value="{$site_company->get('postcode')|escape}" size="10" />{if $form->getValidator('postcode')->getOption('required')}*{/if}            
                </div>
            </div>
        </div>
        {*=====================================================THIRD ROW==================================================*}
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>{__("City")}</label>
                    <div {if $form.city->hasError()}class="error_form"{/if}>{$form.city->getError()}</div> 
                    <input type="text" class="Company input-text form-control" name="city" value="{$site_company->get('city')|escape}" size="30"/>{if $form->getValidator('city')->getOption('required')}*{/if}
                    <div id="cities_container"></div>           
                </div>
            </div>
            <div  class="col-md-6">
                <div class="form-group">
                    <label>{__("Country")}</label>
                    <div {if $form.country->hasError()}class="error_form"{/if}>{$form.country->getError()}</div>                 
                    {select_country name="country" class="Company input-text form-control" selected=$site_company->get('country')}
                </div>
            </div>
           
        </div>
        {*=====================================================FOURTH ROW==================================================*}
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>{__("Phone")}{if $form->phone->getOption('required')}*{/if}</label>
                    <div>{$form.phone->getError()}</div> 
                    <input type="text" class="Company input-text form-control" name="phone" value="{$site_company->get('phone')|escape}" size="30"/>
                </div>  

            </div>
            <div  class="col-md-4">
                <div class="form-group">
                    <label>{__("Mobile")}{if $form->mobile->getOption('required')}*{/if}</label>
                    <div {if $form.mobile->hasError()}class="error_form"{/if}>{$form.mobile->getError()}</div> 
                    <input type="text" class="Company input-text form-control" name="mobile" value="{$site_company->get('mobile')|escape}" size="30"/>
                </div> 
            </div>
             <div  class="col-md-4">
                <div class="form-group">
                    <label>{__("Fax")}{if $form->fax->getOption('required')}*{/if}</label>
                    <div>{$form.fax->getError()}</div> 
                    <input type="text" class="Company input-text form-control" name="fax" value="{$site_company->get('fax')|escape}" size="30" />
                </div>
            </div>
        </div>
        {*=====================================================FIFTH ROW==================================================*}
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>{__("NAF")}{if $form->ape->getOption('required')}*{/if} </label>
                    <div {if $form.ape->hasError()}class="error_form"{/if}>{$form.ape->getError()}</div> 
                   <input type="text" class="Company input-text form-control" name="ape" value="{$site_company->get('ape')|escape}" size="30"/>
                </div>
            </div>
            <div  class="col-md-6">
                <div class="form-group">
                    <label>{__("SIRET")}{if $form->siret->getOption('required')}*{/if} </label>
                    <div {if $form.siret->hasError()}class="error_form"{/if}>{$form.siret->getError()}</div> 
                   <input type="text" class="Company input-text form-control" name="siret" value="{$site_company->get('siret')|escape}" size="30"/>
                </div>
            </div>
        </div>
        {*=====================================================Last ROW==================================================*}
{*==============================================================HEADER============================================================*}
        <div class="row">
            
            
            
            
            
            <div class="col-md-4">         
                {if $site_company->isLoaded()}
                   <div class="form-group">                
                        <div id="headerForm">                            
                            <div class="custom-FileInput" id="DivHeader">
                                {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                {if $site_company->get("header")}
                                    <img id="headerImg" alt="" src='{$site_company->getHeader()->getUrl()}' alt="{__('my header')}"{*/if*} /><br/>
                                    {else}
                                        <img id="headerImg" alt="" style="display: none;" /><br/>
                                {/if}
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <a id="headerAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add header')}</a>
                                    <input id="headerFile" type="file" name="Company[header]" class="files" hidden=""/>
                                </div>
                                <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                    <div class="thumbnail media-lib-item parent">
                                        <a href="#" class="list-action ModeHeader" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconHeader Normal far fa-square"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </div>
{*                   {else}
                     <div class="form-group">
                        <label>{__('Picture')}</label>                  
                           <div id="pictureForm">
                                 <input id="pictureFile" type="file" class="files" name="Company[picture]"/>
                           </div>    
                   </div>  *}
                   {/if}       
            </div>
            
            
            
            
            
            
            {*<div  class="col-md-6">
                {if $site_company->isLoaded()}
                    <div class="form-group">
                        <label>{__('Header')}</label>
                           <span id="headerFilename">{if $site_company->get("header")}[{$site_company->get('header')}]{/if}</span>
                           <img height="128" width="128" id="headerImg" {if $site_company->get("header")}src='{$site_company->getHeader()->getUrl()}' alt="{__('my header')}{else}style="display:none"{/if}"/>                 
                           <a id="headerDelete" href="#" {if !$site_company->get("header")}style="display:none"{/if}><img src="{url('/icons/delete.gif','picture')}" alt="{__('delete')}"/></a>
                    </div>   

                    <div class="form-group">
                            <div>
                                <a id="headerChange" class="btn btn-default" href="#" {if !$site_company->get("header")}style="display:none"{/if}><img  src="{url('/icons/edit.gif','picture')}" alt="{__('change')}"/>{__('change header')|capitalize}</a>
                                <a id="headerAdd" class="btn btn-default" href="#" {if $site_company->get("header")}style="display:none"{/if}><i class="fa fa-plus" style="margin-right:10px;"></i>{*<img  src="{url('/icons/add.gif','picture')}" alt="{__('edit')}"/>*}{*__('add header')|capitalize}</a> 
                            {*</div>
                           <div id="headerForm" style="display:none">
                                 <input id="headerFile" type="file" name="Company[header]"/> 
                                 <a href="#" id="headerUpload"><img src="{url('/icons/upload.png','picture')}" alt="{__('upload')|capitalize}"></a>
                                 <img id="headerLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                           </div>    
                   </div>
                   {else}
                     <div class="form-group">
                        <label>{__('Header')}</label>        
                           <div id="headerForm">
                                 <input id="headerFile" type="file" class="files" name="Company[header]"/> 
                           </div>    
                   </div>  
                {/if}  
            </div>*}
{*===========================================FOOTER=====================================================================*}
            
        
        <div class="col-md-4">         
                {if $site_company->isLoaded()}
                   <div class="form-group">                
                        <div id="footerForm">                            
                            <div class="custom-FileInput" id="DivFooter">
                                {*<img id="blah" alt="" style="display: none;" /><br/>*}
                                {if $site_company->get("footer")}
                                    <img id="footerImg" alt="" src='{$site_company->getfooter()->getUrl()}' alt="{__('my footer')}"{*/if*} /><br/>
                                    {else}
                                        <img id="footerImg" alt="" style="display: none;" /><br/>
                                {/if}
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <a id="footerAdd" href="#" class="btn btn-default"><i class="fa fa-plus" style="margin-right:10px;"></i>{__('Add footer')}</a>
                                    <input id="footerFile" type="file" name="Company[footer]" class="files" hidden=""/>
                                </div>
                                <div class="col-md-2" style="padding-top: 8px;padding-left: 0px;">
                                    <div class="thumbnail media-lib-item parent">
                                        <a href="#" class="list-action ModeFooter" name="NORMAL" id="BtnInverse" style=""><i class="ModeIconFooter Normal far fa-square"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </div>
{*                   {else}
                     <div class="form-group">
                        <label>{__('Picture')}</label>                  
                           <div id="pictureForm">
                                 <input id="pictureFile" type="file" class="files" name="Company[picture]"/>
                           </div>    
                   </div>  *}
                   {/if}       
            </div>
        
        
        
        
        
            {*<div  class="col-md-6">
                {if $site_company->isLoaded()}
                    <div class="form-group">
                        <label>{__('Footer')}</label>
                           <span id="footerFilename">{if $site_company->get("footer")}[{$site_company->get('footer')}]{/if}</span>
                           <img height="128" width="128" id="footerImg" {if $site_company->get("footer")}src='{$site_company->getFooter()->getUrl()}' alt="{__('my footer')}{else}style="display:none"{/if}"/>                 
                           <a id="footerDelete" href="#" {if !$site_company->get("footer")}style="display:none"{/if}><img src="{url('/icons/delete.gif','picture')}" alt="{__('delete')}"/></a>
                    </div>             
                    <div class="form-group">
                           <div>
                                <a id="footerChange" class="btn btn-default" href="#" {if !$site_company->get("footer")}style="display:none"{/if}><img  src="{url('/icons/edit.gif','picture')}" alt="{__('change')}"/>{__('change footer')|capitalize}</a>
                                <a id="footerAdd" class="btn btn-default" href="#" {if $site_company->get("footer")}style="display:none"{/if}><i class="fa fa-plus" style="margin-right:10px;"></i>{*<img  src="{url('/icons/add.gif','picture')}" alt="{__('edit')}"/>*}{*__('add footer')|capitalize}</a> 
                           {*</div>
                           <div id="footerForm" style="display:none">
                                 <input id="footerFile" type="file" name="Company[footer]"/> 
                                 <a href="#" id="footerUpload"><img src="{url('/icons/upload.png','picture')}" alt="{__('upload')|capitalize}"></a>
                                 <img id="footerLoading" height="16" width="16" src="{url('/icons/loading.gif','picture')}" alt="" style="display:none;"> 
                           </div>    
                   </div>
                   {else}
                     <div class="form-group">
                        <label>{__('Footer')}</label>        
                           <div id="footerForm">
                                 <input id="footerFile" type="file" class="files form-control" name="Company[footer]"/> 
                           </div>    
                   </div>  
                {/if}
            </div>*}
        </div>

  {*   <div class="form-group">
         <label>{__("address2")}</td>
         <td> 
             <div {if $form.address2->hasError()}class="error_form"{/if}>{$form.address2->getError()}</div> 
             <input type="text" class="company input-text" name="address2" value="{$site_company->get('address2')|escape}" size="30" />{if $form->getValidator('address2')->getOption('required')}*{/if}
         </td>             
     </div> *}  
         

        </div>

  {*    <div class="form-group">
         <label>{__("GPS coordinates")}</td>
         <td> 
             <div {if $form.coordinates->hasError()}class="error_form"{/if}{$form.coordinates->getError()}</div> 
             <input type="text" class="company input-text" name="coordinates" value="{$site_company->get('coordinates')|escape}" size="30"/>{if $form->coordinates->getOption('required')}*{/if}
         </td>             
     </div>   *}  
     
   {*  {foreach $form->getRegistrationValidators() as $name=>$validator}                                             
           <tr id="{$name}" {if $name=="tva" && $form->hasValidator('autoentreprise') && $site_company->isAutoEnterprise()}style="display:none"{/if} class="registration">
               <label>
                    {if $validator->title}{__($validator->title)}{elseif $name=="commercial"}{__("commercial name")}{else}{__($name)}{/if}   
               </td>   
               <td>
                   {if $name=='autoentreprise'}            
                           <input type="checkbox" name="autoentreprise" {if $site_company->isAutoEnterprise()}checked=""{/if}/>                                                                                                            
                   {else}     
                           <div>{$form[$name]->getError()}</div>
                           <input type="text" class="company input-text" name="{$name}" value="{$site_company->get($name)|escape}"/>   
                           {if $validator->getOption("required")}*{/if}
                   {/if}           
               </td>
           </div>             
      {/foreach}     *}
     </div>
</div>
</fieldset>
<script type="text/javascript">
    
    $('#pictureAdd').click(function() {
        $('#pictureFile').click();
        $('#Save').show();
     });
      
    $("#pictureFile").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#pictureImg').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    //================================================HEADER====================================================
    $('#headerAdd').click(function() {
        $('#headerFile').click();
        $('#Save').show();
     });
      
    $("#headerFile").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#headerImg').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
     //============================================FOOTER============================================================
    $('#footerAdd').click(function() {
        $('#footerFile').click();
        $('#Save').show();
     });
      
    $("#footerFile").change(function() {   
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {  $('#footerImg').css('display','block').attr('src', e.target.result); };
          reader.readAsDataURL(this.files[0]);
        }        
    });
    //=============================================================================================================================
    
    $(".Mode").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIcon").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                $("#DivLogo").css('background-color','#37BC9B');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIcon").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                $("#DivLogo").css('background-color','');
            }
   });
   
   $(".ModeHeader").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIconHeader").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                $("#DivHeader").css('background-color','#37BC9B');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIconHeader").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                $("#DivHeader").css('background-color','');
            }
   });
   
   $(".ModeFooter").click(function(){
        if ($(this).attr('name')=='NORMAL'){
            $(this).attr('name','INVERSE');
                $(".ModeIconFooter").removeClass('Normal far fa-square').addClass('Inverse fa fa-square-full');
                $("#DivFooter").css('background-color','#37BC9B');
            }
            else
            {
                $(this).attr('name','NORMAL');
                $(".ModeIconFooter").removeClass('Inverse fa fa-square-full').addClass('Normal far fa-square');
                $("#DivFooter").css('background-color','');
            }
   });
    
    
    

        $(document).off("click", "#cities"); // Remove old events        
         
        $('#Save').click(function(){ 
                  var params= { Company: {                                        
                                        country : $(".Company[name=country] option:selected").val(), 
                                        token :'{$form->getCSRFToken()}' 
                                     } };
                  $("input.Company").each(function() { params.Company[this.name]=$(this).val(); });  
                  if ($("[name=autoentreprise]").length)
                        params.Company.autoentreprise= $("[name=autoentreprise]").is(":checked")?"YES":"NO";  
                //     alert("params="+params.toSource()); return ;
                  return $.ajax2({ data : params,
                                   files: ".files",
                                   url: "{url_to('site_company_ajax',['action'=>'Save'])}",                                                                  
                                   target: "#actions"}); 
         });
             
             
        $(".Company").click(function() { $('#Save').show(); });
                                          
         $(".Company[name=postcode]").keyup(function() { 
             if ($(this).val().length > 2)
             {                         
                return $.ajax2({ data: { city: {
                         country:$(".Company[name=country]").val(),
                         postcode: $(this).val()
                      } }, 
                      url: "{url_to('utils_city',[],'frontend')}",
                      success: function(response) {               
                                     $("#cities_container").show();
                                     if (response.length)
                                     {    
                                         $("#cities_container").html('<select id="cities"></select>');  
                                         $.each(response,function () {
                                             $("#cities").append('<option value="'+this.postalcode+'|'+this.city+'">'+this.postalcode+' '+this.city+'</option>');
                                         });
                                     }
                                     else
                                         $("#cities_container").html("{__('No city exists')}");  
                              }
                      } ); 
             }   
             else
             {
                 $(".company[name=city]").val('');
                 $("#cities_container").html('');  
             }    
         });
         
       $(document).on("click", "#cities", function() {            
             city_postcode=$("#cities").val().split('|');
             $(".Company[name=postcode]").val(city_postcode[0]);
             $(".Company[name=city]").val(city_postcode[1]);
         });
         
       {* =========================== PICTURE ============================================================================= *}  
          $("#pictureUpload").click(function () { 
             return $.ajax2({ data : { Company : { id: "{$site_company->get('id')}", token : "{mfForm::getToken('CompanyPictureForm')}" } },
                              files: "#pictureFile",
                              url: "{url_to('site_company_ajax',['action'=>'SavePicture'])}",
                              loading: "#pictureLoading",
                              success: function (response)
                                       {
                                            $("#pictureFile").val('');     
                                            if (response.picture)
                                            { 
                                                $("#pictureImg").attr('src',"{$site_company->getPicture()->getURLPath()}"+response.picture+"?"+$.now()); 
                                                $("#pictureFilename").html("["+response.picture+"]");
                                               // $("#pictureForm,#pictureAdd").hide(); 
                                                $("#pictureChange,#pictureDelete,#pictureFilename,#pictureImg").show();
                                            }
                                       }
                            });
         });
       
          {*$('#pictureChange,#pictureAdd').click(function(){ 
              $("#pictureForm").show();
              $(this).hide();
         });*}
         
          $('#pictureDelete').click(function(){ 
                  if (!confirm('{__("Picture  will be deleted. Confirm ?")}')) return false; 
                  return $.ajax2({ data : { Company:'{$site_company->get("id")}' }, 
                                   url: "{url_to('site_company_ajax',['action'=>'DeletePicture'])}",
                                   success :function(response) {
                                                    if (response.action=='DeletePicture' && response.id=="{$site_company->get('id')}")
                                                    {
                                                        $("#pictureAdd").show();
                                                        $("#pictureChange,#pictureFilename,#pictureImg,#pictureDelete,#pictureForm").hide();
                                                    }
                                           }
                  } ); 
         });
         
               {* =========================== HEADER ============================================================================= *}  
          $("#headerUpload").click(function () { 
             return $.ajax2({ data : { Company : { id: "{$site_company->get('id')}", token : "{mfForm::getToken('CompanyHeaderForm')}" } },
                              files: "#headerFile",
                              url: "{url_to('site_company_ajax',['action'=>'SaveHeader'])}",
                              loading: "#headerLoading",
                              success: function (response)
                                       {
                                            $("#headerFile").val('');     
                                            if (response.header)
                                            { 
                                                $("#headerImg").attr('src',"{$site_company->getHeader()->getURLPath()}"+response.header+"?"+$.now()); 
                                                $("#headerFilename").html("["+response.header+"]");
                                                //$("#headerForm,#headerAdd").hide(); 
                                                $("#headerChange,#headerDelete,#headerFilename,#headerImg").show();
                                            }
                                       }
                            });
         });
       
          {*$('#headerChange,#headerAdd').click(function(){ 
              $("#headerForm").show();
              $(this).hide();
              $("#headerFile").focus();
         });*}
         
         $('#headerDelete').click(function(){ 
                  if (!confirm('{__("Header  will be deleted. Confirm ?")}')) return false; 
                  return $.ajax2({ data : { Company:'{$site_company->get("id")}' }, 
                                   url: "{url_to('site_company_ajax',['action'=>'DeleteHeader'])}",
                                   success :function(response) {
                                                    if (response.action=='deleteHeader'&&response.id=="{$site_company->get('id')}")
                                                    {
                                                        $("#headerAdd").show();
                                                        $("#headerChange,#headerFilename,#headerImg,#headerDelete,#headerForm").hide();
                                                    }
                                           }
                  } ); 
         });
         
               {* =========================== FOOTER ============================================================================= *}  
          $("#footerUpload").click(function () { 
             return $.ajax2({ data : { Company : { id: "{$site_company->get('id')}", token : "{mfForm::getToken('CompanyFooterForm')}" } },
                              files: "#footerFile",
                              url: "{url_to('site_company_ajax',['action'=>'SaveFooter'])}",
                              loading: "#footerLoading",
                              success: function (response)
                                       {
                                            $("#footerFile").val('');     
                                            if (response.footer)
                                            { 
                                                $("#footerImg").attr('src',"{$site_company->getFooter()->getURLPath()}"+response.footer+"?"+$.now()); 
                                                $("#footerFilename").html("["+response.footer+"]");
                                                //$("#footerForm,#footerAdd").hide(); 
                                                $("#footerChange,#footerDelete,#footerFilename,#footerImg").show();
                                            }
                                       }
                            });
         });
       
          {*$('#footerChange,#footerAdd').click(function(){ 
              $("#footerForm").show();
              $(this).hide();
         });*}
         
         $('#footerDelete').click(function(){ 
                  if (!confirm('{__("footer  will be deleted. Confirm ?")}')) return false; 
                  return $.ajax2({ data : { Company:'{$site_company->get("id")}' }, 
                                   url: "{url_to('site_company_ajax',['action'=>'DeleteFooter'])}",
                                   success :function(response) {
                                                    if (response.action=='deleteFooter'&&response.id=="{$site_company->get('id')}")
                                                    {
                                                        $("#footerAdd").show();
                                                        $("#footerChange,#footerFilename,#footerImg,#footerDelete,#footerForm").hide();
                                                    }
                                           }
                  } ); 
         });
         
       {* ===================================================================================================================== *}  
        $("[name=autoentreprise]").click(function() { 
           if ($(this).is(":checked"))
               $("#tva").hide();
           else
               $("#tva").show(); 
        });        
         
    
</script>
