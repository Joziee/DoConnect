﻿app.controller('DashboardController',['$scope', '$interval', 'DashboardService',
    function ($scope, $interval, DashboardService) {
        angular.element("#wrapper").show();
        //google.charts.load("current", { packages: ["corechart"] });
        //google.charts.setOnLoadCallback(drawChart); 
        //function drawChart() {
        //    var data = google.visualization.arrayToDataTable([
        //      ['Appointment Stats', 'Number Of Patients'],
        //      ['Arrived', 11],
        //      ['Cancelled', 2],
        //      ['No Show', 2],
        //      ['Pre-Scheduled', 2]
        //    ]);

        //    var options = {
        //        title: 'Appointment Stats',
        //        is3D: true,
        //    };

        //    var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        //    chart.draw(data, options);
        //}
        //$scope.FirstName = JSON.stringify(sessionStorage.FirstName);
        //$scope.FirstName = JSON.parse($scope.FirstName);              
        //$scope.LastName = JSON.stringify(sessionStorage.LastName);
        //$scope.LastName = JSON.parse($scope.LastName);


        alert(sessionStorage.FirstName);
        
    }]);