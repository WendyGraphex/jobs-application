
;
(function ($) {

    var windowFocus = true;
    var chatboxFocus = new Array();
    var newMessages = new Array();
    var newMessagesWin = new Array();
    var lastMessagesIds = {};
    var chatBoxes = new Array();
    var timer;
    var NewUsersMessages = [];
    params = {
        username: "me",
        url: "",
        MaxWindows: 2,
        newMessagesTimer: 2000,
        updateList: 3000,
        maxWindowsMsg: "cant open more windows",
        start_minimized: true
    }
    var methods = {
        init: function (options) {
            params = $.extend(params, options);
            methods.updateUsersList();
            methods.updateUsersMessages();
            methods.checkNewMessageUsers();
            if (params.start_minimized) {
                $('.chat-sidebar').toggleClass("chat_min");
            }
        },
        checkOpenWindows: function () {
            var OpenBoxes = new Array();
            $(".chatbox").each(function (i, box) {
                if ($(box).css("display") == "block" && $(box).attr("state") == "free") {
                    last = $(box).find(".chatboxcontent").find(".chatboxmessage").find(".chatboxmessagecontent").last().attr("id");
                    user_id = $(box).find(".chatboxhead").find(".chatboxtitle").attr("user_id");
                    OpenBoxes[i] = {user: user_id, last_msg: last};
                }
            })

            return OpenBoxes;
        },
        uniquify: function () {

            jQuery.unique(NewUsersMessages);
        },
        updateUsersList: function (list) {
            window.setTimeout(function () {

                if (list) {
                    if (list.users.length > 0) {
                        $(".chat-sidebar").show();
                    } else {
                        $(".chat-sidebar").hide();
                    }
                    data = "";
                    $.each(list.users, function (i, item) {
                        last_id = item.last.split("-");
                        if ((item.last != $(".sidebar-name-link[id=" + item.id + "]").attr("last")) && (last_id[1] != $(".users_list").attr("id"))) {

                            NewUsersMessages.push({user: item.id, last: last_id[0]});
                        }
                        //console.log( params.username + "  :   " + item.name + "     :       " + item.last );
                        user_status = "hors_ligne";
                        icon = item.icon ? item.icon : params.avatarIcon;
                        if (item.connected) {
                            user_status = "en_ligne";
                        }
                        data += "<div class='sidebar-name'>\n\
                                                    <a class='sidebar-name-link' last='" + item.last.toString() + "' id = '" + item.id + "' name = '" + item.name + "'>\n\
                                                    <img width='30' height='30' src=" + icon + " >\n\
                                                    <span>" + item.name + "</span>\n\
                                                    <span class='user_status " + user_status + "'>\n\
                                                    </span>\n\
                                                    </a>\n\
                                                </div>";
                    })
                    $(".users_list").html(data);
                    $("#")
                }

                $(element).trigger("getUsersList");
            }, params.updateList);
        },
        updateUsersMessages: function (Messages) {
            clearTimeout(timer);
            timer = window.setTimeout(function () {
//                for (var i = NewUsersMessages.length - 1; i--; ) {
//                    if (NewUsersMessages[i] == $(".users_list").attr("id"))
//                        NewUsersMessages.splice(i, 1);
//                }
                if (Messages) {
                    $.each(Messages.users, function (i, user) {
                        id = user.id;
                        $.each(user.messages, function (i, message) {
                            $("#chatbox_" + id + " .chatboxcontent").append('<div class="chatboxmessage"><span class="chatboxmessagefrom">' + user.name + ':&nbsp;&nbsp;</span><span id=' + message.id + ' class="chatboxmessagecontent">' + message.msg + '</span></div>');
                            //$("#chatbox_" + id + " .chatboxcontent").animate({scrollTop: $(document).height()}, "fast");
                            $("#chatbox_" + id + " .chatboxhead").animate({
                                height: '20px',
                                'background-color': "red"
                            }).animate({
                                height: 'auto',
                                'background-color': "#627BAE"
                            })
                        });
//                    console.log("-------------------------------------------");
                    });
                }
                var openWindows = methods.checkOpenWindows();
                $(element).trigger("getUsersMessages", {users: openWindows});
            }, params.newMessagesTimer);
        },
        restructureChatBoxes: function () {
            align = 0;
            for (x in chatBoxes) {
                chatboxtitle = chatBoxes[x];
                if ($("#chatbox_" + chatboxtitle).css('display') != 'none') {
                    if (align == 0) {
                        $("#chatbox_" + chatboxtitle).css('right', '250px');
                    } else {
                        width = (align) * (225 + 7) + 250;
                        $("#chatbox_" + chatboxtitle).css('right', width + 'px');
                    }
                    align++;
                }
            }
        },
        chatWith: function (chatuser, box) {
//            if (methods.classCount() < params.chat_box_max ) {
            //clearTimeout(timer);
            $("#chatbox_" + chatuser.id + " .chatboxtextarea").focus();
            if (params.MaxWindows > methods.classCount()) {
                return methods.createChatBox(chatuser);
            } else {
                if ($("#chatbox_" + chatuser.id).css("display") == "block") {

                } else {
                    alert(params.maxWindowsMsg);
                }
            }

//            }else{
//                $(element).trigger("maxChatBox","You Cant chat with More than " + params.chat_box_max + " user");
//            }
        },
        setLastMessages: function (messages, box) {
//            clearTimeout(timer);
            $("#chatbox_" + box + "").attr("state", "busy");
            if (messages) {
                $.each(messages, function (i, item) {
                    $("#chatbox_" + box + " .chatboxcontent").append("<div class='chatboxmessage'><span class='chatboxmessagefrom'>" + item.name + ":&nbsp;&nbsp;</span><span id=" + item.message.id + " class='chatboxmessagecontent'>" + item.message.msg + "</span></div>");
                })
            }
            setTimeout(function () {
            }, 1000);
            $("#chatbox_" + box + "").attr("state", "free");
//            methods.updateUsersMessages();
        },
        getPreviousMessages: function (obj) {
            id_user = $(obj).prev().find(".chatboxtitle").attr("user_id");
            id_msg = $(obj).find(".chatboxmessage").first().find(".chatboxmessagecontent").attr("id");
//            console.log("user : " + id_user + " ------- msg : " + id_msg) ;
            $(element).trigger("getPreviousChatMessages", data = {user_id: id_user, first_msg: id_msg});
        },
        setPreviousChatMessages: function (data) {
            $("#chatbox_" + data.id + "").attr("state", "busy");
            if (data) {
                var container = "<div>";
                first = true;
                $.each(data.messages, function (i, item) {
                    container += "<div class='chatboxmessage'><span class='chatboxmessagefrom'>" + item.name + ":&nbsp;&nbsp;</span><span id=" + item.message.id + " class='chatboxmessagecontent'>" + item.message.msg + "</span></div>";
//                    if (first == true) {
//                        $("#chatbox_" + data.id + "  .chatboxcontent").find(".chatboxmessage").first().before("<div style='background-color : pink ' class='chatboxmessage added'><span class='chatboxmessagefrom'>" + item.name + ":&nbsp;&nbsp;</span><span id=" + item.message.id + " class='chatboxmessagecontent'>" + item.message.msg + " index " + i + "</span></div>");
//                        first = false;
//                    } else {
//                        $("#chatbox_" + data.id + "  .chatboxcontent").find(".added").last().after("<div style='background-color : orange ' class='chatboxmessage adedd'><span class='chatboxmessagefrom'>" + item.name + ":&nbsp;&nbsp;</span><span id=" + item.message.id + " class='chatboxmessagecontent'>" + item.message.msg + " index " + i + "</span></div>");
//                    }
                })
                container += "</div>"

            }
            $("#chatbox_" + data.id + "").find(".chatboxcontent").prepend(container);
            setTimeout(function () {
            }, 1000);
            $("#chatbox_" + data.id + "").attr("state", "free");
        },
        createChatBox: function (chatuser, etat) {
            if ($("#chatbox_" + chatuser.id).length > 0) {
                if ($("#chatbox_" + chatuser.id).css('display') == 'none') {
                    $("#chatbox_" + chatuser.id).css('display', 'block');
                    return methods[ "restructureChatBoxes" ].apply();
                }
                $("#chatbox_" + chatuser.id + " .chatboxtextarea").focus();
                return;
            }

            $(" <div />").attr("id", "chatbox_" + chatuser.id)
                    .attr("state", "busy")
                    .addClass("chatbox")
                    .html('<div class="chatboxhead">\n\
                            <div user_id=' + chatuser.id + '  class="chatboxtitle">' + chatuser.username + '</div>\n\
                                <div class="chatboxoptions">\n\
                                    <a href="#" class="minimizebox" > --> </a>\n\
                                    <a href="#" class="closebox" > X </a>\n\
                                </div>\n\
                                <br clear="all"/>\n\
                            </div>\n\
                            <div class="chatboxcontent">\n\
                            </div>\n\
                            <div class="chatboxinput">\n\
                                <textarea class="chatboxtextarea" >\n\</textarea>\n\
                            </div>'
                            )
                    .appendTo($(".boxses"));
            $("#chatbox_" + chatuser.id).css('bottom', '0px');
            $("#chatbox_" + chatuser.id + " .chatboxcontent").on("scroll", function () {
                console.log("---------------------------");
                if ($(this).scrollTop() == 0) {
//                    console.log("TOOOOOP");
                    return methods.getPreviousMessages(this);
                }
            });
            chatBoxeslength = 0;
            for (x in chatBoxes) {
                if ($("#chatbox_" + chatBoxes[x]).css('display') != 'none') {
                    chatBoxeslength++;
                }
            }

            if (chatBoxeslength == 0) {
                $("#chatbox_" + chatuser.id).css('right', '250px');
            } else {
                width = (chatBoxeslength) * (225 + 7) + 250;
                $("#chatbox_" + chatuser.id).css('right', width + 'px');
            }

            chatBoxes.push(chatuser.id);
            chatboxFocus[chatuser.id] = false;
            $("#chatbox_" + chatuser.id + " .chatboxtextarea").blur(function () {
                chatboxFocus[chatuser.id] = false;
                $("#chatbox_" + chatuser.id + " .chatboxtextarea").removeClass('chatboxtextareaselected');
            }).focus(function () {
                chatboxFocus[chatuser.id] = true;
                newMessages[chatuser.id] = false;
                $('#chatbox_' + chatuser.id + ' .chatboxhead').removeClass('chatboxblink');
                $("#chatbox_" + chatuser.id + " .chatboxtextarea").addClass('chatboxtextareaselected');
            });
            $("#chatbox_" + chatuser.id).click(function () {
                if ($('#chatbox_' + chatuser.id + ' .chatboxcontent').css('display') != 'none') {
                    $("#chatbox_" + chatuser.id + " .chatboxtextarea").focus();
                }
            });
            $("#chatbox_" + chatuser.id).show();
            $(element).trigger("getLastMessages", chatuser.id);
        },
        getSentMessage: function (data) {
            if (data) {
                $.each(data.users, function (i, user) {
                    id = user.id;
                    //NewUsersMessages.push({from: $(".users_list").attr("id"), to: id});
                    $.each(user.messages, function (i, message) {
                        $("#chatbox_" + id + " .chatboxcontent").append('<div class="chatboxmessage"><span class="chatboxmessagefrom">' + user.name + ':&nbsp;&nbsp;</span><span id=' + message.id + ' class="chatboxmessagecontent">' + message.msg + '</span></div>');
                        $("#chatbox_" + id + " .chatboxcontent").animate({scrollTop: $(document).height()}, "fast");
                        /*$("#chatbox_" + id + " .chatboxhead").animate({
                         height: '20px',
                         'background-color': "pink"
                         }).animate({
                         height: 'auto',
                         'background-color': "red"
                         })*/
                    });
                });
            }
        },
        closeChatBox: function (chatbox) {

            $('#' + chatbox).css('display', 'none');
            methods.restructureChatBoxes();
        },
        checkChatBoxInputKey: function (event, chatboxtextarea, chatboxtitle) {
            if (event.keyCode == 13 && event.shiftKey == 0) {
                message = $(chatboxtextarea).val();
                message = message.replace(/^\s+|\s+$/g, "");
                send_to = $("#" + chatboxtitle + " .chatboxhead .chatboxtitle").attr("user_id");
                $(chatboxtextarea).val('');
                $(chatboxtextarea).focus();
                $(chatboxtextarea).css('height', '44px');
                if (message != '') {
                    $(element).trigger("sendMessage", {user: send_to, msg: message});
                    //  message = message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\"/g, "&quot;");
                    //  $("#" + chatboxtitle + " .chatboxcontent").append('<div class="chatboxmessage"><span class="chatboxmessagefrom">' + params.username + ':&nbsp;&nbsp;</span><span id='+  +' class="chatboxmessagecontent">' + message + '</span></div>');
                    $("#" + chatboxtitle + " .chatboxcontent").scrollTop($("#" + chatboxtitle + " .chatboxcontent")[0].scrollHeight);
                }
//                chatHeartbeatTime = minChatHeartbeat;
                chatHeartbeatCount = 1;
                return false;
            }

            var adjustedHeight = chatboxtextarea.clientHeight;
            var maxHeight = 94;
            if (maxHeight > adjustedHeight) {
                adjustedHeight = Math.max(chatboxtextarea.scrollHeight, adjustedHeight);
                if (maxHeight)
                    adjustedHeight = Math.min(maxHeight, adjustedHeight);
                if (adjustedHeight > chatboxtextarea.clientHeight)
                    $(chatboxtextarea).css('height', adjustedHeight + 8 + 'px');
            } else {
                $(chatboxtextarea).css('overflow', 'auto');
            }

        },
        removeUserIdFromArray: function (id) {
            //console.log("------------remove----------->" + id);
            $.each(NewUsersMessages, function (i, item) {
                if (item.user == id)
                    NewUsersMessages.splice(i, 1);
            })
        },
        toggleChatBoxGrowth: function (chatbox) {
//            alert(chatbox);
            if ($('#' + chatbox + ' .chatboxcontent').css('display') == 'none') {

                $('#' + chatbox + ' .chatboxcontent').find(".minimizebox").html("<img width='40px' height='40px' src='../../pictures/icons/minimaze.png' />");
                $('#' + chatbox + ' .chatboxcontent').css('display', 'block');
                $('#' + chatbox + ' .chatboxinput').css('display', 'block');
//                $("#" + chatbox + " .chatboxcontent").scrollTop($("#chatbox_" + chatbox + " .chatboxcontent")[0].scrollHeight);
            } else {
                $('#' + chatbox + ' .chatboxcontent').find(".minimizebox").html("<img width='40px' height='40px' src='../../pictures/icons/maximize.png' />");
                $('#' + chatbox + ' .chatboxcontent').css('display', 'none');
                $('#' + chatbox + ' .chatboxinput').css('display', 'none');
            }
        },
        classCount: function () {
            var count = 0;
            $(".chatbox").each(function () {
                if ($(this).css("display") == "block") {
                    count++;
                }
            });
            return count;
        },
        checkNewMessageUsers: function () {
            setInterval(function () {
                console.log("------------");
                methods.uniquify();
                $.each(NewUsersMessages, function (i, item) {
                    console.log(item);
                    $(".sidebar-name-link").each(function (i, user) {
                        if ($(user).attr("id") == item.user) {
                            $(user).css("background-color", "#e74c3c");
                            $(user).css("transition", "1s all");
                        }

                    })
                })
                console.log("------------");
                t = null;
                function blinkTitle() {
                    if (NewUsersMessages.length != 0) {

                        //document.title = '.';
                        setTimeout(function () {
                            document.title = '.';
                        }, 600);
                        document.title = ' Vous avez ' + NewUsersMessages.length + ' nouveau messages ';
                        blinkTitle();
                    } else {
                        document.title = 'www.ewebsolutionskech-dev.com';
                    }
                }
                ;
                t = setTimeout(blinkTitle(), 1000);
                clearTimeout(t);
                t = null;
            }, 800);
//            setInterval(function () {
//                if (NewUsersMessages.length != 0) {
//                    document.title = document.title.substring(1) + document.title.substring(0, 1);
//                } else {
//                    document.title = "www.ewebsolutionskech-dev.com";
//                }
//            }, 1000);

        }
    };
    $.fn.chat = function (methodOrOptions) {
        element = this;
        if (methods[methodOrOptions]) {
            return methods[ methodOrOptions ].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof methodOrOptions === 'object' || !methodOrOptions) {

            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + methodOrOptions + ' does not exist ');
        }

    };
    $(document).on("click", ".sidebar-name-link", function () {
        //clearTimeout(timer);
        return methods.chatWith({username: $(this).attr("name"), id: $(this).attr("id")}, $(this).attr("id"));
    });
    $(document).on("keydown", ".chatboxtextarea", function (event) {
        box_id = $(this).parents(".chatbox").attr("id");
        return methods.checkChatBoxInputKey(event, this, box_id);
    });
    $(document).on("keyup", ".chat_search_bar", function () {
        text = $(this).val().toLowerCase();
        if (text != "") {
            $(".users_list").hide("fast");
            $(".users_search").empty();
            $(".sidebar-name").each(function (i, u) {
                user_name = $(u).find(".sidebar-name-link span").html().toLowerCase();
                if (user_name.indexOf(text.toLowerCase()) > -1) {
                    console.log("found ! ");
                    $(".users_search").append($(u));
                }
            })
        } else {
            $(".users_list").show("fast");
            $(".users_search").empty();
        }

    });
//    $(".chatboxcontent").on("scroll",function () {
//        console.log("You've scrolled " + $(this).scrollTop() + " pixels");
//    });

    $(document).on("click", ".closebox", function () {
        box_id = $(this).parents(".chatbox").attr("id");
        return methods.closeChatBox(box_id);
        return false;
//        alert($(this).parent(".sidebar-name-link").attr(id));
//        console.log($(this).parent(".sidebar-name-link").attr(id));
    });
    $(document).on("focus", ".chatboxtextarea", function () {
        box_id = $(this).parents(".chatbox").find(".chatboxhead").find(".chatboxtitle").attr("user_id");
        return methods.removeUserIdFromArray(box_id);
    });
    $(document).on("click", ".minimizebox", function () {
        box_id = $(this).parents(".chatbox").attr("id");
        return methods.toggleChatBoxGrowth(box_id);
        return false;
//        alert($(this).parent(".sidebar-name-link").attr(id));
//        console.log($(this).parent(".sidebar-name-link").attr(id));
    });
})(jQuery);
function showoptions() {
    $(".chat_options_modal").slideToggle("slow");
}
$(document).ready(function () {
    $(".minimaz_chat").click(function () {

        $("#topbar").toggle(function () {
            $(this).animate({
                "height": "auto"
            }, 500);
        }, function () {
            $(this).animate({
                "height": "45px"
            }, 500);
        });
    });
})







































//
//;
//(function ($, window, document, undefined) {
//
//    var pluginName = 'chat';
//    var chatboxFocus = new Array();
//    var newMessages = new Array();
//    var newMessagesWin = new Array();
//    var chatBoxes = new Array();
//    params = {
//        username: "yassine",
//        scroll_user_count: 5,
//        chat_box_max: 2,
//        start_minimized: false
//    };
//    setings = {};
//    var e;
//    function Plugin(element, options) {
//        e = element;
//        setings = $.extend(params, options);
//        //console.log(params);
//        this._name = pluginName;
//        this.init();
//    }
//
//    $.fn[pluginName] = function (options,p) {
//        
//        return this.each(function () {
//            if (!$.data(this, 'plugin_' + pluginName)) {
//                console.log("if");
//                $.data(this, 'plugin_' + pluginName, new Plugin(this, options));
//            }
//            else if (Plugin.prototype[options]) {
//                console.log("else");
//                $.data(this, 'plugin_' + pluginName)[options](p);
//            }
//        });
//    }
//
//    Plugin.prototype = {
//        init: function (name) {
//            if (setings.start_minimized) {
//                $('.chat-sidebar').toggleClass("chat_min")
//            }
//            $(e).trigger("testEvent");
////            $(e).trigger("testEvent");
//        },
//        test: function () {
//            alert("oléé");
//        },
//        updateUserList: function (list) {
//            window.setTimeout(function () {
//                $(".users_list").empty();
//                if (list) {
//                    $.each(list.users, function (i, item) {
//                        user_status = "hors_ligne";
//                        if (item.connected) {
//                            user_status = "en_ligne";
//                        }
//                        $(".users_list").append("<div class='sidebar-name'>\n\
//                                                    <a class = 'sidebar-name-link' id = '" + item.id + "' name = '" + item.name + "'>\n\
//                                                    <img width = '30' height = '30' src =''>\n\
//                                                    <span> " + item.name + " </span>\n\
//                                                    <span class = 'user_status " + user_status + "'>\n\
//                                                    </span>\n\
//                                                    </a>\n\
//                                                </div>");
//                    })
//                }
//            }, 3000);
//
//
//        },
//        toggleChatBoxGrowth: function (chatbox) {
////            alert(chatbox);
//            if ($('#' + chatbox + ' .chatboxcontent').css('display') == 'none') {
//
//                $('#' + chatbox + ' .chatboxcontent').css('display', 'block');
//                $('#' + chatbox + ' .chatboxinput').css('display', 'block');
////                $("#" + chatbox + " .chatboxcontent").scrollTop($("#chatbox_" + chatbox + " .chatboxcontent")[0].scrollHeight);
//            } else {
//
//                $('#' + chatbox + ' .chatboxcontent').css('display', 'none');
//                $('#' + chatbox + ' .chatboxinput').css('display', 'none');
//            }
//        },
//        checkChatBoxInputKey: function (event, chatboxtextarea, chatboxtitle) {
//
//            if (event.keyCode == 13 && event.shiftKey == 0) {
//                message = $(chatboxtextarea).val();
//                message = message.replace(/^\s+|\s+$/g, "");
//                $(chatboxtextarea).val('');
//                $(chatboxtextarea).focus();
//                $(chatboxtextarea).css('height', '44px');
//                if (message != '') {
//                    message = message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\"/g, "&quot;");
//                    $("#" + chatboxtitle + " .chatboxcontent").append('<div class="chatboxmessage"><span class="chatboxmessagefrom">' + params.username + ':&nbsp;&nbsp;</span><span class="chatboxmessagecontent">' + message + '</span></div>');
//                    $("#" + chatboxtitle + " .chatboxcontent").scrollTop($("#" + chatboxtitle + " .chatboxcontent")[0].scrollHeight);
//                }
//                chatHeartbeatTime = minChatHeartbeat;
//                chatHeartbeatCount = 1;
//                return false;
//            }
//
//            var adjustedHeight = chatboxtextarea.clientHeight;
//            var maxHeight = 94;
//            if (maxHeight > adjustedHeight) {
//                adjustedHeight = Math.max(chatboxtextarea.scrollHeight, adjustedHeight);
//                if (maxHeight)
//                    adjustedHeight = Math.min(maxHeight, adjustedHeight);
//                if (adjustedHeight > chatboxtextarea.clientHeight)
//                    $(chatboxtextarea).css('height', adjustedHeight + 8 + 'px');
//            } else {
//                $(chatboxtextarea).css('overflow', 'auto');
//            }
//
//        },
//        closeChatBox: function (chatbox) {
//
//            $('#' + chatbox).css('display', 'none');
//            this.restructureChatBoxes();
////            $.post("chat.php?action=closechat", {chatbox: chatbox}, function (data) {
////            }
////            );
//        },
//        classCount: function () {
//            var count = 0;
//            $(".chatbox").each(function () {
//                if ($(this).css("display") == "block") {
//                    count++;
//                }
//            });
//            return count;
//        },
//        createChatBox: function (chatuser, minimizeChatBox) {
//            if ($("#chatbox_" + chatuser.id).length > 0) {
//                if ($("#chatbox_" + chatuser.id).css('display') == 'none') {
//                    $("#chatbox_" + chatuser.id).css('display', 'block');
//                    return this.restructureChatBoxes();
//                }
//                $("#chatbox_" + chatuser.id + " .chatboxtextarea").focus();
//                return;
//            }
//            $(" <div />").attr("id", "chatbox_" + chatuser.id)
//                    .addClass("chatbox")
//                    .html('<div class="chatboxhead">\n\
//                            <div   class="chatboxtitle">' + chatuser.username + '</div>\n\
//                                <div class="chatboxoptions">\n\
//                                    <a href="#" class="minimizebox" > ___ </a>\n\
//                                    <a href="#" class="closebox" > X </a>\n\
//                                </div>\n\
//                                <br clear="all"/>\n\
//                            </div>\n\
//                            <div class="chatboxcontent">\n\
//                            </div>\n\
//                            <div class="chatboxinput">\n\
//                                <textarea class="chatboxtextarea" ></textarea>\n\
//                            </div>'
//                            )
//                    .appendTo($(".boxses"));
//            $("#chatbox_" + chatuser.id).css('bottom', '0px');
//            chatBoxeslength = 0;
//            for (x in chatBoxes) {
//                if ($("#chatbox_" + chatBoxes[x]).css('display') != 'none') {
//                    chatBoxeslength++;
//                }
//            }
//
//            if (chatBoxeslength == 0) {
//                $("#chatbox_" + chatuser.id).css('right', '250px');
//            } else {
//                width = (chatBoxeslength) * (225 + 7) + 250;
//                $("#chatbox_" + chatuser.id).css('right', width + 'px');
//            }
//
//            chatBoxes.push(chatuser.id);
//            if (minimizeChatBox == 1) {
//                minimizedChatBoxes = new Array();
//                if ($.cookie('chatbox_minimized')) {
//                    minimizedChatBoxes = $.cookie('chatbox_minimized').split(/\|/);
//                }
//                minimize = 0;
//                for (j = 0; j < minimizedChatBoxes.length; j++) {
//                    if (minimizedChatBoxes[j] == chatboxtitle) {
//                        minimize = 1;
//                    }
//                }
//
//                if (minimize == 1) {
//                    $('#chatbox_' + chatuser.id + ' .chatboxcontent').css('display', 'none');
//                    $('#chatbox_' + chatuser.id + ' .chatboxinput').css('display', 'none');
//                }
//            }
//
//            chatboxFocus[chatuser.id] = false;
//            $("#chatbox_" + chatuser.id + " .chatboxtextarea").blur(function () {
//                chatboxFocus[chatuser.id] = false;
//                $("#chatbox_" + chatuser.id + " .chatboxtextarea").removeClass('chatboxtextareaselected');
//            }).focus(function () {
//                chatboxFocus[chatuser.id] = true;
//                newMessages[chatuser.id] = false;
//                $('#chatbox_' + chatuser.id + ' .chatboxhead').removeClass('chatboxblink');
//                $("#chatbox_" + chatuser.id + " .chatboxtextarea").addClass('chatboxtextareaselected');
//            });
//            $("#chatbox_" + chatuser.username).click(function () {
//                if ($('#chatbox_' + chatuser.id + ' .chatboxcontent').css('display') != 'none') {
//                    $("#chatbox_" + chatuser.id + " .chatboxtextarea").focus();
//                }
//            });
//            $("#chatbox_" + chatuser.id).show();
//        },
//        restructureChatBoxes: function () {
//            align = 0;
//            for (x in chatBoxes) {
//                chatboxtitle = chatBoxes[x];
//                if ($("#chatbox_" + chatboxtitle).css('display') != 'none') {
//                    if (align == 0) {
//                        $("#chatbox_" + chatboxtitle).css('right', '250px');
//                    } else {
//                        width = (align) * (225 + 7) + 250;
//                        $("#chatbox_" + chatboxtitle).css('right', width + 'px');
//                    }
//                    align++;
//                }
//            }
//        },
//        chatWith: function (chatuser) {
//
//            if (setings.chat_box_max > this.classCount()) {
//                this.createChatBox(chatuser);
//                $("#chatbox_" + chatuser.id + " .chatboxtextarea").focus();
//            } else {
//                alert("Tu peut pas ...");
//            }
//        }
//    }
////        $( element ).trigger( "sendMessage" , Plugin.prototype.createChatBox(user) );
//    $(document).on("click", ".sidebar-name-link", function () {
//        Plugin.prototype.chatWith(pars = {username: $(this).attr("name"), id: $(this).attr("id")});
//    });
//    $(document).on("keydown", ".chatboxtextarea", function () {
//        box_id = $(this).parents(".chatbox").attr("id");
//        return Plugin.prototype.checkChatBoxInputKey(event, this, box_id)
//    });
//    $(document).on("click", ".closebox", function () {
//        box_id = $(this).parents(".chatbox").attr("id");
//        return Plugin.prototype.closeChatBox(box_id);
//    });
//    $(document).on("click", ".minimizebox", function () {
//        box_id = $(this).parents(".chatbox").attr("id");
//        return Plugin.prototype.toggleChatBoxGrowth(box_id);
//    });
//
//})(jQuery, window, document);
//
//
//function showoptions() {
//    $(".chat_options_modal").slideToggle("slow");
//}
//$(document).ready(function () {
//    $(".minimaz_chat").click(function () {
//        
//        $('.chat-sidebar').toggleClass("chat_max").toggleClass("chat_min");
//    })
//})