 <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">            
                  <a class="nav-link active"  id="public-tab" data-toggle="tab" href="#public" role="tab" aria-controls="public" aria-selected="true">
                      {__('Public information')}
                      {if $form->hasErrors(['username'])}<span style="color:red">?</span>{/if}
                  </a>
                </li>   
                <li class="nav-item">            
                  <a class="nav-link"  id="personal-tab" data-toggle="tab" href="#personal" role="tab" aria-controls="personal" aria-selected="true">
                      {__('Personal information')}
                     {if $form->hasErrors(['firstname','lastname','mobile'])}<span style="color:red">?</span>{/if}
                  </a>
                </li>
                 <li class="nav-item">            
                  <a class="nav-link"  id="address-tab" data-toggle="tab" href="#address" role="tab" aria-controls="address" aria-selected="true">
                      {__('My Address')}
                       {if $form->hasErrors(['address1','postcode','city','country'])}<span style="color:red">?</span>{/if}
                  </a>
                </li>
                 <li class="nav-item">            
                  <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
                     {__('Experience')}
                     {if $form->hasErrors(['function_id','experience_id','level_id','default_language'])}<span style="color:red">?</span>{/if}
                  </a>
                </li> 
                 <li class="nav-item">            
                  <a class="nav-link"  id="details-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="true">
                     {__('Categories')}
                     {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
                  </a>
                </li> 
                 <li class="nav-item">            
                  <a class="nav-link"  id="skills-tab" data-toggle="tab" href="#skills" role="tab" aria-controls="skills" aria-selected="true">
                     {__('Skills')}
                     {if $form.skills->hasError()}<span style="color:red">?</span>{/if}
                  </a>
                </li> 
                 <li class="nav-item">            
                  <a class="nav-link"  id="languages-tab" data-toggle="tab" href="#languages" role="tab" aria-controls="languages" aria-selected="true">
                     {__('Languages')}
                     {if $form.languages->hasError()}<span style="color:red">?</span>{/if}
                  </a>
                </li> 
                 <li class="nav-item">            
                  <a class="nav-link"  id="diplomas-tab" data-toggle="tab" href="#diplomas" role="tab" aria-controls="diplomas" aria-selected="true">
                     {__('Diplomas')}
                     {if $form.diplomas->hasError()}<span style="color:red">?</span>{/if}
                  </a>
                </li> 
            </ul>
