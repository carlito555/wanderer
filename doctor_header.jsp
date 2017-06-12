<%@include file='header_files.html' %>

<!--start-header-->
<div class="header">
	 <!--start-container-->
	 <div class="container">
				<!--start-top-header-->
					<div class="main-header">

				<div class="clearfix"> </div>
				<div class="top-header">
										<div class="logo">
						<a href="index.html"><img src="images/logo2.png" title="logo" /></a>
					</div>
					<div class="top-header-right">
										<ul class="support">
											<li><span><i class="tele-in"> </i>+ 121 04231254</span></li>
					<li><a href="mailto:info@example.com"><i> </i>info@example.com</a></li>
				</ul>
						<div class="top-header-contact-account">
							
							<div class="social">
								<ul>
                                                                    <li><a href="#"><i class="facebook"> </i></a></li>
									<li><a href="#"><i class="twitter"> </i></a></li>
									<li><a href="#"><i class="dribble"> </i></a></li>	
									<li><a href="#"><i class="linkdin"> </i></a></li>	
									<li><a href="#"><i class="google"> </i></a></li>										
								</ul>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<!--End-top-header-->
				<!--start-main-header-->
<div class="navigation">
	<div class="container">
		<nav class="navbar navbar-default">
						<div class="navbar-header">
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
			  </button>
			</div>
<%
            int did = Integer.parseInt(session.getAttribute("did").toString());
        %>
			<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
			  <ul class="nav navbar-nav">
				<li class="active"><a href="index.html">Home <span class="sr-only">(current)</span></a></li>
                                <li><a href="edit_doctor_info.jsp" >Edit Doctor's Information</a></li>
                                <li><a href="managegallery.jsp" >Manage Gallery</a></li>
                                <li>   <a href="viewdoctorbookings.jsp?Doctorid=<%= did%>" >View My Bookings</a></li>
					  </ul>
				 <div class="search">
                                <form action="search.jsp?DoctorName=+DoctorName">
                                    <input type="search" name="DoctorName" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                            this.value = 'Search';
                                                        }" required="">
                                    <input type="submit" value=" ">
                                </form>
                            </div>
			  <div class="clearfix"> </div>
			</div><!-- /.navbar-collapse -->
		</nav>
	</div>
</div>
					<div class="clearfix"> </div>
					</div>
			  <!-- script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(".top-nav ul").slideToggle("slow" , function(){
					});
				});
		 </script>
		 <!-- script-for-menu -->	 	
	 </div>
	<!----End-main-header----->
</div>
<div class="clearfix"> </div>
<!---End-header--->
