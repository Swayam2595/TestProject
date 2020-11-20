<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Employee d3js</title>
  <script src="https://d3js.org/d3.v3.min.js" charset="utf-8"></script>
  <style>
  .axis .domain {
    display: none;
  }
</style>

  <style type="text/css">
  svg {
    font: 10px sans-serif;
    shape-rendering: crispEdges;
  }

  .axis path,
  .axis line {
    fill: none;
    stroke: #000;
  }
 
  path.domain {
    stroke: none;
  }
 
  .y .tick line {
    stroke: #ddd;
  }
  </style>

</head>

<svg width="700" height="400"></svg>


<body>


<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="bootstrap/js/1.11.2.jquery.min.js"></script>
<script type="text/javascript"></script>
<script>
$.ajax({
    url: "../Ajaxemppresent.html",
    type: "post",
    
      success: function(result) {
  	  var res = JSON.parse(result);
  	  
  	var data =  res;
    

    var keys = [];
    for (key in data[0]){
      if (key != "year" && key != "id" )
        keys.push(key);
    }
   
    data.forEach(function(d){
      d.total = 0;
      keys.forEach(function(k){
        d.total += d[k];
      })
    });

    data.sort(function(a, b) {
      return b.total + a.total;
    });
  	  
  	  
  	  
  	  
      var svg = d3.select("svg"),
      margin = {top: 20, right: 160, bottom: 35, left: 50},
    
    
    width = +svg.attr("width") - margin.left - margin.right,
    height = +svg.attr("height") - margin.top - margin.bottom,
    
    
    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  var x = d3.scaleBand()
    .rangeRound([0, width-05])
    .paddingInner(0.05)
    .align(0.1);

  var y = d3.scaleLinear()
    .rangeRound([height, 0]);

  var z = d3.scaleOrdinal()
    .range(["#3efa83", "#298fc2"]);

  

  x.domain(data.map(function(d) {
    return d.year;
  }));
  
  y.domain([0, d3.max(data, function(d) {
    return d.total;
  })]).nice();
  
  
  
  z.domain(keys);
  

  g.append("g")
    .selectAll("g")
    .data(d3.stack().keys(keys)(data))
    .enter().append("g")
    .attr("fill", function(d) {
      return z(d.key);
    })
    
    .selectAll("rect")
    .data(function(d) {
      return d;
    })
    
    .enter().append("rect")
    .attr("x", function(d) {
      return x(d.data.year);//
    })
    
    .attr("y", function(d) {
      return y(d[1]-d[0]);
    })
    
    .attr("height", function(d) {
      return y(d[0]) - y(d[1]);
    })
    
    .attr("width", x.bandwidth());
  
  

  g.append("g")
    .attr("class", "axis")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x));

  g.append("g")
    .attr("class", "axis")
    .call(d3.axisLeft(y).ticks(null, "s"))
    .append("text")
    .attr("x", 2)
    .attr("y", y(y.ticks().pop()) + 0.5)
    .attr("dy", "0.32em")
    .attr("fill", "#000")
    .attr("font-weight", "bold")
    .attr("text-anchor", "start");
    
    

  var legend = g.append("g")
    .attr("font-family", "sans-serif")
    .attr("font-size", 12)
    .attr("text-anchor", "end")
    .selectAll("g")
    .data(keys.slice())
    .enter().append("g")
    .attr("transform", function(d, i) {
      return "translate(0," + i * 20 + ")";
    });

  legend.append("rect")
    .attr("x", width - 19)
    .attr("width", 19)
    .attr("height", 19)
    .attr("fill", z);

  legend.append("text")
    .attr("x", width - 24)
    .attr("y", 9.5)
    .attr("dy", "0.32em")
    .text(function(d) {
      return d;
    });
  
  
      }
});
</script>




</body>
</html>