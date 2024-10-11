<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="websitelogo.png">
  <title>
    Dragonslayer Dashboard
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
</head>

<body class="">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg position-absolute top-0 z-index-3 w-100 shadow-none my-3 navbar-transparent mt-4">
    <div class="container">
      <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 text-white" href="../index.html">
       
      </a>
      
  </nav>
  <!-- End Navbar -->
  <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-0 pt-5 pb-11 m-3 border-radius-lg" >
     
    </div>
    <div class="container">
	
      <div class="row mt-lg-n10 mt-md-n11 mt-n10 justify-content-center">
        <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
          <div class="card z-index-0">
            <div class="card-header text-left pt-4">
		 <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="../index.html">
             <image src="websitelogo.png" width="100px" > Dragonslayer Dashboard
            </a>
              <hr style="color:black">
            </div>
           
            <div class="card-body">
              <form action="databaseConnect.jsp" method="get" id="signup" >
			   <div class="mb-3">
                  <input type="text" name="organizationName" id="organizationName" class="form-control" placeholder="OrganizationName (optional)" aria-label="organizationName">
                </div>
                <div class="mb-3">
                  <input type="text" name="name" id="name" class="form-control" placeholder="Name" aria-label="Name">
                </div>
                <div class="mb-3">
                  <input type="email" name="email" id="email" class="form-control" placeholder="Email" aria-label="Email">
                </div>
                <div class="mb-3">
                  <input type="password" name="password" id="password" class="form-control" placeholder="Password" aria-label="Password">
                </div>
				<div class="mb-3">
<label for="countries">Select your country:</label></br>
    <select  class="form-select form-select-sm" id="countries" name="countries">
	<option value="US" selected>United States</option>
        <option value="AF">Afghanistan</option>
        <option value="AL">Albania</option>
        <option value="DZ">Algeria</option>
        <option value="AS">American Samoa</option>
        <option value="AD">Andorra</option>
        <option value="AO">Angola</option>
        <option value="AI">Anguilla</option>
        <option value="AQ">Antarctica</option>
        <option value="AR">Argentina</option>
        <option value="AM">Armenia</option>
        <option value="AU">Australia</option>
        <option value="AT">Austria</option>
        <option value="AZ">Azerbaijan</option>
        <!-- Add more countries as needed -->
    </select>                </div>
				<div class="form-check form-check-info text-start">
                  <input class="form-check-input" type="checkbox" value="" id="buyer" name="buyer" checked >
                  <label class="form-check-label" for="flexCheckDefault">
                   <a href="javascript:;" class="text-dark font-weight-bolder">Buyer</a>
                  </label>
                </div>
				<div class="form-check form-check-info text-start">
                  <input class="form-check-input" type="checkbox" value="" id="seller" name="seller" >
                  <label class="form-check-label" for="flexCheckDefault">
                   <a href="javascript:;" class="text-dark font-weight-bolder">Seller</a>
                  </label>
                </div>
				<div class="form-check form-check-info text-start">
                  <input class="form-check-input" type="checkbox" value="" id="individual" name="individual" >
                  <label class="form-check-label" for="flexCheckDefault">
                    I am an <a href="javascript:;" class="text-dark font-weight-bolder">Individual</a>
                  </label>
                </div>
				<div class="form-check form-check-info text-start">
                  <input class="form-check-input" type="checkbox" value="" id="organization" name="organization" >
                  <label class="form-check-label" for="flexCheckDefault">
                    I am an <a href="javascript:;" class="text-dark font-weight-bolder">Organization</a>
                  </label>
                </div>
                <!--<div class="form-check form-check-info text-start">
                  <input class="form-check-input" type="checkbox" value="" id="terms" name="terms" >
                  <label class="form-check-label" for="flexCheckDefault">
                    I agree the <a href="javascript:;" class="text-dark font-weight-bolder">Terms and Conditions</a>
                  </label>
                </div>-->
                <div class="text-center">
                  <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2" >Sign up</button>
                </div>
                <p class="text-sm mt-3 mb-0">Already have an account? <a href="sign-in.html" class="text-dark font-weight-bolder">Sign in</a></p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <!-- -------- START FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
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
  </footer>
  <!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
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
  <script src="../assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

 
</html>