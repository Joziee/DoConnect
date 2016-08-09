﻿app.controller("EventsController", ["$scope", "EventsService", "$interval",
    function ($scope, EventsService, $interval) {

        var init_ControlSettings = function () {
            angular.element(".readonly").css("border", "none");
            angular.element(".readonly").css("background-color", "transparent");
            angular.element(".readonly").css("font-size", "13px");
            angular.element(".readonly").css("padding-right", "0px");
            angular.element(".readonly_ViewEvent").attr("readonly", true);
            angular.element("#myFunctionEvents_Edit").show(); angular.element("#myFunctionEvents_Save").hide();
        };
        init_ControlSettings();

        $scope.myFunctionEvents_Edit = function () {
            angular.element("#myFunctionEvents_Edit").hide(); angular.element("#myFunctionEvents_Save").show();
            angular.element(".readonly").attr("readonly", false);
            angular.element(".readonly").css("border", "1px solid #ccc");
        };

        $scope.myFunctionEvents_Save = function () {
            angular.element("#myFunctionEvents_Edit").show(); angular.element("#myFunctionEvents_Save").hide();
            angular.element(".readonly").attr("readonly", true);
            angular.element(".readonly").css("border", "none");
            angular.element(".readonly").css("background-color", "transparent");
        };

        $scope.function_btnUpdateEvent = function () {
            var btnText = angular.element("#function_btnUpdateEvent").html();
            if (btnText == "Update") {
                angular.element(".readonly_ViewEvent").attr("readonly", false);
                angular.element("#function_btnUpdateEvent").html("Save");
            }
            else {
                angular.element(".readonly_ViewEvent").attr("readonly", true);
                angular.element("#function_btnUpdateEvent").html("Update");
            }
        };

        $scope.DT = function () {
            $("#datetimepicker1").datetimepicker();
            $("#datetimepicker2").datetimepicker({
                useCurrent: false
            });
            $("#datetimepicker1").on("dp.change", function (e) {
                $("#datetimepicker2").data("DateTimePicker").minDate(e.date);
            });
            $("#datetimepicker2").on("dp.change", function (e) {
                $("#datetimepicker1").data("DateTimePicker").maxDate(e.date);
            });
        };

        $scope.DT_View_Events = function () {
            $("#datetimepicker3").datetimepicker();
            $("#datetimepicker4").datetimepicker({
                useCurrent: false
            });
            $("#datetimepicker3").on("dp.change", function (e) {
                $("#datetimepicker4").data("DateTimePicker").minDate(e.date);
            });
            $("#datetimepicker4").on("dp.change", function (e) {
                $("#datetimepicker3").data("DateTimePicker").maxDate(e.date);
            });
        };

        $scope.DT_New_Event = function () {
            $("#datetimepicker5").datetimepicker();
            $("#datetimepicker6").datetimepicker({
                useCurrent: false
            });
            $("#datetimepicker5").on("dp.change", function (e) {
                $("#datetimepicker6").data("DateTimePicker").minDate(e.date);
            });
            $("#datetimepicker6").on("dp.change", function (e) {
                $("#datetimepicker5").data("DateTimePicker").maxDate(e.date);
            });
        };
    }]);