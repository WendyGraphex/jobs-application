// IN DEVELOPMENT
(function( $, undefined ) {


$.widget("ui.mytree", {
    
        ready: false,
        
	options: {
		//cancel: ':input,option',
		//distance: 1,
		delay: 0
	},
        
        // Set up the widget
    _create: function() {
        this.ready = true;
    },
 

    // Use the _setOption method to respond to changes to options

    _setOption: function( key, value ) {

      switch( key ) {

        case "clear":
          // handle changes to clear option

          break;

      }
 
      $.Widget.prototype._setOption.apply( this, arguments );
      this._super( "_setOption", key, value );
    },
 
    destroy: function() {
      $.Widget.prototype.destroy.call( this );
    },
               
    prepareBranches: function() {
                        alert("ici");
                        return ;
			if (!this.options.prerendered) {
				// mark last tree items
				this.filter(":last-child:not(ul)").addClass(this.CLASSES.last);
				// collapse whole tree, or only those marked as closed, anyway except those marked as open
				this.filter((this.options.collapsed ? "" : "." + this.CLASSES.closed) + ":not(." + this.CLASSES.open + ")").find(">ul").hide();
			}
			// return all items with sublists
			return this.filter(":has(>ul)");
		},
                
    _init: function ()
            {
                
                  //alert("coucou"+this.toSource());
                  this.element.addClass("treeview");
                 // alert("coucou"+this.options.toSource());
                // alert("coucou"+this.CLASSES.toSource());
                var branches = this.element.find("li").prepareBranches();
              
                alert("info="+branches.toSource());
            },
           
    CLASSES : {
		open: "open",
		closed: "closed",
		expandable: "expandable",
		expandableHitarea: "expandable-hitarea",
		lastExpandableHitarea: "lastExpandable-hitarea",
		collapsable: "collapsable",
		collapsableHitarea: "collapsable-hitarea",
		lastCollapsableHitarea: "lastCollapsable-hitarea",
		lastCollapsable: "lastCollapsable",
		lastExpandable: "lastExpandable",
		last: "last",
		hitarea: "hitarea"
	}    
    
});

})(jQuery);
