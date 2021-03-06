﻿app.controller('DashboardController', ['$scope', '$interval', 'DashboardService',
    function ($scope, $interval, DashboardService) {
        angular.element("#wrapper").show();
        
        $scope.SessionData = function () {
            DashboardService.SessionData().success(function (result) {
                $scope.SessionData_User_ID = result["User_ID"];
                $scope.SessionData_FirstName = result["FirstName"];
                $scope.SessionData_LastName = result["LastName"];
                $scope.SessionData_Email = result["Email"];
                $scope.SessionData_Practice_ID = result["Practice_ID"];
                $scope.SessionData_AccessLevel = result["AccessLevel"];
                
                DashboardService.GetAllMessages($scope.SessionData_User_ID).then(function (result) {
                    $scope.Messages = result.data;
                });

                DashboardService.NumOfUnReadMessages($scope.SessionData_User_ID).then(function (result) {
                    $scope.NumOfUnReadMessages = result.data["NumOfUnReadMessages"];
                });
            });
        };
        $scope.SessionData();

        $scope.GetAllPractices = function () {
            DashboardService.GetAllPractices().then(function (result) {
                $scope.Practices = result.data;
             });
        };
        $scope.GetAllPractices();

        //Load data by practice id
        $scope.GetNumPatientsByPractice = function (GetPractice_ID) {            
            DashboardService.GetNumPatientsByPractice(GetPractice_ID).then(function (result) {
                $scope.TotalNumOfVisits = result.data["TotalNumOfVisits"];
                $scope.Total = result.data["Total"];
                $scope.TotalAmountPaid = result.data["AmountPaid"];
                $scope.TotalBalanceOwing = result.data["BalanceOwing"];
                $scope.Amount = result.data["Amount"];

                google.charts.load('current', { 'packages': ['corechart'] });
                google.charts.setOnLoadCallback(drawChart);
                function drawChart() {

                    var data = google.visualization.arrayToDataTable([
                      ['Task', 'Hours per Day'],
                      ['Total Visits', $scope.TotalNumOfVisits],
                      ['Expected Income', $scope.Total],
                      ['Actual Income', $scope.TotalAmountPaid],
                      ['Balance Due', $scope.TotalBalanceOwing]
                    ]);

                    var options = {
                        pieSliceText: 'value',
                        is3D: true
                    };
                    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                    chart.draw(data, options);
                }
            });
        };

        $scope.GetRevenueSummary_Today = function (Practice_ID) {
            DashboardService.GetRevenueSummary_Today(Practice_ID).then(function (result) {
                $scope.TotalNumOfVisits_Summary = result.data["TotalNumOfVisits"];
                $scope.Total_Summary = result.data["Total"];
                $scope.TotalAmountPaid_Summary = result.data["AmountPaid"];
                $scope.TotalBalanceOwing_Summary = result.data["BalanceOwing"];
                $scope.Amount_Summary = result.data["Amount"];
            });
        };
        
        $scope.GetRevenueSummary_Week = function (Practice_ID) {
            DashboardService.GetRevenueSummary_Week(Practice_ID).then(function (result) {
                $scope.TotalNumOfVisits_Summary = result.data["TotalNumOfVisits"];
                $scope.Total_Summary = result.data["Total"];
                $scope.TotalAmountPaid_Summary = result.data["AmountPaid"];
                $scope.TotalBalanceOwing_Summary = result.data["BalanceOwing"];
                $scope.Amount_Summary = result.data["Amount"];
            });
        };

        $scope.GetRevenueSummary_Month = function (Practice_ID) {
            DashboardService.GetNumPatientsByPractice(Practice_ID).then(function (result) {
                $scope.TotalNumOfVisits_Summary = result.data["TotalNumOfVisits"];
                $scope.Total_Summary = result.data["Total"];
                $scope.TotalAmountPaid_Summary = result.data["AmountPaid"];
                $scope.TotalBalanceOwing_Summary = result.data["BalanceOwing"];
                $scope.Amount_Summary = result.data["Amount"];
            });
        };

        $scope.Consulations_Visits = function (Practice_ID) {            
            DashboardService.Consulations_Visits(Practice_ID).then(function (result) {
                
                DashboardService.Appointment_Stats(Practice_ID).then(function (result_Appointment_Stats) {
                
                    var Consulations_Visits = [];

                    for (var i = 0; i < result.data.length; i++) {
                        Consulations_Visits.push([result.data[i]["Month"], result.data[i]["TotalNumOfVisits"], result_Appointment_Stats.data[i]["TotalNumOfVisits"]]);
                    }

                    //Line Graph- TotalNumOfVisits per Day Per Month
                    google.charts.load('current', { 'packages': ['line'] });
                    google.charts.setOnLoadCallback(drawChart_TotalNumOfVisits);

                    function drawChart_TotalNumOfVisits() {

                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'Month (2016)');
                        data.addColumn('number', 'Number of consultations');
                        data.addColumn('number', 'Number of appointments');

                        data.addRows(Consulations_Visits);
                        var options = {                        
                            legend: { position: 'bottom' },
                            is3D: true
                        };

                        var chart = new google.charts.Line(document.getElementById('linechart_material'));
                        chart.draw(data, options);
                    }
                });
            });
        };

        //MedicineInventory Stock Count
        $scope.GetMedicineInventoryStockCount = function (Practice_ID) {
            DashboardService.MedicineInventoryStockCount(Practice_ID).then(function (result) {
                $scope.MedicineInventoryStockCount = result.data;
            });
        };

        $scope.displayedDiv = 1;
        $scope.ShowPendingAppDiv = function (Practice_ID) {
            $scope.GetPendingAppointmentsByPracticeID(Practice_ID);
            angular.element("#tab_actions_pending").show();
            angular.element("#tab_actions_approved").hide();
            angular.element("#tab_actions_rejected").hide();
            $scope.displayedDiv = 1;
        };
        $scope.ShowApprovedAppDiv = function (Practice_ID) {
            $scope.GetAppovedAppointmentsByPracticeID(Practice_ID);
            angular.element("#tab_actions_pending").hide();
            angular.element("#tab_actions_approved").show();
            angular.element("#tab_actions_rejected").hide();
            $scope.displayedDiv = 2;
        };
        $scope.ShowRejectedAppDiv = function (Practice_ID) {
            $scope.GetRejectedAppointmentsByPracticeID(Practice_ID);
            angular.element("#tab_actions_pending").hide();
            angular.element("#tab_actions_approved").hide();
            angular.element("#tab_actions_rejected").show();
            $scope.displayedDiv = 3;
        };
        
        $scope.GetPendingAppointmentsByPracticeID = function (Practice_ID) {
            DashboardService.GetPendingAppointmentsByPracticeID(Practice_ID).then(function (result) {
                angular.element("#tab_actions_pending").show();
                $scope.PendingAppointments = result.data;
                $scope.PendingAppointments_Value = $scope.PendingAppointments.length;
                $scope.GetMedicineInventoryStockCount(Practice_ID);
            });
        };

        $scope.GetAppovedAppointmentsByPracticeID = function (Practice_ID) {
            DashboardService.GetAppovedAppointmentsByPracticeID(Practice_ID).then(function (result) {
                $scope.ApprovedAppointments = result.data;
                $scope.ApprovedAppointments_Value = $scope.ApprovedAppointments.length;
            });
        };

        $scope.GetRejectedAppointmentsByPracticeID = function (Practice_ID) {
            DashboardService.GetRejectedAppointmentsByPracticeID(Practice_ID).then(function (result) {
                $scope.RejectedAppointments = result.data;
                $scope.RejectedAppointments_Value = $scope.RejectedAppointments.length;
            });
        };

        $scope.AppoveAppointment = function (ID, Practice_ID) {
            DashboardService.AppoveAppointment(ID).then(function (result) {
                $scope.GetPendingAppointmentsByPracticeID(Practice_ID);
                btnSuccess("Appointment status successfully updated.\nAppointment Appoved.");
            }, function (error) {
                btnAlert("System Error Message", "Appointment status not successfully updated.");
            });
        };

        $scope.RejectAppointment = function (ID, Practice_ID) {
            DashboardService.RejectAppointment(ID).then(function (result) {
                $scope.GetRejectedAppointmentsByPracticeID(Practice_ID);
                $scope.GetPendingAppointmentsByPracticeID(Practice_ID);
                $scope.GetAppovedAppointmentsByPracticeID(Practice_ID)
                btnSuccess("Appointment status successfully updated.\nAppointment Rejected.");
            }, function (error) {
                btnAlert("System Error Message", "Appointment status not successfully updated.");
            });
        };

        

    }]);