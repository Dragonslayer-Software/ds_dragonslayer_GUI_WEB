<%@ page import="com.mysql.jdbc.*" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement, java.io.*, java.io.File" %>
<%@ page import=" java.io.IOException, org.apache.commons.*,org.apache.commons.io.FileUtils, org.json.*,java.util.List, java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet, java.io.*, java.net.*, org.joda.time.*, java.nio.file.*, java.nio.file.attribute.BasicFileAttributes, org.joda.time.format.*, java.net.ssl.*, java.time.*, java.util.*, java.time.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, java.text.*, java.util.Date, java.time.Instant, java.net.HttpURLConnection, java.net.URL" %>
<%//@ page import="org.apache.http.client.HttpClient.*" %>
<%//@ page import="java.io.*, com.mysql.cj.jdbc.Driver" %>

<%
String buyerName = request.getParameter("buyerName");

%>
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="websitelogo.png">
  <title>
   Dragonslayer DASHBOARD
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
 <link id="pagestyle" href="assets/css/argon-dashboard.css" rel="stylesheet" />
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <link href="pages/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="pages/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="pages/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css rel="stylesheet" type="text/css" />
 <style>


table { 
 
  overflow-y:scroll;
  padding-top:20px;
  padding-bottom:20px;
  
}
.card {
      
      background-color: white;
      padding: 10px;
      border-radius: 10px;
      text-align: left;
      cursor: grab;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Card shadow */
      transition: box-shadow 0.3s ease-in-out;
    }

    .card:hover {
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4); /* Larger shadow on hover */
    }
	.h-50 {
  height: 85%;
}
  }
	.h-100 {
  height: 80%;
}
</style>
</head>

<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href=" #" target="_blank">
        <img src="websitelogo.png" class="navbar-brand-img h-100" alt="main_logo"> Dragonslayer
      
      </a>
    </div>
	
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="#">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Buyer Dashboard </span>
          </a>
        </li>
       
       
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account pages</h6>
        </li>
	
	
        <li class="nav-item">
          <a class="nav-link " href="pages/profile.jsp?buyerName=<%=buyerName%>">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Profile</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="pages/sign-in.jsp">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-copy-04 text-warning text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Sign In</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="pages/sign-up.jsp">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-collection text-info text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Sign Up</span>
          </a>
        </li>
		
      </ul>
    </div>
    
  </aside>
  
  <main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm text-white active" aria-current="page"><strong><%=buyerName%></strong></li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">Owner DASHBOARD</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
              <input type="text" class="form-control" placeholder="Type here...">
            </div>
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="pages/sign-in.jsp" class="nav-link text-white font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">Logout</span>
              </a>
            </li>
			
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                </div>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row" id="sortable">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fas fa-file" aria-hidden="true"></i> My Software</h6>
             
            </div>
			
            <div class="card-body p-3 ">
            					 <button style="float: right;" class="btn btn-primary btn-sm-0" id="refresh" onClick="#"><i class="fa fa-refresh" ></i></button>

     <div class="container mt-0">
    <table id="myDataTable" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
   <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Title</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Date purchased</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Version</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Seller</th>
                      <th class="text-secondary opacity-7"></th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td>Software One</td>
    <td>03/02/2024</td>
    <td>0.1</td>
	<td>Dragonslayer Software</td>
	<td><div class="btn btn-default btn-sm-0"><i class="fa fa-download" aria-hidden="true"></i>
</div></td>
    </tr>
	<tr>
    <td>Software Two</td>
    <td>03/02/2024</td>
    <td>0.1</td>
	<td>Dragonslayer Software</td>
	<td><div class="btn btn-default btn-sm-0"><i class="fa fa-download" aria-hidden="true"></i>
</div></td>
    </tr>
    </tbody>
    </table>
    </div>
            
            </div>
          </div>
        </div>
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fa fa-arrow-up" aria-hidden="true"></i>
 Available Upgrades</h6>
             
            </div>
            <div class="card-body p-3">
								 <button style="float: right;" class="btn btn-primary" onClick="window.location.reload();"><i class="fa fa-refresh" ></i></button>

              <div class="container mt-0">
    <table id="myDataTable2" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Title</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Date Upgraded</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Version</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Seller</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">Software One</h6>
                            <p class="text-xs text-secondary mb-0">Dragon Software</p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">04/30/2024</p>
                       
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success">0.3</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">Dragon Software</span>
                      </td>
                      <td class="align-middle">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          Edit
                        </a>
                      </td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
		</div>
		<div class="row mt-4">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fa fa-money" aria-hidden="true"></i>
 My Payment Methods</h6>
             
            </div>
            <div class="card-body p-3">
           
			 					 <button style="float: right;" class="btn btn-primary" onClick=""><i class="fa fa-plus" ></i></button>

                  <div class="container mt-0">
    <table id="myDataTable3" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Payment Method</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Email</th>
                      
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">PayPal</h6>
                            
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">lewellynmary@yahoo.com</p>
                       
                      </td>
                      
                      <td class="align-middle">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          Edit
                        </a>
                      </td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-6 col-sm-6">
           <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fa fa-users" aria-hidden="true"></i>

 New Software Sellers</h6>
             
            </div>
            <div class="card-body p-3">
								 <button style="float: right;" class="btn btn-primary" onClick="window.location.reload();"><i class="fa fa-refresh" ></i></button>

              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Seller</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Contact</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Date Uploaded</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">All Software</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">Dragon Software</h6>
                            <p class="text-xs text-secondary mb-0">Software for the future</p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">44 Chase Road, </br> Chantilly, Virginia 22019</p>
                       
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success">03/20/2024</span>
                      </td>
                      <td class="align-middle text-center">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Software Link"><span class="text-secondary text-xs font-weight-bold">All Software</span></a>
                      </td>
                      <td class="align-middle">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          Edit
                        </a>
                      </td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
	 
      <div class="row mt-4">
        <div class="col-lg-6 mb-lg-0 mb-4">
          <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fa fa-users" aria-hidden="true"></i>
 Available Sellers</h6>
             
            </div>
            <div class="card-body p-3">
             <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Company</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Contact</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Software</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Search</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">Dragon Software</h6>
                            <p class="text-xs text-secondary mb-0">Software for the future</p>
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">44 Cross Circle </br> Chantilly, VA 22019</p>
                       
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success"><i class="fa fa-link" aria-hidden="true"></i>
</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><i class="fa fa-search" aria-hidden="true"></i></span>
                      </td>
                      <td class="align-middle">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          Edit
                        </a>
                      </td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card overflow-hidden h-100 p-0">
              <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fas fa-search" aria-hidden="true"></i> Available Software</h6>
              <div class="container mt-0">
    <table id="myDataTable4" class="table table-striped table-bordered" style="width:100%;height:60%">
    <thead>
    <tr>
                      <th style="width:250px" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Title</th>
                      <th style="width:100px" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Date Purchased</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Version</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Seller</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
			
        <%
		File dir = new File("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/dragonslayer/seller/pages/uploads/");
		//File dir = new File("/opt/tomcat/apache-tomcat-9.0.8/webapps/dragonslayer/seller/pages/uploads/");

		String[] files = dir.list();

		for (int i = 0; i < files.length; i++) {

		  String thepath = dir.getPath();
		  thepath = thepath + "/";
		  thepath = thepath + files[i];

		  File f = new File(thepath);
		  long lastmod = f.lastModified();

		  java.util.Date d = new java.util.Date(lastmod);
		java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); 
            System.out.print(files[i] + " </br>");
            System.out.print(d+ " </br>");
            System.out.print(lastmod + "</br>");
			String price = "$29.00";
           %>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm"><%= files[i]%></h6>
                            <p class="text-xs text-secondary mb-0">Dragon Software</p>
                          </div>
                        </div>
                      </td>
					
                      <td>
                        <p class="text-xs font-weight-bold mb-0"><%= df.format(d) %></p>
                       
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success">0.2</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">Dragon Software</span>
                      </td>
                      <td class="align-middle">
                        <a href="https://www.paypal.com/ncp/payment/E2LFG8PFLD9WS" class="badge badge-sm bg-gradient-default" data-toggle="modal" data-target="#myModal" data-original-title="download">
                          <img src="paypal.png" width="30px"/>
                        </a>
						
                      </td>
                    </tr>
                      <%
					   }
					   // }

            // System.out.println("</uploads>");
			
        %> 
                  </tbody>
                </table>
				</div>
            </div>
              </div>  
      </div>
	  </div>
      <div class="row mt-4">
        <div class="col-lg-6">
          <div class="card">
           
            <div class="card-body p-3">
            
     <script src="https://static.elfsight.com/platform/platform.js" async></script>
<div class="elfsight-app-e5db3418-241f-4774-b7f3-b4ff77845fd5" data-elfsight-app-lazy></div>
    </div> 

            </div>
          </div>
		     <div class="col-lg-6">
          <div class="card">
           
            <div class="card-body p-3">
			 <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fas fa-search" aria-hidden="true"></i> OS</h6>
			  </div>

            </div>
          </div>
        </div>
       
        </div>
      </div>
      
    </div>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="fa fa-cog py-2"> </i>
    </a>
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Dragonslayer Config</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0 overflow-auto">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Sidebar Colors</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2" data-class="bg-default" onclick="sidebarType(this)">Dark</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="d-flex my-3">
          <h6 class="mb-0">Navbar Fixed</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
        <div class="mt-2 mb-5 d-flex">
          <h6 class="mb-0">Dark/Light</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
      
        </div>
      </div>
    </div>
  </div>
  <footer class="footer py-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mb-4 mx-auto text-center">
          
      <div class="row">
        <div class="col-8 mx-auto text-center mt-1">
          <p class="mb-0 text-secondary">
            Copyright <i class="fa fa-copyright" aria-hidden="true"></i> 2024 DragonSlayer Software, LLC
          </p>
        </div>
      </div>
    </div>

</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  </footer>

  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="assets/js/plugins/chartjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script>
  $( document ).ready(function() {
   $("#sortable").sortable();
        $("#sortable").disableSelection();
});

    var ctx1 = document.getElementById("chart-line").getContext("2d");

    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
    new Chart(ctx1, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Mobile apps",
          tension: 0.4,
          borderWidth: 0,
          pointRadius: 0,
          borderColor: "#5e72e4",
          backgroundColor: gradientStroke1,
          borderWidth: 3,
          fill: true,
          data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
          maxBarThickness: 6

        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#fbfbfb',
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#ccc',
              padding: 20,
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    });
  </script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
 <script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script> 


<!-- Start of OpenWidget (www.openwidget.com) code -->
<script>
    $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: true, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable2').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: true, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable3').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: true, // Show information
    lengthChange: false, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable4').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: true, // Show information
    lengthChange: false, // Disable the "Show X entries" dropdown
    });
    });
  window.__ow = window.__ow || {};
  window.__ow.organizationId = "69ac439d-44e8-419b-aac1-4fea9254166c";
  window.__ow.integration_name = "manual_settings";
  window.__ow.product_name = "openwidget";   
  ;(function(n,t,c){function i(n){return e._h?e._h.apply(null,n):e._q.push(n)}var e={_q:[],_h:null,_v:"2.0",on:function(){i(["on",c.call(arguments)])},once:function(){i(["once",c.call(arguments)])},off:function(){i(["off",c.call(arguments)])},get:function(){if(!e._h)throw new Error("[OpenWidget] You can't use getters before load.");return i(["get",c.call(arguments)])},call:function(){i(["call",c.call(arguments)])},init:function(){var n=t.createElement("script");n.async=!0,n.type="text/javascript",n.src="https://cdn.openwidget.com/openwidget.js",t.head.appendChild(n)}};!n.__ow.asyncInit&&e.init(),n.OpenWidget=n.OpenWidget||e}(window,document,[].slice))
</script>
<noscript>You need to <a href="https://www.openwidget.com/enable-javascript" rel="noopener nofollow">enable JavaScript</a> to use the communication tool powered by <a href="https://www.openwidget.com/" rel="noopener nofollow" target="_blank">OpenWidget</a></noscript>
<!-- End of OpenWidget code -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script
</body>

</html>
