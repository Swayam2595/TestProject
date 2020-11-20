<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dynamic Tree</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
  <style>
  
	.node circle{
	  fill:#fff;
	  stroke: steelblue;
	  stroke-width: 2px;	  
	}
	
	.node rect{	  
	  stroke: red;
	  stroke-width: 2px;
	  
	}

	.node text { font: 15px sans-serif;	
	
	}

	.link {
	  fill: none;
	  stroke: black;
	  stroke-width: 2px;
	}
	


.popover-content {
  padding: 9px 14px;
}
	
	
	
	
    </style>
 
 
</head>

<body>

<div class="container">
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">      
       
        <form action="" method="post"> 
        <div class="modal-body">         
	               <br>
	               <button type="button" class="close" data-dismiss="modal">&times;</button>
	               
			      <div class="row">
                          <div class="col-sm-4 col-md-4">                                                          
                              <input type="text" class="form-control"  id="parentname1" name="parentname" readonly>
                          </div>
		          </div>		          
		          <br>
      </div>       
      </form>      
      </div>     
    </div>
</div>
</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.min.js"></script>
	<script src="bootstrap/js/1.11.2.jquery.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
 
	<script>
	
	$.ajax({
  	    url: "../jsondatafortreeview",
  	    type: "post",
  	    
  	      success: function(result) {
  	  	  var res = JSON.parse(result);
  	console.log(result+" res");

  	var data =res;
  	// *********** Convert flat data into a nice tree ***************
  	// create a name: node map
  	var dataMap = data.reduce(function(map, node) {
  		map[node.name] = node;
  		return map;
  	}, {});

  	// create the tree array
  	var treeData = [];
  	data.forEach(function(node) {
  		// add to parent
  		var parent = dataMap[node.parentname];
  		if (parent) {
  			// create child array if it doesn't exist
  			(parent.children || (parent.children = []))
  				// add node to child array
  				.push(node);
  		} else {
  			// parent is null or missing
  			treeData.push(node);
  			console.log(treeData);
  		}
  	});

  	var margin = {top: 20, right: 120, bottom: 20, left: 120},
  		width = 960- margin.right - margin.left,
  		height = 500 - margin.top - margin.bottom;
  		
  	var width = Math.max(document.documentElement.clientWidth, window.innerWidth*Math.pow(960,5) || 0);
  	
  	var i = 0,
  		duration = 750,  		
  		root;

  	var tree = d3.layout.tree()
  		.size([height, width]);

  	var diagonal = d3.svg.diagonal()
  		.projection(function(d) { return [d.y, d.x]; });

  	var svg = d3.select("body").append("svg")
  		.attr("width", width + margin.right + margin.left)
  		.attr("height", height + margin.top + margin.bottom)
  	    .append("g")
  		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  	root = treeData[0];
  	root.x0 = height / 2;
  	root.y0 = 0;
  	  
  	update(root);

  	d3.select(self.frameElement).style("height", "500px");

  	function update(source) {

  	  // Compute the new tree layout.
  	  var nodes = tree.nodes(root).reverse(),
  		  links = tree.links(nodes);

  	  // Normalize for fixed-depth.
  	  nodes.forEach(function(d) { d.y = d.depth * 180; });
  	  
  	  

  	  // Update the nodesâ¦
      var node = svg.selectAll("g.node")
  		  .data(nodes, function(d) { return d.id || (d.id = ++i); });
  	   	  
  	 
  	  // Enter any new nodes at the parent's previous position.
  	  var nodeEnter = node.enter().append("g")
  		  .attr("class", "node")
  		  .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
  		  .on("click", click);
  	       

  	/*  nodeEnter.append("circle")
  		  .attr("r", 1e-6)
  		  .style("fill", function(d) { return d.children ? "lightsteelblue" : "#fff"; });*/
  	  
  		 nodeEnter.filter(function(d){
  	        return (!d.children && d._children !== 'data');
  	      }).append('circle')
  	        .attr('class', 'node')
  	        .attr('r', 1e-6)
  	        .style("fill", function(d) {
  	          return d.children ? "lightsteelblue" : "#fff";
  	        });
  	        
  	      nodeEnter.filter(function(d){
  	        return (d.children || d._children === 'data');
  	      }).append('rect')
  	        .attr('class', 'node')
  	        .attr('width', 20)
  	        .attr('height', 20)
  	        .attr('y', -12)
  	        .attr('x', -15)
  	        .style("fill", function(d) {
  	          return d._children ? "yellow" : "yellow";
  	        });
  	

  	  nodeEnter.append("text")
  		  .attr("x", function(d) { return d.children || d._children ? -20 : 20; })
  		  .attr("dy", ".100em")
  		  .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
  		  .text(function(d) { return d.name; })///
  		  .style("fill-opacity", 1e-6);
           
  	  // Transition nodes to their new position.
  	  var nodeUpdate = node.transition()
  		  .duration(duration)
  		  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  	  nodeUpdate.select("circle")
  		  .attr("r", 10)
  		  .style("fill", function(d) { return d.children ? "yellow" : "lightgreen"; });
  	  
 
  	  
  	  nodeUpdate.select("text")
  		  .style("fill-opacity", 1);
  	     
  	  // Transition exiting nodes to the parent's new position.
  	  var nodeExit = node.exit().transition()
  		  .duration(duration)
  		  .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
  		  .remove();

  	  nodeExit.select("circle")
  		  .attr("r", 1e-6);
  	    	 

  	  nodeExit.select("text")
  		  .style("fill-opacity", 1e-6);

  	  // Update the linksâ¦
  	  var link = svg.selectAll("path.link")
  		  .data(links, function(d) { return d.target.id; });

  	  // Enter any new links at the parent's previous position.
  	  link.enter().insert("path", "g")
  		  .attr("class", "link")
  		  .attr("d", function(d) {
  			var o = {x: source.x0, y: source.y0};
  			return diagonal({source: o, target: o});
  		  });

  	  // Transition links to their new position.
  	  link.transition()
  		  .duration(duration)
  		  .attr("d", diagonal);

  	  // Transition exiting nodes to the parent's new position.
  	  link.exit().transition()
  		  .duration(duration)
  		  .attr("d", function(d) {
  			var o = {x: source.x, y: source.y};
  			return diagonal({source: o, target: o});
  		  })
  		  .remove();

  	  // Stash the old positions for transition.
  	  nodes.forEach(function(d) {
  		d.x0 = d.x;
  		d.y0 = d.y;
  	  });
  	}
  	
 
 

  	// Toggle children on click.
 	 function click(d) {
 		
 		$(this).popover(
 		        { 		        	
 		            placement: 'auto',		
 		            container: 'body',
 		            trigger: 'manual',
 		            html : true,
 		            content: $('#parentname1').val(d.name) 		            
 		        });
 		
 		    $(this).popover('show');
 		    //d.stopPropagation();
 		    console.log("displaying"); 		     		   

 		    $(this).on('click', function (d) {
 		    	 $(this).not(this).popover('hide');
 		         console.log("hiding");
 		    }); 

 		    
 		  	// $("#myModal1").modal("show");
 		  	// $('#parentname1').val(d.name);
  	 $('#parentname1').css({"font-style": "italic", "font-weight": "bold","text-decoration": "underline"});  	 
  	 console.log("clicked");  
 	  }
  	
 	  	  }
  	  	  });
      
  	  </script>
  	  
  	
  	 
<script type="text/javascript"></script>
</body>
</html>