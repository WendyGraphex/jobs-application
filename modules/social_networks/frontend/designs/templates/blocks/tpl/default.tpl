<div id="social-networks" class="hero-social-btn">
            <div class="social-title d-flex align-items-center">
                <h6>{__('Follow us on Social Media')}</h6>
                <span></span>
            </div>
    <div class="social-btns">
            {foreach $networks as $network}
         <a target="_blank" href="{$network->getLink()}"><i class="fa fa-{$network->get('awe')}" aria-haspopup="true"></i></a>
     {/foreach}  
    </div>
          {*  <div class="social-btns">
                <a href="#"><i class="fa fa-linkedin" aria-haspopup="true"></i></a>
                <a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-haspopup="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-haspopup="true"></i></a>
            </div>*}                      
 </div>
