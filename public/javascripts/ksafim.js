/**
 * Created by JetBrains WebStorm.
 * User: amit
 * Date: 3/21/12
 * Time: 10:27 PM
 * To change this template use File | Settings | File Templates.
 */

(function($) {
    $(function() {
        createTemplate();
        createWidgets();
        createBindings();
    });

    function createTemplate() {
        Template = {
            pniya: Handlebars.compile($("#pniya-template").html()),
            pniyaTable: Handlebars.compile($("#pniya-table-template").html()),
            row: Handlebars.compile($("#pniya-row-template").html())
        };
    }

    function createWidgets() {
        $("#bakasha-date").bind("keydown", function(e) { e.preventDefault(); }).datepicker();
    }

    function createBindings() {
        $("#add-pniya").click(function() {
            var $pniya = createPniya().hide();
            $(".pniyot").append($pniya);
            $pniya.fadeIn(800, function() {
                $(this).find("input").focus().bind("keypress", function(e) {
                    if (e.keyCode == 13) {
                        $(this).next("button").click();
                        e.preventDefault();
                    }
                });
            });
        });

        $(".add-row").live("click", function() {
            addRow($(this).closest(".pniya").find(".pniya-table"));
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

            $input.attr("disabled", true);
            var $pniyaTable = $(Template.pniyaTable({ id: id }));
            $pniya.append($pniyaTable);
            addRow($pniyaTable);
            $this.remove();
            $(".enter-number", $pniya).remove();
            e.preventDefault();
        });

        $("input").live("keypress", function(e) {
            if (e.keyCode == 13) e.preventDefault();
        })
    }

    function createPniya() {
        return $(Template.pniya({ id: pniyaNum++ }));
    }

    var Template, pniyaNum = 0;

    function resizeCol(e) {
        console.log("pageX: " + e.pageX + ", clientX: " + e.clientX + ", screenX: " + e.screenX + ", layerX: " + e.layerX);
        var distance = window.innerWidth - e.pageX;
        $(".photo").css("width", distance);
        $(".form-wrap").css("right", distance);
    }

    function addRow($pniyaTable) {
        var id = $pniyaTable.attr("id").split("-")[2], row = $pniyaTable.data("rows");
        if (!row) {
            row = 1;
        } else {
            row++;
        }
        $pniyaTable.data("rows", row);
        $(Template.row({ id : id, row: row })).appendTo($pniyaTable.children("tbody"));
    }

})(jQuery);