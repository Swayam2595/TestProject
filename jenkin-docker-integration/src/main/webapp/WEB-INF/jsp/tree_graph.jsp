<!DOCTYPE html>
<html>
    <head>
    <h1>School Mark Record</h1>
        <script src="https://d3js.org/d3.v3.min.js"></script>
        <script src="bootstrap/js/tree.js"></script>     
        <style>
            *{
    font-family: "Trebuchet MS", Helvetica, sans-serif;
            }
            .link {
                fill: none;
                stroke: #ccc;
                stroke-width: 1.5px;
            }
            .link.warning{
                stroke: orange;
            }            
        </style>
    </head>
    <body>
        <div id="depencency-chart"></div>
        <script type="text/javascript">
            window.onload = function() {
            initDependencyChart();
            };
        </script>
    </body>
</html>