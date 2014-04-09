<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Compte Rendus</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="keywords" content="python web application" />
        <meta name="description" content="pyramid web application" />

        <link rel="shortcut icon" href="${request.static_url('jmproj:static/favicon.ico')}" />
        <!-- bootstrap 3.0.2 -->
        <link href="${request.static_url('jmproj:static/css/bootstrap.min.css')}" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${request.static_url('jmproj:static/css/font-awesome.min.css')}" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${request.static_url('jmproj:static/css/ionicons.min.css')}" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="${request.static_url('jmproj:static/css/morris/morris.css')}" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="${request.static_url('jmproj:static/css/jvectormap/jquery-jvectormap-1.2.2.css')}" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <link href="${request.static_url('jmproj:static/css/fullcalendar/fullcalendar.css')}" rel="stylesheet" type="text/css" />
        <!-- Daterange picker -->
        <link href="${request.static_url('jmproj:static/css/daterangepicker/daterangepicker-bs3.css')}" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="${request.static_url('jmproj:static/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css')}" rel="stylesheet" type="text/css" />
        <!-- DATA TABLES -->
        <link href="${request.static_url('jmproj:static/css/datatables/dataTables.bootstrap.css')}" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${request.static_url('jmproj:static/css/AdminLTE.css')}" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
            <![endif]-->
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="." class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                CEA Projets
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <span class="label label-default">${len(projets)}</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">${len(projets)} projets</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        %for p in projets:
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    ${p}
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        %endfor
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">Tous les projets</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>Jane Doe <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    <p>
                                        Jane Doe - Web Developer
                                        <small>Member since Nov. 2012</small>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                <li class="user-body">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="/">
                                <i class="fa fa-dashboard"></i> <span>Accueil</span>
                            </a>
                        </li>
                        <li>
                            <a href="projets.html">
                                <i class="fa fa-th"></i> <span>Les projets</span> 
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Comptes rendus de projets
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active">Accueil</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12 col-lg-9 col-sm-8">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Les Comptes Rendus</h3>                                    
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive"><form id="table-form">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr><th>Projet <select name="projet">
                                                            <option value="">-- tous --</option>
                                                            %for proj in projets:
                                                            <option value="${proj}"
                                                                    %if projet == proj:
                                                                    selected="selected"
                                                                    %endif
                                                                    >${proj}</option>
                                                            %endfor
                                                    </select></th><th>Date</th><th>Compte Rendu <input type="text" name="cr_prefix" value="${cr_prefix}"/></th></tr>
                                            </thead>
                                            <tbody>
                                                %for cr in comptes_rendus:
                                                <tr><td>${cr.projet}</td><td>${"{0:%d/%m/%Y}".format(cr.date_ecriture.date())}</td><td>${cr.compte_rendu}</td></tr>
                                                %endfor
                                            </tbody>
                                    </table></form>
                                </div>
                            </div>
                        </div>
                    <div class="col-xs-12 col-lg-3 col-sm-4">
                        <div class="box box-success">
                            <div class="box-header">
                                <h3 class="box-title">Ajouter Compte Rendu</h3>
                                
                            </div>
                            <div class="box-body">
                            <form role="form" id="new-form" action="add" method="post">
                                <div class="form-group">
                                    <label>Projet:</label>
                                    <input class="form-control" type="text" name="projet" value="${projet}" />
                                </div>
                                <div class="form-group">
                                    <label>Compte Rendu:</label>
                                    <textarea class="form-control" name="compte_rendu"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Ajouter</button>
                                
                            </form>
                            </div>
                        </div>
                    </div>
                    </div>
                </section>
            </aside>


            <!-- jQuery 2.0.2 -->
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
            <!-- jQuery UI 1.10.3 -->
            <script src="${request.static_url('jmproj:static/js/jquery-ui-1.10.3.min.js')}" type="text/javascript"></script>
            <!-- Bootstrap -->
            <script src="${request.static_url('jmproj:static/js/bootstrap.min.js')}" type="text/javascript"></script>
            <!-- Morris.js charts -->
            <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
            <script src="${request.static_url('jmproj:static/js/plugins/morris/morris.min.js')}" type="text/javascript"></script>
            <!-- Sparkline -->
            <script src="${request.static_url('jmproj:static/js/plugins/sparkline/jquery.sparkline.min.js')}" type="text/javascript"></script>
            <!-- jvectormap -->
            <script src="${request.static_url('jmproj:static/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js')}" type="text/javascript"></script>
            <script src="${request.static_url('jmproj:static/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js')}" type="text/javascript"></script>
            <!-- fullCalendar -->
            <script src="${request.static_url('jmproj:static/js/plugins/fullcalendar/fullcalendar.min.js')}" type="text/javascript"></script>
            <!-- jQuery Knob Chart -->
            <script src="${request.static_url('jmproj:static/js/plugins/jqueryKnob/jquery.knob.js')}" type="text/javascript"></script>
            <!-- daterangepicker -->
            <script src="${request.static_url('jmproj:static/js/plugins/daterangepicker/daterangepicker.js')}" type="text/javascript"></script>
            <!-- Bootstrap WYSIHTML5 -->
            <script src="${request.static_url('jmproj:static/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js')}" type="text/javascript"></script>
            <!-- iCheck -->
            <script src="${request.static_url('jmproj:static/js/plugins/iCheck/icheck.min.js')}" type="text/javascript"></script>

            <!-- DATA TABLES SCRIPT -->
            <script src="${request.static_url('jmproj:static/js/plugins/datatables/jquery.dataTables.js')}" type="text/javascript"></script>
            <script src="${request.static_url('jmproj:static/js/plugins/datatables/dataTables.bootstrap.js')}" type="text/javascript"></script>

            <!-- AdminLTE App -->
            <script src="${request.static_url('jmproj:static/js/AdminLTE/app.js')}" type="text/javascript"></script>

            <script type="text/javascript">
                $(document).ready(function() {
                $("#search-form").find("input,select").change(function() {
                $("#search-form").submit();
                });
                $("table.table").dataTable({
                "bPaginate": true,
                "bLengthChange": false,
                "bFilter": false,
                "bSort": true,
                "bInfo": true,
                "bAutoWidth": true
                }).find("th input,th select").click(function(ev,ui) { ev.preventDefault(); return false;}).change(function() {
                $("#table-form").submit();
                });

                });
            </script>
    </body>
</html>
