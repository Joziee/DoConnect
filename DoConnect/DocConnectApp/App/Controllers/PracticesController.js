﻿app.controller("PracticesController", ["$scope", "PracticesService", "$interval", 
    function ($scope, PracticesService, $interval) {

        $scope.PageTitle_Practices = 'Practices';
        $scope.PageTitle_NewPractice = 'New Practices Details';
        
        //Sort Function
        $scope.sort = function (keyname) {
            $scope.sortKey = keyname;
            $scope.reverse = !$scope.reverse;
        };

        //Select All Practices
        $scope.GetAllPractices = function () {
            PracticesService.GetAllPractices().then
            (function (result) {
                $scope.Practices = result.data;
            });
        };
        $scope.GetAllPractices();

        //Select PracticeByID Function
        $scope.ViewPractice = function (ID) {
            PracticesService.GetPracticeByID(ID).success(function (result) {
                //$(".readonly_ViewPractice").val("");
                $scope.ID = result["ID"];
                $scope.Name = result["Name"];
                $scope.Phone_Number = result["Phone_Number"];
                $scope.Fax_Number = result["Fax_Number"];
                $scope.Street_Address = result["Street_Address"];
                $scope.Suburb = result["Suburb"];
                $scope.City = result["City"];
                $scope.Country = result["Country"];
                $scope.Trading_Times = result["Trading_Times"];
            });
        };

        //Insert Practice Funtion
        $scope.NewPractice = function (Name, Phone_Number, Fax_Number, Street_Address, Suburb, City, Country, Trading_Times) {
            PracticesService.InsertPractice(Name, Phone_Number, Fax_Number, Street_Address, Suburb, City, Country, Trading_Times).success(function () {
                $scope.GetAllPractices();
                angular.element(".insert").val('');
                btnSuccess("Practice successfully inserted.");
            },
                function (error) {
                    btnAlert("System Error Message", "Insert unsuccessful.");
            });
        };

        //Validation
        $scope.pattern_Email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        $scope.pattern_Number = /^[0-9]{1,6}$/;
        $scope.pattern_String = /^[a-zA-Z ]{1,25}$/;



        //Update Practice Funtion
        $scope.function_btnUpdatePractice = function (ID) {
            var btnText = angular.element("#function_btnUpdatePractice").html();
            if (btnText == "Update") {
                angular.element(".readonly_ViewPractice").attr("readonly", false);
                angular.element("#function_btnUpdatePractice").html("Save");
            }
            else {
                PracticesService.UpdatePractice($scope.ID, $scope.Name, $scope.Phone_Number, $scope.Fax_Number, $scope.Street_Address, $scope.Suburb, $scope.City, $scope.Country, $scope.Trading_Times).success(function () {
                    $scope.GetAllPractices();
                    btnSuccess("Practice details successfully updated.");
                }, function (error) {
                    btnAlert("System Error Message", "Update unsuccessful.");
                });

                angular.element(".readonly_ViewPractice").attr("readonly", true);
                angular.element(".readonly_ViewPractice").css("background-color", "transparent");
                angular.element("#function_btnUpdatePractice").html("Update");
            }
        };

        //Delete Practice Funtion
        $scope.DeletePractice = function () {
            //var DeleteStatus = btnConfirm("info", "Are you sure you want to delete this Practice?");
            //if (DeleteStatus == "true") {
                PracticesService.DeletePractice($scope.ID).then(function () {
                    $scope.GetAllPractices();                                       
                }, function (error) {
                    btnAlert("System Error Message", "Delete unsuccessful.");
                });
            //}            
        };
    }]);