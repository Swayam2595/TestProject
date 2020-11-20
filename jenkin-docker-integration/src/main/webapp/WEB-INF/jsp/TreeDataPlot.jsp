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
	  fill: #fff;
	  stroke: steelblue;
	  stroke-width: 3px;
	  
	}

	.node text { font: 12px sans-serif; }

	.link {
	  fill: none;
	  stroke: black;
	  stroke-width: 2px;
	}
	
	

	
    </style>
</head>



<!-- <div id="tree1" style="overflow-y: scroll; height:400px;"></div> -->
<body style="overflow-y: scroll; height:100%;overflow-x: scroll; width:500px;">
<div id="myimage" ></div>

<!-- ---------------------------------------------------------------------------------- -->





<div class="modal fade" id="addModal" role="dialog">

    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
       <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <form action="" method="post"> 
        <div class="modal-body">
         <div class="row">
                       <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addModal" onclick="addfunction()">Add</button>
		 </div>
	               
	     <br>
		 								  
	     <div class="row">
					  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addModal" onClick="removeElement()">Remove</button>
					  <input type="hidden" class="form-control" id="mainid" >
		 </div>
		 
		 <br>		 
				   
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onClick="closeElement()">Close</button>
        </div>
        
       </form>
     
      </div>
      
    </div>
</div>



<!------------------------------------------------------------------------------------------>

<div class="modal fade" id="myModal" role="dialog">

    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
       <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <form action="" method="post"> 
        <div class="modal-body">
         <div class="row">
                       <label for="name" class="col-md-2 col-sm-2"><strong> Place </strong></label>
                             <div class="col-sm-4 col-md-4">
                                <input type="text" class="form-control" id="name1" placeholder="Enter Values" name="name">
                             </div>
				   </div>
	               <br>
											  
			      <div class="row">
					   <label for="parentname" class="col-sm-2 col-md-2"> <strong> Belongs </strong></label>
                             <div class="col-sm-4 col-md-4">
                                   <input type="text" class="form-control" id="parentname1" placeholder="Enter Values" name="parentname" readonly>
                             </div>
		           </div>
		           <br>
		           
		          <div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-default" onclick="myfunction()" >Submit</button>
				  </div>
				</div> 
				   
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onClick="closeElement()">Close</button>
        </div>
       </form>
       
      
       
      </div>
      
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.min.js"></script>
	<script src="bootstrap/js/1.11.2.jquery.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
 
 <script>
 function addfunction(){
		$("#myModal").modal("show");
		  console.log("welcome");  
 }
 </script>
 
 
 <script>
 function closeElement(){
	      location.reload(true);
		  console.log("refreshing");  
 }
 </script>
 
 
 <script>

 function removeElement() {
	 
	 var id=$('#mainid').val();
	 console.log("processing"+id);
 
	 var formdata={id:id};
	 
	 console.log("deleting");
	    
		$.ajax({
	  		type : "Post",
	          url: "branchdelete.html",
	          data:formdata ,
	           
	          
	            success: function(result) {		            	          	
	          	console.log("entering to contoller");
	          	location.reload();
	          }
	      });  
	}
 
 </script>
 
	
	
	<script>
	console.log("${listofdatas}".length)
	 if ("${listofdatas}".length == 2){
		 console.log("dwcdw");
		 $("#myModal").modal("show");
	  		} 
	</script>
	
		
	<script>
	
	function myfunction(){
	    var plname=$('#name1').val();
		var belongsto=$('#parentname1').val();
        //var image=$('#image1').val();
		console.log(plname +" "+ belongsto+" ");
  	    var formdata={plname:plname,belongsto:belongsto,belongsto:belongsto};
  	   
  	  
 	  
  	$.ajax({
  	    url: "./jsondatafordynamictree",
  	    type: "post",
  	    data:formdata,
  	      success: function(result) {
  	  	  var res = JSON.parse(result);
  	  	  $("#myModal").modal('hide');
  	  	  location.reload(true);
  	  
  	console.log(result+" res");
  	

    }
  });
	}
	
	
	
	
	
	$("#myModal").ready(function () { 
        $("button").click(function () { 
             //location.reload(true); 
            //alert('Reloading Page'); 
        }); 
        
    }); 
	
	
 </script>
 
 <script>
 function addmodal() {
	  var x = document.getElementById("myModal");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
 
 </script>
 

 

<script type="text/javascript">
var formdata={plname:"",belongsto:""}
$.ajax({
	    url: "../jsondatafordynamictree",
	    type: "post",
	    data:formdata,
	      success: function(result) {
	  	  var res = JSON.parse(result);
	console.log(result+" res");

	var data =res;
	// *********** Convert flat data into a nice tree ***************
	// create a name: node map
	
	var dataMap = data.reduce(function(map, node) {
		map[node.name] = node;
		return map;
		
		/*if (listofdatas == null){
			 $("#myModal").modal("show");
		}*/
		
	}, {});

	// create the tree array
	var treeData = [];
	data.forEach(function(node) {
		// add to parent
		var parent = dataMap[node.parentname];
		

		
	    if (parent) {
			// create child array if it doesn't exist
			(parent.children || (parent.children = []) )
				// add node to child array
				.push(node); 
		}  		  		
		else {
			// parent is null or missing
			treeData.push(node);
			console.log(treeData); 			
		}
	});

	var margin = {top: 20, right: 120, bottom: 20, left: 120},
		width = 960 - margin.right - margin.left,
		height = 500 - margin.top - margin.bottom;
	
	var width = Math.max(document.documentElement.clientWidth, window.innerWidth*Math.pow(960,5) || 0);
	

	var i = 0,
		duration = 0,
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
	    //  console.log("sbcdef");	
	       
	 
	      

	  nodeEnter.append("circle")
		  .attr("r", 1e-6)
		  .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });
	 	 

	  nodeEnter.append("text")
		  .attr("x", function(d) { return d.children || d._children ? -25 : 25; })
		  .attr("dy", ".50em")
		  .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
		  .text(function(d) { return d.name; })///
		  .style("fill-opacity", 1e-6);

	  // Transition nodes to their new position.
	  var nodeUpdate = node.transition()
		  .duration(duration)
		  .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });
	     

	  nodeUpdate.select("circle")
		  .attr("r", 10)		  
		  .style("fill", function(d) { return d._children ? "lightsteelblue" : "white"; });
	           
	  
	
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
		
		  if (d._children) {
				d._children = d.children;
				d.children = null;
			  }
               else {
				d.children = d._children;
				d._children = null;
			  }
		
  update(d); 	 
  console.log("Node Clicked"+d.name);
	
  $("#addModal").modal("show");
  
  console.log("clicked");  
  
  $('#parentname1').val(d.name);
  
  $('#mainid').val(d.id);
  console.log(d.id);
  
//  $("#parentname").

	}
	
	

}
});



</script>





 




</body>
</html>