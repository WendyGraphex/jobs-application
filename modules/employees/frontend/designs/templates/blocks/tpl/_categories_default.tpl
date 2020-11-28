{include file="./tpl/_categories_filter.tpl"} 
            
<div class="row2Drop">
    <div class="row">
        {*<div class="ResaultsNumber col-md-6"><span class="">{format_number_choice('[0]No advert|[1]One advert available|(1,Inf]%s adverts available',$pager->getResults(),$pager->getResults())}</span></div>*}
        {*<div class="col-md-6">
            <div class="SortAdverts">
                <div class="global-class-drop dropdown country-drop">
                    <button class="btn myButtonDrop dropdown-toggle" type="button" data-toggle="dropdown">Sort by
                    <span class="caret"></span></button>
                    <ul class="myDropDownDrop dropdown-menu">
                       <li class="item"><a href="#">Date created</a></li>
                       <li class="item"><a href="#">Notation</a></li>
                       <li class="item"><a href="#">Company name</a></li>
                       <li class="item"><a href="#">Others</a></li>
                    </ul>
                </div>
            </div>
        </div>*}
    </div>
</div>
          
            
<div class="row d-flex">
 {foreach $pager as $item_i18n}     
       {*==i18n={$item_i18n->get('id')}==={$item_i18n->get('advert_id')}== *}
     {component name="/employees/advertDisplay" advert=$item_i18n}                 
 {/foreach}                           
</div>

<div class="row mt-5">
    {include file="./_pagers/default/_default_pager_adverts.tpl" pager=$pager} 
</div>
       

{component name="/employees_messager/dialog"}      
{component name="/sales_quotation/getquote"}  
{component name="/employees_contact/shareDialog"}
{component name="/employees_contact/abuseDialog"} 

{include file="./tpl/_categories_js.tpl"} 