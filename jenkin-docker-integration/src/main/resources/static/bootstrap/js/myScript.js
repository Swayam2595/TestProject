
 
 var svg= d3.select("#svg");
 
 var padding={top:20, right:30, bottom:30, left:50};
 
 var colors=['#64bbe3','#64bbe3','#64bbe3','#64bbe3','#64bbe3','#64bbe3','#64bbe3','#64bbe3','#64bbe3','#64bbe3','#64bbe3'];
 
 var chartArea=
 {
	 "width":parseInt(svg.style("width"))-padding.left-padding.right,
     "height":parseInt(svg.style("height"))-padding.top-padding.bottom
 };
 
 var yScale = d3.scaleLinear()
     .domain([0,d3.max(data,function(d,i) {return d.Employee})])
	 .range([chartArea.height,0]).nice();
	 
var xScale = d3.scaleBand()
     .domain(data.map(function(d){return d.Year}))
     .range([0,chartArea.width])
	 .padding(.2);
	 
// x- Axis

var xAxis=svg.append("g")
     .classed("xAxis",true)
	 .attr('transform','translate('+padding.left+','+(chartArea.height+padding.top)+')')
	 .call(d3.axisBottom(xScale));
	 
// y-Axis

var yAxisFn=d3.axisLeft(yScale);
var yAxis=svg.append("g")
         .classed("yAxis",true)
         .attr('transform','translate('+padding.left+','+padding.top+')');
yAxisFn(yAxis);

var grid=svg.append("g")
        .attr("class","grid")
		.attr('transform','translate('+padding.left+','+padding.top+')')
		.call(d3.axisLeft(yScale)
		      .tickSize(-(chartArea.width))
			  .tickFormat(""));
		 
		 
//bars

var rectGrp=svg.append("g").attr('transform','translate('+padding.left+','+padding.top+')');

rectGrp.selectAll("rect").data(data).enter()
         .append("rect")
		 .attr("width",xScale.bandwidth())
		 .attr("height",function(d,i){
			      return chartArea.height-yScale(d.Employee);
		 })
         .attr("x",function(d,i){
                  return xScale(d.Year);
		 })
		 .attr("y",function(d,i){
                  return yScale(d.Employee);
		 })
		 .attr("fill",function (d,i){
			      return colors[i];
		 });
		 




			  
		 
		 


		 

	 
	 

