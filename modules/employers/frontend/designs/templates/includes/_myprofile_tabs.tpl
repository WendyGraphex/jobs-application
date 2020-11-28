<ul class="nav nav-tabs" id="myTab" role="tablist">
    {if $employer_user->isProfessional() && $employer_user->isAdmin() && $form->hasValidator('company')}
        <li class="nav-item">  
            <a class="nav-link active"  id="comapny-tab" data-toggle="tab" href="#company" role="tab" aria-controls="company" aria-selected="true">
              {__('Company information')}
              {if $form->hasErrors(['company'])}<span style="color:red">?</span>{/if}
          </a>
        </li>
    {/if}
    <li class="nav-item">            
      <a class="nav-link {if !$employer_user->isProfessional() || !$employer_user->isAdmin() || !$form->hasValidator('company')}active{/if}"  id="public-tab" data-toggle="tab" href="#public" role="tab" aria-controls="public" aria-selected="true">
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
     {if $employer_user->isPrivate()}
      <li class="nav-item">            
      <a class="nav-link"  id="address-tab" data-toggle="tab" href="#address" role="tab" aria-controls="address" aria-selected="true">
          {__('My address')}
          {if $form->hasErrors(['address1','postcode','city'])}<span style="color:red">?</span>{/if}
      </a>
    </li> 
    {/if}
     <li class="nav-item">            
      <a class="nav-link"  id="details-tab" data-toggle="tab" href="#details" role="tab" aria-controls="details" aria-selected="true">
         {__('Experience')}
         {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
      </a>
    </li>   
    <li class="nav-item">            
      <a class="nav-link"  id="categories-tab" data-toggle="tab" href="#categories" role="tab" aria-controls="categories" aria-selected="true">
         {__('Categories')}
         {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
      </a>
    </li>
     <li class="nav-item">            
      <a class="nav-link"  id="languages-tab" data-toggle="tab" href="#languages" role="tab" aria-controls="languages" aria-selected="true">
         {__('Languages')}
         {*if $form.->hasError()}<span style="color:red">?</span>{/if*}
      </a>
    </li> 
</ul>