/**
 * Created by JetBrains WebStorm.
 * User: amit
 * Date: 3/21/12
 * Time: 10:27 PM
 * To change this template use File | Settings | File Templates.
 */
(function($) {
    window.KsafimApi = {
        createPniya: function() {
            var $pniya = $(Template.pniya({ id: pniyaNum++ })).hide();
            $(".pniyot").append($pniya);
            $pniya.fadeIn(800, function() {
                $(this).find("input").focus().bind("keypress", function(e) {
                    if (e.keyCode == 13) {
                        $(this).next("button").click();
                        e.preventDefault();
                    }
                });
            });
        }
    };


    $(function() {
        createTemplate();
        createWidgets();
        createBindings();

        pniyaNum = $("div[id^=pniya-]").length
    });

    function createTemplate() {
        Template = {
            pniya: Handlebars.compile($("#pniya-template").html()),
            pniyaTable: Handlebars.compile($("#pniya-table-template").html()),
            row: Handlebars.compile($("#pniya-row-template").html())
        };
    }

    function createWidgets() {
        $("#bakasha_recv_date").bind("keydown", function(e) { e.preventDefault(); }).datepicker();
    }

    function createBindings() {

        $(".add-row").live("click", function() {
            addRow($(this).closest(".pniya"));
        });

        $("#divider").bind("mousedown", function() {
            console.log("mousedown");
            $(document).bind("mousemove", resizeCol).bind("mouseup", function() {
                $(document).unbind("mousemove", resizeCol).unbind("mouseup", arguments.callee);
            });
        });

        $(".start-filling").live("click", function(e) {
            var $this = $(this), $pniya = $this.closest(".pniya");
            var $input = $this.prev("input");
            var id = $input.val();

            if (id == "" || isNaN(Number(id))) {
                $(".enter-number", $pniya).css("display", "inline");
                e.preventDefault();
                return;
            }
            id = Number(id);

            $input.bind("keypress mousedown", function() { return false; }).addClass("disabled");
            var $pniyaTable = $(Template.pniyaTable({ id: id }));
            $pniya.append($pniyaTable);
            addRow($pniya);
            $this.remove();
            $(".enter-number", $pniya).remove();
            e.preventDefault();
        });

        $("input").live("keypress", function(e) {
            if (e.keyCode == 13) e.preventDefault();
        })
    }

    var Template, pniyaNum;

    function resizeCol(e) {
        var distance = window.innerWidth - e.pageX;
        $(".photo").css("width", distance);
        $(".form-wrap").css("right", distance + 8);
    }

    function addRow($pniya) {
        var id = $pniya.attr("id").split("-")[1], row = $pniya.data("rows");
        if (!row) {
            row = 1;
        } else {
            row++;
        }
        $pniya.data("rows", row);
        $(Template.row({ pniya_id : id, id: row })).appendTo($pniya.find(".pniya-table").children("tbody"));
    }

})(jQuery);
