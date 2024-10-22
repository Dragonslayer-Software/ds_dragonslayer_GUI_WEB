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
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 4444; /* Sit on top */
  left: 20px;
  top: 100px;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width:600px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
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
            <span class="nav-link-text ms-1">Seller Dashboard </span>
          </a>
        </li>
       
       
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account pages</h6>
        </li>
	
	
        <li class="nav-item">
          <a class="nav-link " href="../buyer/pages/profile.jsp?buyerName=<%=buyerName%>">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Profile</span>
          </a>
        </li>
		 <li class="nav-item">
          <a class="nav-link " href="#">
		  <i style="margin-left:10px;color:black" class="fa fa-wrench" aria-hidden="true"></i>
           
            <span class="nav-link-text ms-1">Support</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="../buyer/pages/sign-in.jsp">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-copy-04 text-warning text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Logout</span>
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
          <div id='sb-search-input-example' >
	<div class="sb-content sb-hero">
		<div class="sb-search sb-hero">
			<div class="sb-input">
				<input class="sb-search-field" style="float: right;" name="pesquisa" placeholder="Type your search..." type="search"
				       autocomplete="off" id="myCustomTextInputID">
				<div class="sb-search-icon" id="myCustomSearchButtonID">
					<i class="sb-icon">&#xe80a;</i>
				</div>
			</div>
		</div>
	</div>
	<style>
        @font-face {
            font-family: font-sb;
            src: url(https://api.searchbar.org/fonts/sb.eot?39450784);
            src: url(https://api.searchbar.org/fonts/sb.eot?39450784#iefix) format('embedded-opentype'), url(https://api.searchbar.org/fonts/sb.woff?39450784) format('woff'), url(https://api.searchbar.org/fonts/?39450784) format('truetype'), url(https://api.searchbar.org/fonts/sb.svg?39450784#font-sb) format('svg');
            font-weight: 400;
            font-style: normal
        }

        #sb-search-input-example {
            position: static;
            top: 0;
            width: 100%;
            height: 90px;
            place-content: center;
            display: flex;
        }

        #sb-search-input-example a, #sb-search-input-example button, #sb-search-input-example div, #sb-search-input-example em, #sb-search-input-example h1, #sb-search-input-example h2, #sb-search-input-example h3, #sb-search-input-example h4, #sb-search-input-example h5, #sb-search-input-example input, #sb-search-input-example p, #sb-search-input-example span {
            all: initial;
            font-family: Roboto, Helvetica, Arial;
            font-size: 0px;
        }

        #sb-search-input-example div, #sb-search-input-example h1, #sb-search-input-example h2, #sb-search-input-example h3, #sb-search-input-example h4, #sb-search-input-example h5, #sb-search-input-example p {
            display: block
        }

        #sb-search-input-example div, #sb-search-input-example em, #sb-search-input-example h1, #sb-search-input-example h2, #sb-search-input-example h3, #sb-search-input-example h4, #sb-search-input-example h5, #sb-search-input-example p, #sb-search-input-example span {
            font-size: inherit;
            font-weight: inherit;
            text-transform: inherit;
            color: inherit
        }

        #sb-search-input-example a, #sb-search-input-example a * {
            cursor: pointer;
            user-select: none
        }

        #sb-search-input-example * {
            box-sizing: border-box
        }


        #sb-search-input-example .sb-content {
            background: rgba(238, 238, 238, .82);
            backdrop-filter: blur(30px);
            -webkit-backdrop-filter: blur(30px);
            border-radius: 46px;
            display: block;
            text-align: left;
            width: 100%;
            top: calc(120px - 92px);
            margin-bottom: 0;
            overflow: hidden;
            z-index: 1000
        }

        #sb-search-input-example .sb-content.sb-hero {
            top: 0px;
            max-width: 660px;
            height: auto;
            z-index: 800;
            background-color: rgba(202, 202, 202, 0.2);
            -webkit-backdrop-filter: blur(30px);
            backdrop-filter: blur(30px)
        }

        #sb-search-input-example .sb-search {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(30px);
            -webkit-backdrop-filter: blur(30px);
            border-radius: 116px;
            border: 0 none;
            height: 58px;
            width: auto;
            margin: 16px;
            display: flex;
            z-index: 999;
            position: relative;
        }

        #sb-search-input-example .sb-search.sb-hero {
            padding: 0 0 0 16px;
            background-color: white;
        }

        #sb-search-input-example .sb-input {
            align-items: center;
            display: flex;
            height: 100%;
            width: 100%;
            border-radius: 100%;
            padding: 0 0 0 8px
        }

        #sb-search-input-example input {
            outline: 0;
            color: #007cff;
            background-color: rgba(0, 0, 0, 0);
            -webkit-appearance: none
        }

        #sb-search-input-example ::placeholder {
            color: #8a8a8a;
            opacity: 1

        }

        #sb-search-input-example input[type=search]::-ms-clear {
            display: none;
            width: 0;
            height: 0
        }

        #sb-search-input-example input[type=search]::-ms-reveal {
            display: none;
            width: 0;
            height: 0
        }

        #sb-search-input-example input[type=search]::-webkit-search-cancel-button, #sb-search-input-example input[type=search]::-webkit-search-decoration, #sb-search-input-example input[type=search]::-webkit-search-results-button, #sb-search-input-example input[type=search]::-webkit-search-results-decoration {
            display: none
        }

        #sb-search-input-example .sb-search-field {
            border: 0 none;
            height: 100%;
            width: 100%;
            font-size: 18px;
            display: block
        }

        #sb-search-input-example .sb-icon {
            font: normal normal 400 26px font-sb;
            line-height: 26px;
            align-items: center;
            padding: 10px;
            speak: none;
            display: inline-block;
            text-decoration: inherit;
            text-align: center;
            text-transform: none;
            cursor: pointer;
            margin: 0;
        }

        #sb-search-input-example .sb-search-icon {
            box-sizing: border-box;
            border: 0px;
            margin-right: 7px;
            align-items: center;
            border-radius: 50%;
            background: #007cff;
            color: #fff;
            cursor: pointer;
            display: flex;
        }

        @media (prefers-color-scheme: dark) {

            #sb-search-input-example .sb-search.sb-hero {
                background-color: rgba(0, 0, 0, 0.7);
            }

            #sb-search-input-example .sb-content {
                background: rgba(20, 20, 20, .8);
            }


            #sb-search-input-example .sb-search {
                background: rgba(0, 0, 0, 0.7);
            }

            #sb-search-input-example .sb-icon {
                color: #fff;
            }

            #sb-search-input-example input {
                outline: 0;
                color: #5eb2fe;
                -webkit-appearance: none;
            }

            #sb-search-input-example ::placeholder {
                color: #b5b5b5;
                opacity: 1;
            }

        }
	</style>
</div>
          
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row" id="sortable">
	  <div class="col-lg-6" >
          <div class="card overflow-hidden h-100 p-0">
              <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fas fa-search" aria-hidden="true"></i> My Uploaded Software</h6>
              <div class="container mt-0">
   <div class="container mt-0">
   <div class="btn btn-default btn-sm-0 float-right" style="float: right;" data-toggle="modal" data-software-name="softwareOne" id="downloadBtn"><i class="fa fa-upload" aria-hidden="true"></i>
</div>
    <table id="myDataTable6" class="table table-striped table-bordered" style="width:100%;">
    <thead>
    <tr>
                      <th style="width:400px" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Title</th>
                      <th style="width:200px" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Price</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Version</th>
                    <th style="width:20px" class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
                      
                    </tr>
                  </thead>
                  <tbody>
			  <div class="row">
        
       
    </div>
        <%
		
		// File myObj = new File("filename.txt"); 
    // if (myObj.delete()) { 
      // System.out.println("Deleted the file: " + myObj.getName());
    // } else {
      // System.out.println("Failed to delete the file.");
    // } 
		File dir = new File("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/dragonslayer/seller/pages/uploads/");
		//File dir = new File("/opt/tomcat/apache-tomcat-9.0.8/webapps/dragonslayer/seller/pages/uploads/");
       int i = 0;
		String[] files = dir.list();

		for (i = 0; i < files.length; i++) {

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
                            <h6 class="mb-0 text-sm"><%=files[i]%></h6>
                            <p class="text-xs text-secondary mb-0">Dragon Software</p>
                          </div>
                        </div>
                      </td>
					
                      <td>
                        <p class="text-xs font-weight-bold mb-0">$29.99</p>
                       
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success">0.2</span>
                      </td>
                     <td class="align-middle">
					 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-price="$29.99" data-version="0.2" data-software="<%=files[i]%>" id="editBtn<%=i%>"><i class="fa fa-edit" aria-hidden="true"></i></button>
                        <a href="action.jsp?file=<%=files[i]%>" onclick="return confirm('Are you sure you want to delete this item?');"> <button type="button" class="btn btn-default"  value="<%=files[i]%>" id="deletefile<%=i%>"><i class="fas fa-trash-alt"></i></button></a>
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
	  
     <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fa fa-money" aria-hidden="true"></i>
 My Total Sales</h6>
             
            </div>
            <div class="card-body p-3">
           

                  <div class="container mt-0">
    <table id="myDataTable3" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Software Name</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Amount Purchased</th>
                      
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Buyer</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">SoftwareOne</h6>
                            
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">54 units</p>
                       
                      </td>
                      
                      <td class="align-middle">
					 <button type="button" style="margin-left:40px"class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#pendingModal" data-price="$29.99" data-version="0.2" data-software="" id="pendingBtn"><i class="fa fa-user" aria-hidden="true"></i></button>
                        
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
        
        <div class="col-xl-12 col-sm-12">
           <div class="card z-index-2 h-100">
            <div class="card-header pb-0 pt-3 bg-transparent">
              <h6 class="text-capitalize"><i class="fa fa-users" aria-hidden="true"></i>

 My Buyers</h6>
             
            </div>
            <div class="card-body p-3">
                     			 					 <button style="float: right;" class="btn btn-primary" id="addBuyerBtn"><i class="fa fa-plus" ></i></button>

              <div class="container mt-0">
    <table id="myDataTable4" class="table table-striped table-bordered responsive" style="width:100%">
    <thead>
    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">First Name</th>
					  <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Last Name</th>
					  <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Email Address</th>
                      
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Edit Buyer</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm" id="firstName" >Herman</h6>
                            <p class="text-xs text-secondary mb-0">Buyer</p>
                          </div>
                        </div>
                      </td>
					   <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm" id="lastName" >Hess</h6>
                           
                          </div>
                        </div>
                      </td>
					   <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm" id="email" >herman@gmail.com</h6>
                          
                          </div>
                        </div>
                      </td>
                      
                      <td class="align-middle">
					 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editBuyerModal" data-email="herman@gmail" data-firstName="Herman" data-lastName="Hess" id="editBuyerBtn"><i class="fa fa-edit" aria-hidden="true"></i></button>

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
	  
        <div class="col-lg-12">
          <div class="card">
           
            <div class="card-body p-3">
            
<div class="container py-5">
    <div class="row mb-4">
        <div class="col-lg-12 text-center">
            <h2 class="display-6">Dragonslayer Blog</h2>
            <p class="lead text-muted">Welcome to the Dragonslayer Dashboard Blog.</p>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100">
                <img src="../buyer/pages/ai1.webp" class="card-img-top" alt="image">
                <div class="card-body">
                    <h5 class="card-title">AI Revolution</h5>
                    <p class="card-text">Artificial intelligence (AI) is an exciting area of technology that has the potential to change how industries operate and consumers live their lives, and in the years ahead, it may present many ways to profit.

The WisdomTree Artificial Intelligence and Innovation Fund:

    Seeks to offer precise access to the AI megatrend through direct investment in publicly listed firms all over the globe that are focused on capitalizing on AI in a diverse array of technologies and applications 
    Leverages a comprehensive approach that blends quantitative and qualitative research, seeking exposure to opportunities in the development and deployment of AI
.</p>
                </div>
                <div class="card-footer d-flex justify-content-between align-items-center">
                    <small class="text-muted"></small>
                    <small class="text-muted"></small>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="../buyer/pages/AI2.avif" width="150px" height="258px" class="card-img-top" alt="image">
                <div class="card-body">
                    <h5 class="card-title">Apollo Connectors</h5>
                    <p class="card-text">To enable companies to more easily incrementally adopt GraphQL without needing to overhaul their existing systems, Apollo GraphQL has announced a public preview of Apollo Connectors, which enables developers to turn a REST API into a GraphQL endpoint. 

According to the company, this helps to bridge the gap between REST architectures and GraphQL deployments, which leads to a more unified API strategy. 

Apollo Connectors offers a declarative method for connecting endpoints to simplify the process of mapping types and fields to series. They also reduce technical debt by reducing complexity in GraphQL server development and maintenance..</p>
                </div>
                <div class="card-footer d-flex justify-content-between align-items-center">
                    <small class="text-muted"></small>
                    <small class="text-muted"></small>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="../buyer/pages/linux.jpg"  height="258px" class="card-img-top" alt="image">
                <div class="card-body">
                    <h5 class="card-title">Linux Foundation Decentralized Trust aims for web3 innovation</h5>
                    <p class="card-text">TThe Linux Foundation Decentralized Trust aims to foster collaboration and innovation across the web3 ecosystem of blockchain, ledger, identity, interoperability, and cryptographic technologies.

With over 100 founding members, LF Decentralized Trust claims to be a neutral platform for the collaborative development of technologies powering the transition to a digital-first economy.</p>
                </div>
                <div class="card-footer d-flex justify-content-between align-items-center">
                    <small class="text-muted"></small>
                    <small class="text-muted"></small>
                </div>
            </div>
			
			
        </div>

    </div>
   
</div>

<footer class="footer py-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 mb-4 mx-auto text-center">
          
      <div class="row">
        <div class="col-12 mx-auto text-center mt-1">
          <p class="mb-0 text-primary">
            <strong>Copyright <i class="fa fa-copyright" aria-hidden="true"></i> 2024 <a href="https://dragonslayersoftware.my.canva.site/">DragonSlayer Software, LLC</a></strong>
          </p>
        </div>
      </div>
    </div>
</div>
</div>
</footer>
    </div> 

            </div>
          </div>
		  
        </div>
      </div>
      
    </div>
  </main>
 
  </div>
  
<div class="modal fade" id="downloadModal" role="dialog">
            <div class="modal-dialog modal-sm horizonal-align-center">
              <div class="modal-content">
                <div class="modal-header">
                
                  <h4 class="modal-title"> <image src="websitelogo.png" width="100px" > Upload Software</h4>
                </div>
                <div class="modal-body">
				<form action="#">
            <div class="card-body">
			
              <p class="text-uppercase text-sm"><strong>Software Information</strong></p>
              <div class="row">
              
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Software Name</label>
                    <input class="form-control" type="text" id="softwareName" name="softwareName" placeholder="Software Name" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Version</label>
                    <input class="form-control" type="text" id="version" name="version" placeholder="Software Version"value="">
                  </div>
                </div>
                 <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Price</label>
                    <input class="form-control" type="text" id="price" name="price" placeholder="Software Price"value="$">
                  </div>
                </div>
              </div>
              <hr class="horizontal dark">
            
              </div>
           
                    <strong> Upload file:</strong> <iframe src="pages/uploadFiles.jsp" width="100%" ></iframe>
					 
					  <div class="row">
                <div class="col-md-12">
                <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
                </div>
              </div>
            </div>
			</form>
                </div>
            
              </div>
            </div>
        </div>
		<div class="modal fade" id="editBuyerModal" role="dialog">
            <div class="modal-dialog modal-sm horizonal-align-center">
              <div class="modal-content">
                <div class="modal-header">
                
                  <h4 class="modal-title">Edit Buyer</h4>
                </div>
                <div class="modal-body">
                    <form action="#">
            <div class="card-body">
              <p class="text-uppercase text-sm">User Information</p>
              <div class="row">
              
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Paypal Email address</label>
                    <input class="form-control" type="email" id="email" name="email" placeholder="Email Address" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">First name</label>
                    <input class="form-control" type="text" id="firstName" name="firstName" placeholder="First Name"value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Last name</label>
                    <input class="form-control" type="text" id="lastName" name="lastName" placeholder="Last Name" value="">
                  </div>
                </div>
				 <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Mobile Phone</label>
                    <input class="form-control" type="tel" id="mobile" name="mobile" placeholder="Mobile Number" value="">
                  </div>
                </div>
              </div>
              <hr class="horizontal dark">
              <p class="text-uppercase text-sm">Contact Information</p>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Address</label>
                    <input class="form-control" type="text" id="address" name="address" placeholder="Street Address" value="">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">City</label>
                    <input class="form-control" type="text" id="city" name="city" placeholder="City" value="">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">State</label>
                    <input class="form-control" type="text" id="state" name="state"  placeholder="WV" value="">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Postal code</label>
                    <input class="form-control" type="text" id="zip" name="zip" placeholder="Postal Code" value="">
                  </div>
                </div>
				 <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Country</label>
                    <input class="form-control" type="text" id="country" name="country"  value="United States">
                  </div>
                </div>
              </div>
           
			  <div class="row">
                <div class="col-md-12">
                <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
                </div>
              </div>
            </div>
			</form>
                </div>
            
              </div>
            </div>
        </div>
		<div class="modal fade" id="editModal" role="dialog">
            <div class="modal-dialog modal-sm horizonal-align-center">
              <div class="modal-content">
                <div class="modal-header">
                
                  <h4 class="modal-title"> <image src="websitelogo.png" width="100px" > Edit/Delete</h4>
                </div>
                <div class="modal-body">
				<form action="#">
            <div class="card-body">
			
              <p class="text-uppercase text-sm"><strong>Software Information</strong></p>
              <div class="row">
              
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Software Name</label>
                    <input class="form-control" type="text" id="software" name="software" placeholder="Software Name" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Version</label>
                    <input class="form-control" type="text" id="version" name="version" placeholder="Software Version"value="">
                  </div>
                </div>
                 <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Price</label>
                    <input class="form-control" type="text" id="price" name="price" placeholder="Software Price"value="$">
                  </div>
                </div>
              </div>
              <hr class="horizontal dark">
            
              </div>
        
					  <div class="row">
                <div class="col-md-12">
                <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
         <button type="button" class="btn btn-primary">Save changes</button>
      </div>
                </div>
              </div>
            </div>
			</form>
                </div>
            
              </div>
            </div>
      
		<div class="modal fade" id="pendingModal" role="dialog">
            <div class="modal-dialog modal-sm horizonal-align-center">
              <div class="modal-content">
                <div class="modal-header">
                
                  <h4 class="modal-title"> <image src="websitelogo.png" width="100px" > List of Buyers</h4>
                </div>
                <div class="modal-body">
				<form action="#">
            <div class="card-body">
			
              <p class="text-uppercase text-sm"><strong>Buyer Information</strong></p>
              <div class="row">
              
                <div class="col-md-6">
                  <div class="form-group">
                    <ul>
					<li>
					Herman Hess
					</li>
					<li>
					John Smith
					</li>
					<li>
					Simon Andrews
					</li>
					<li>
					Patricia Moss
					</li>
					</ul>
                  </div>
                </div>
              
                
              </div>
          
              </div>
        
					  <div class="row">
                <div class="col-md-12">
                <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
                </div>
              </div>
            </div>
			</form>
                </div>
            
              </div>
            </div>
      <!-- Modal content-->
      
      <div class="modal fade" id="addBuyerModal" role="dialog">
            <div class="modal-dialog modal-sm horizonal-align-center">
              <div class="modal-content">
                <div class="modal-header">
                
                  <h4 class="modal-title">Add Buyer</h4>
                </div>
                <div class="modal-body">
                    <form action="#">
            <div class="card-body">
              <p class="text-uppercase text-sm">User Information</p>
              <div class="row">
              
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Paypal Email address</label>
                    <input class="form-control" type="email" id="email" name="email" placeholder="Email Address" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">First name</label>
                    <input class="form-control" type="text" id="firstName" name="firstName" placeholder="First Name"value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Last name</label>
                    <input class="form-control" type="text" id="lastName" name="lastName" placeholder="Last Name" value="">
                  </div>
                </div>
				 <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Mobile Phone</label>
                    <input class="form-control" type="tel" id="mobile" name="mobile" placeholder="Mobile Number" value="">
                  </div>
                </div>
              </div>
              <hr class="horizontal dark">
              <p class="text-uppercase text-sm">Contact Information</p>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Address</label>
                    <input class="form-control" type="text" id="address" name="address" placeholder="Street Address" value="">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">City</label>
                    <input class="form-control" type="text" id="city" name="city" placeholder="City" value="">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">State</label>
                    <input class="form-control" type="text" id="state" name="state"  placeholder="WV" value="">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Postal code</label>
                    <input class="form-control" type="text" id="zip" name="zip" placeholder="Postal Code" value="">
                  </div>
                </div>
				 <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Country</label>
                    <input class="form-control" type="text" id="country" name="country"  value="United States">
                  </div>
                </div>
              </div>
           
			  <div class="row">
                <div class="col-md-12">
                <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
                </div>
              </div>
            </div>
			</form>
                </div>
            
              </div>
            </div>
        </div>
    </div>
  
  </footer>
  
<script>"use strict";

!function() {
    var t = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGZkNWVmNzVkNjU3MmY4NDU0OGU0YSIsInRva2VuVHlwZSI6InB1YmxpYyIsImlhdCI6MTcyOTA5MTEzOCwiZXhwIjoxNDM0MzQ5MTEzOH0.NU-gdw_1zZa-h_04oHGgnzqR7s0UXi4yGB06b03BpcQ";
    function e() {
        var e = document.createElement("script"), a = navigator.language || navigator.userLanguage;
        e.type = "text/javascript", e.async = !0, e.src = "https://api.searchbar.org/v1/widget/" + t + "/" + a;
        var n = document.getElementsByTagName("script")[0];
        n.parentNode.insertBefore(e, n);
    }
    "complete" === document.readyState ? e() : window.attachEvent ? window.attachEvent("onload", e) : window.addEventListener("load", e, !1);
}();</script>


  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="assets/js/plugins/chartjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script>
  var i = <%=i%>;
  console.log("I: " + i);
  $('#addBuyerBtn').click(function() {
   $('#addBuyerModal').modal('show');
});
$('#downloadBtn').click(function(e) {
	var softwareName = $(e.relatedTarget).data('software-name');
   $('#downloadModal').modal('show').val( softwareName );
});

$('#downloadBtn2').click(function(e) {
	var softwareName = $(e.relatedTarget).data('software-name');
   $('#downloadModal').modal('show').val( softwareName );
});
$('#pendingBtn').click(function(e) {
	var softwareName = $(e.relatedTarget).data('software-name');
   $('#pendingModal').modal('show').val( softwareName );
});
  $( document ).ready(function() {
   $("#sortable").sortable();
        $("#sortable").disableSelection();
});


</script>
<%
for (int j = 0; j < i; j++) {
%>
<script>
var editModal = document.getElementById('editModal')
editModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var editBtn<%=j%> = event.relatedTarget;
  // Extract info from data-bs-* attributes
  var softwareName =editBtn<%=j%>.getAttribute('data-software');
  console.log("***************Software: " + softwareName);
  var price =editBtn<%=j%>.getAttribute('data-price');
  console.log("***************Price: " + price);
  var version =editBtn<%=j%>.getAttribute('data-version');
  console.log("***************Version: " + version);
  //put in text boxes
  var modalBodyInput = editModal.querySelector('.modal-body #software');
  modalBodyInput.value = softwareName;
  
  var modalBodyInput2 = editModal.querySelector('.modal-body #price');
  modalBodyInput2.value = price;
  
  var modalBodyInput3 = editModal.querySelector('.modal-body #version');
  modalBodyInput3.value = version;
})
</script>

<% } %>

<%
for (int k = 0; k < 1; k++) {
%>
<script>
var editBuyerModal = document.getElementById('editBuyerModal')
editBuyerModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var editBuyerBtn<%= k%> = event.relatedTarget;
  // Extract info from data-bs-* attributes
  var firstName =editBuyerBtn<%=k%>.getAttribute('data-firstName');
  console.log("***************firstName: " + firstName);
  var lastName =editBuyerBtn<%=k%>.getAttribute('data-lastName');
  console.log("***************lastName: " + lastName);
  var email =editBuyerBtn<%=k%>.getAttribute('data-email');
  console.log("***************email: " + email);
 
  //put in text boxes
  var modalBodyInput4 = editBuyerModal.querySelector('.modal-body #firstName');
  modalBodyInput4.value = firstName;
   var modalBodyInput5 = editBuyerModal.querySelector('.modal-body #lastName');
  modalBodyInput5.value = lastName;
  var modalBodyInput6 = editBuyerModal.querySelector('.modal-body #email');
  modalBodyInput6.value = email;

  
})
</script>
<% } %>

<script>
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
 


<!-- Start of OpenWidget (www.openwidget.com) code -->
<script>
    $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: false, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable2').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: false, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable3').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: false, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable4').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: false, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable5').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: false, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
    });
    });
	  $(document).ready(function() {
    // Initialize DataTable
    $('#myDataTable6').DataTable({
    paging: false, // Enable pagination
    searching: true, // Enable search
    ordering: true, // Enable sorting
    info: false, // Show information
    lengthChange: true, // Disable the "Show X entries" dropdown
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
