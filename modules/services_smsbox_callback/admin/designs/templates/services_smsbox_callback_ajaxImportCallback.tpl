{messages}
<div class="content-header row">
  <div class="content-header-left col-md-6 col-12 mb-2">
      <h3 class="content-header-title mb-0">{__("Importer des retours")}</h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
      <div class="media width-250 float-right">
        <div class="media-left media-middle">
          <div id="sp-bar-total-sales"></div>
        </div>
        <div class="media-body media-right text-right">
          <a href="#" id="Import" class="btn btn-primary">
            <i class="fa fa-save"></i> {__('Import')}
          </a>
          <a href="#" id="Cancel" class="btn btn-primary">
              <i class="fa fa-times"></i> {__('Annuler')}</a>
        </div>
      </div>
    </div>
</div>
<div class="row">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
    </div>
    <div class="card-content collapse show">
        <div class="card-body">           
          <div class="row">  
               <div class="col">
                <div class="form-group">
                    <label>{__('Statut')}{if $form->accuse->getOption('required')}*{/if}</label>
                    <div class="col-1">
                        <div class="error-form">{$form.accuse->getError()}</div>
                          {html_options options=$form->accuse->getChoices()->toArray() class="ImportStatus Select form-control" name="accuse" selected=$form.accuse}
                    </div>
    </div>
               </div>
          </div>
        <div class="row">  
            <div class="col">
              <div class="form-group">
                  <label>{__("Fichier")}{if $form->file->getOption('required')}*{/if}</label>
                  <div class="col-1"> 
                      <div class="error-form">{$form.file->getError()}</div> 
                     <input class="Files Fields form-control" type="file" name="ImportSmsboxCallback[file]"/> 
                  </div>
              </div>
                                     
            </div> 
              
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
   
    
    
    $('#Cancel').click(function(){  return $.ajax2({
                        url: "{url_to('services_smsbox_callback_ajax',['action'=>'ListPartialCallback'])}",                      
                         target: "#actions" }); 
        });
         
          
      
      $('#Import').click(function(){ 
              var params= { iFrame:true, 
                            ImportSmsboxCallback: { token :'{$form->getCSRFToken()}' } };    
              $(".ImportStatus.Select option:selected").each(function () { params. ImportSmsboxCallback[$(this).parent().attr('name')]=$(this).val(); });
              return $.ajax2({ data: params, 
                               files: ".Files",
                               url: "{url_to('services_smsbox_callback_ajax',['action'=>'ImportCallback'])}",
                               target: "#actions"
                               }); 
        });                    
        
    
    
</script>
