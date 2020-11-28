// String methods
String.prototype.format = function () {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++)
        formatted = formatted.replace(new RegExp('\\#' + i + '\\#', 'gi'), arguments[i]);
    return formatted;
};

String.prototype.cleanup = function () {
    var map = {
        '-' : '\W',
        '-' : '\w',
        '-' : '\s',
        '-' : ' ',
        '-' : '_',        
        'a' : '[àáâãäå]',
        'e' : '[èéêë]',
        'i' : '[ìíîï]',
        'o' : '[òóôõö]',
        'u' : '[ùúûü]',
        'c' : 'ç',
        'n' : 'ñ',
        'ae' : 'æ'
    }; 
    var str = this;
    str = str.toLowerCase();    
    for (var pattern in map) {   str = str.replace(new RegExp(map[pattern], 'g'), pattern);  };
    str = str.replace(/[&\/\\#, +()$~%.'":*?<>{}]/g, '-');
    str = str.replace(/\-\-+/g, '-'); 
    str = str.replace(/^-+/, '') ;
    str = str.replace(/-+$/, '') ;    
    return str;
};

// Array methods
(function ($) {
    $.array_intersect = function (a, b) {
        return $.grep(a, function (i) {
            return $.inArray(i, b) > -1;
        });
    }
})(jQuery);

// getFilter <input name="lastlogin[from][fr1]fr2]" value="toto"/> => {lastlogin: { from :  { fr1 : {fr2 : "toto"} } } }
(function ($) {

    $.fn.getFilter = function () {
        var params = {};

        function _arraytoObject(a, params, value) {
            index = a[0];
            if (index) {
                a.shift();
                params[index] = _arraytoObject(a, {}, value);
                return params;
            }
            else {
                return params = value;
            }
        }

        $.each(this, function () {
            params = $.extend(true, _arraytoObject(this.name.replace(/\[(\w+)\]/g, function (str, occ) {
                return "." + occ;
            }).split('.'), {}, this.value), params);
        });
        return params;
    };

})(jQuery);

// Plugin Error Messages Manager
(function ($) {

    function displayMessages(type, selector, messages) {

       if (typeof(messages) == 'string')
            messages = new Array(messages);        
         $.each(messages, function (id, value,classError) {
          $("." + selector + " div[id=" + type+"]").append(
                  '<div class="' + type + "_" + classError + '">' + value + '</div>'
            );
        });
        $("." + selector + " div#" + type).show();
    }

    var methods = {
        init: function (options) {
        },

        show: function () {

        },
        hide: function () {
            $(this).hide();
        },
        error: function (messages) {        
            displayMessages('error', $(this).attr('id'), messages);
        },
        info: function (messages) {
            displayMessages('info', $(this).attr('id'), messages);
        },
        warning: function (messages) {
            displayMessages('warning', $(this).attr('id'), messages);
        },

        clear: function () {
           // alert("dtetstr");
            var selector = "." + $(this).attr('id');
            $.each(['error', 'warning', 'info'], function (id, elm) {
                //console.log(elm);
                //console.log(id);
              $.each(this, function () {
                   $('#errors').find("#" + elm).html("");
                });
                $('#errors').find("#" + elm).hide();
            });
        }

    };

    $.fn.messagesManager = function (method) {

        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.messagesManager');
        }

    };

})(jQuery);

// AJAX function + upload
(function ($) {

    var messages = {
        401: "you don't have permission to do this action.",
        402: "AJAX server failure",
        404: "Error 404 : url=#0#",
        500: "Internal server error"
    };

    var methods = {

        init: function (options) {
            messages = $.extend({}, options);

        },
        setMessages: function (msgs) {
            messages = $.extend(messages, msgs);
            return messages;
        },
        getMessages: function () {
            return messages;
        },
        getMessage: function (num) {
            return messages[num];
        },
        send: function (options) {
            var settings = $.extend({
                data: {},
                errorTarget: "#errors",
                loading: "img#loading",
                cache: false,
                messages: {}
            }, options);
            $(settings.loading).show();
            $(settings.errorTarget).messagesManager('clear');
            if (settings.messages.info)
                $(settings.errorTarget).messagesManager('info', settings.messages.info);
            $.ajax({
                type: "POST",
                url: settings.url,
                data: settings.data,
                cache: settings.cache,
                contentType: settings.contentType,
                processData: settings.processData,
                error: function (xhr, ajaxOptions, thrownError) {
                    if (jQuery.isFunction(settings.error)) {
                        return settings.error.call(this, xhr, ajaxOptions, thrownError);
                    }
                    $(settings.errorTarget).messagesManager('clear');
                    if (xhr.status == 0)
                        $(settings.errorTarget).messagesManager("error", messages[402]);
                },
                success: function (data, textStatus, jqXHR) {
                    $(settings.loading).hide();
                    if (settings.target != null) {
                        $(settings.target).html(data);
                        if (jQuery.isFunction(settings.success)) {
                            settings.success.call(this, data);
                        }
                    }
                    else {
                        /*  try
                         {
                         var response = $.parseJSON(data);
                         }
                         catch (e)
                         {
                         if (jQuery.isFunction(settings.error))
                         {
                         settings.error.call(this,e,data);
                         }
                         }  */
                        var response = data;
                        if (typeof response == 'undefined') {
                            if (jQuery.isFunction(settings.success)) {
                                settings.success.call(this, data);
                            }
                            return;
                        }
                        if (jQuery.isFunction(settings.error) && (response.alert || response.error || response.info || response.warning))
                            settings.error.call(this, response);
                        if (response.alert)
                            alert(response.alert);
                        if (response.error)
                            return $(settings.errorTarget).messagesManager('error', response.error);
                        if (response.info)
                            $(settings.errorTarget).messagesManager('info', response.info);
                        if (response.warning)
                            $(settings.errorTarget).messagesManager('warning', response.warning);
                        if (jQuery.isFunction(settings.success))
                            settings.success.call(this, response);
                    }
                },
                statusCode: {
                    401: function () {
                        $(settings.errorTarget).messagesManager('error', messages[401]);
                    },
                    403: function () {
                        document.location = window.location.pathname;
                    }, // Redirection to Login
                    404: function () {
                        $(settings.errorTarget).messagesManager('error', messages[404].format(this.url));
                    },
                    500: function () {
                        $(settings.errorTarget).messagesManager('error', messages[500].format(this.url));
                    }
                },
                complete: function (resp) {
                    $(settings.loading).hide();
                }
            });
            return false;
        },

        sendWithFiles: function (options) {
            var settings = $.extend($.extend({errorTarget: ".errors", loading: "img#loading"}, options), {
                statusCode: {
                    401: function () {
                        $(settings.errorTarget).messagesManager('error', messages[401]);
                    },
                    403: function () {
                        document.location = window.location.pathname;
                    },
                    404: function () {
                        $(settings.errorTarget).messagesManager('error', messages[404].format(settings.url));
                    }
                },
                send: function () {
                    $(settings.loading).show();
                    if (jQuery.isFunction(options.send))
                        return options.send.call(this);
                },
                success: function (data) {
                    /* try
                     {
                     response = data;//$.parseJSON(data);
                     if (response.error)
                     $(settings.errorTarget).messagesManager('error',response.error);
                     if (response.info)
                     $(settings.errorTarget).messagesManager('info',response.info);
                     if (response.warning)
                     $(settings.errorTarget).messagesManager('warning',response.warning);
                     }
                     catch (e)
                     {
                     $(settings.target).html(data);
                     response=data;
                     }*/
                    response = data;
                    if (jQuery.isFunction(options.success))
                        options.success.call(this, response);
                },
                complete: function () {
                    $(settings.loading).hide();
                    if (jQuery.isFunction(options.complete))
                        return options.complete.call(this);
                }
            });
            return $.ajax2Settings('iFrameTransport', settings);
        },

        iFrameTransport: function (options) {
            function dataToForm(data, name) {
                if (data == null )  return;
                jQuery.each(data, function (i, v) {                    
                    nameValue = (name == null) ? i : name + "[" + i + "]";
                    if (typeof v === "object")
                       dataToForm(v, nameValue);
                    else                                                                
                       $("<input type='hidden'/>").attr({value: v, name: nameValue}).appendTo($('form#uploadform'));                                        
                });
            }

            function removeIFrame() {
                $("#uploadform,#iframe_upload_id").remove();
            }

            var settings = $.extend({
                url: "/",
                send: function () {
                },
                statusCode: {},
                complete: function () {
                },
                error: function () {
                },
                success: function () {
                }
            }, options);

            $(settings.errorTarget).messagesManager('clear');


            $(settings.files).last().after('<form id="uploadform" style="display:none" class="uploadfile" action="' + settings.url +
                '" method="post" enctype="multipart/form-data" target="iframe_upload"></form>'
            );
            dataToForm(settings.data);
            var form = document.getElementById('uploadform');
            var data = new FormData(form);
            $(settings.files).each(function () {
                if (!$(this)[0].files[0] || !$(this).attr('name')) return ;
                data.append($(this).attr('name'), $(this)[0].files[0]);
            });
            settings.data = data;
            settings.contentType = false;
            settings.processData = false;
            $.ajax2Settings('send', settings);
            return true;
        }
    };

    $.ajax2Settings = function (method) {

        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.messagesManager');
        }
    };

    $.ajax2 = function (options) {
        if (options.files && $(options.files + ":file[value!='']").length)
            return $.ajax2Settings('sendWithFiles', options);
        return $.ajax2Settings('send', options);
    }

})(jQuery);


jQuery.fn.extend({
    insertAtCaret: function (myValue, myValueE) {
        myValueE = (myValueE ? myValueE : '');
        return this.each(function (i) {
            if (document.selection) {
                //For browsers like Internet Explorer
                this.focus();
                sel = document.selection.createRange();
                sel.text = myValue + myValueE;
                this.focus();
            }
            else if (this.selectionStart || this.selectionStart == '0') {
                //For browsers like Firefox and Webkit based
                var startPos = this.selectionStart;
                var endPos = this.selectionEnd;
                var scrollTop = this.scrollTop;
                this.value = this.value.substring(0, startPos) + myValue + this.value.substring(startPos, endPos) + myValueE + this.value.substring(endPos, this.value.length);
                this.focus();
                this.selectionStart = startPos + myValue.length;
                this.selectionEnd = ((startPos + myValue.length) + this.value.substring(startPos, endPos).length);
                this.scrollTop = scrollTop;
            } else {
                this.value += myValue;
                this.focus();
            }
        })
    }
});


$.fn.isVisible = function () {
    var win = $(window);
    var viewport = {top: win.scrollTop(), left: win.scrollLeft()};
    viewport.right = viewport.left + win.width();
    viewport.bottom = viewport.top + win.height();
    var bounds = this.offset();
    bounds.right = bounds.left + this.outerWidth();
    bounds.bottom = bounds.top + this.outerHeight();
    return (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));
};
