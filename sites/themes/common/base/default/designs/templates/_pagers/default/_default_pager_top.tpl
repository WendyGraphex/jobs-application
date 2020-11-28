<label class="float-left" style="line-height: 39px;">{__('show')}</label>
  <div class="form-group float-left mr-2">
  {html_options class="form-control form-control-sm float-left mx-1" name="{if $class}{$class}-{/if}nbitemsbypage" options=$formFilter->nbitemsbypage->getOption('choices') selected=(string)$formFilter.nbitemsbypage}
</div>
<label style="line-height: 39px;">{__('entries')}</label> 
                

