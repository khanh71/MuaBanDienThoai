<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang Chủ Admin</title>
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript">
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Home.aspx/congty',
                data: '{}',
                success:
                    function (response) {
                        drawchart(response.d);
                    },
                error: function () {
                    alert("Lỗi trong quá trình lấy dữ liệu, vui lòng thử lại sau");
                }
            });
        })
        function drawchart(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Countryname, dataValues[i].Total]);
            }
            new google.visualization.PieChart(document.getElementById('chartdiv')).
                draw(data, { title: "TỈ LỆ PHÂN BỐ SẢN PHẨM THEO CÔNG TY" });
        }
        //--------------------------------------------------------------
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Home.aspx/thanhtoan',
                data: '{}',
                success:
                    function (response) {
                        drawchart1(response.d);
                    },
                error: function () {
                    alert("Lỗi trong quá trình lấy dữ liệu, vui lòng thử lại sau");
                }
            });
        })
        function drawchart1(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Countryname, dataValues[i].Total]);
            }
            new google.visualization.PieChart(document.getElementById('chartdiv1')).
                draw(data, { title: "XU HƯỚNG THANH TOÁN KHI MUA HÀNG" });
        }
        //-------------------------------------------------------------------
        $(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Home.aspx/dienthoai',
                data: '{}',
                success:
                    function (response) {
                        drawchart2(response.d);
                    },
                error: function () {
                    alert("Lỗi trong quá trình lấy dữ liệu, vui lòng thử lại sau");
                }
            });
        })
        function drawchart2(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].Countryname, dataValues[i].Total]);
            }
            new google.visualization.ColumnChart(document.getElementById('chartdiv2')).
                draw(data, {title: "SỐ LƯỢNG TIÊU THỤ CỦA TỪNG SẢN PHẨM",legend: { position: "none" }});
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div style="display: block">
        <div id="chartdiv" style="width: 49.75%; height: 300px; display: inline-block"></div>
        <div id="chartdiv1" style="width: 49.75%; height: 300px; display: inline-block"></div>
        <div id="chartdiv2" style="width: 100%; height: 450px"></div>
    </div>
</asp:Content>

