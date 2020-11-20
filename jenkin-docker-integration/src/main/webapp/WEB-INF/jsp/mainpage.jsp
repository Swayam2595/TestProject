<!-- Bootstrap -->
    <link href="bootstrap/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
    <link href="bootstrap/css/hoe.css" rel="stylesheet">

    <link href="bootstrap/css/datepicker.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>  

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" >
    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">    
       <header id="hoe-header" hoe-lpanel-effect="shrink">
            <div class="hoe-left-header">
               <a href="#" class="clearfix">   <p> SWAYAM </p> </a>                           
                <span class="hoe-sidebar-toggle" ><a href="#" ></a></span>
            </div>
            
				  <div class="hoe-right-header" hoe-position-type="relative" >
                	<span class="hoe-sidebar-toggle"><a href="#" id="sb"></a></span>
                	<ul class="left-navbar">										
					  <li>
						<form method="post" class="hoe-searchbar">
							<input type="text" placeholder="Search..." name="keyword" class="form-control">
							<span class="search-icon"><i class="fa fa-search"></i></span>
						</form>
					  </li>					
				    </ul> 
				
                <ul class="right-navbar">
					<li class="dropdown hoe-rheader-submenu hoe-header-profile">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							
                            <span>Drop Down</b> <i class=" fa fa-angle-down"></i></span>
						</a> 
						<ul class="dropdown-menu ">
							<li><a href="#"><i class="fa fa-user"></i>My Profile</a></li>
							<li><a href="#"><span id="datetimepicker1"> <i class="fa fa-calendar"> </i>My Calendar</span></a></li>
							<li>
							
							</li>
		                    <li><a class="nav-link" href="/"><i class="fa fa-power-off"></i>Logout</a></li>
						</ul>
					</li>					 
				</ul>
				
            </div>
        </header>
     
                <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
            <aside id="hoe-left-panel" hoe-position-type="absolute">
                
               
                <ul  class="nav panel-list" id="nav" >                
                    <li class="nav-level"> <p style="text-align:center;"><font size="4" color="white"><strong>EMPLOYEE</strong></font></p></li>
                    
                    <li id="dashboard" >                                         
                            <i class="fa fa-tachometer"></i>                                                   
                            <span class="menu-text">Dashboard</span>                                                                                                    

                    </li>  
               
                    <li id="employees" >                  
                         <a href="/dashboard.html">
                            <i class="fa fa-users"></i>
                            <span class="menu-text">Employee Strength</span>                                                   
                        </a>
                    </li> 
                    
                     <li id="employees" >                  
                         <a href="/view_employees.html">
                            <i class="fa fa-users"></i>
                            <span class="menu-text">Employee Details</span>                                                   
                        </a>
                     </li>      
                    
                     <li id="employees" >                  
                         <a href="/view_graph.html">
                            <i class="fa fa-users"></i>
                            <span class="menu-text">Employee Graph</span>                                                   
                        </a>
                     </li>  
                     
                      <li id="employees" >                  
                         <a href="/tree_graph.html">
                            <i class="fa fa-users"></i>
                            <span class="menu-text">School Tree Graph</span>                                                   
                        </a>
                     </li>  
                     
                     <li id ="employees">
                         <a href="/treeClickable_graph.html">
                            <i class="fa fa-users"></i>
                            <span class="menu-text">Static Tree Graph</span>
                         </a>  
                      </li> 
                   
                       
                      
                  <li  class="hoe-has-menu" >
               
                        <a href="#">
                            <i class="fa fa-cog"></i>
                            <span class="menu-text">Tree Graph</span>                            
                        </a>
                        
                        <ul class="hoe-sub-menu" id="settingMenu">                        
                        	
                        	<li id="parent">
                                <a href="./TreeDataInput.html">
                                <i class="fa fa-laptop"></i>
                                    <span class="menu-text">DynamicTreeData_Input</span>                                 
                                </a>
                            </li>   
                            
                            
                            <li id="child">
                                <a href="./ImageUpload.html">
                                <i class="fa fa-list-alt"></i>
                                    <span class="menu-text">Uploading Image</span>                                 
                                </a>
                            </li>  
                                                     
                            
                            <li id="child">
                                <a href="./TreeGraphPlot.html">
                                <i class="fa fa-list-alt"></i>
                                    <span class="menu-text">Tree Data Plot</span>                                    
                                </a>
                            </li>
                            
                            <li id="child">
                                <a href="./TreeDataView.html">
                                <i class="fa fa-list-alt"></i>
                                    <span class="menu-text">Tree Graph View</span>                                    
                                </a>
                            </li>
                        </ul>
                 </li>
                 
                      <li id="TreeData" >                  
                         <a href="TreeData">
                            <i class="fa fa-users"></i>
                            <span class="menu-text">Tree Data</span>                                                   
                        </a>
                     </li> 
                     
                       <li id="tree" >                  
                         <a href="./Tree">
                            <i class="fa fa-users"></i>
                            <span class="menu-text">Tree</span>                                                   
                        </a>
                     </li> 
                         
                   </ul>
                    
            </aside>
              <script src="bootstrap/js/1.11.2.jquery.min.js"></script>
  
          <script>
  
           $("#sb").click(function(){
        	 //  alert("clicked");
        	 if($("#logo").is(":hidden"))
        	   $("#logo").show();
        	 else
        		 {
        		 $("#logo").hide();
        		 }
           });
        			
           </script>
           
     