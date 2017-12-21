<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link href="css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON STYLESHEET -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap-fileupload/bootstrap-fileupload.css"><!-- BOOTSTRAP FILEUPLOAD PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css"><!-- BOOTSTRAP WYSIHTML5 PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css"><!-- BOOTSTRAP DATEPICKER PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap-timepicker/compiled/timepicker.css"><!-- BOOTSTRAP TIMEPICKER PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css"><!-- BOOTSTRAP COLORPICKER PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker-bs3.css"><!-- DATERANGE PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="assets/bootstrap-datetimepicker/css/datetimepicker.css"><!-- DATETIMEPICKER PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="assets/jquery-multi-select/css/multi-select.css"><!-- JQUERY MULTI SELECT PLUGIN CSS -->
<link href="css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
<link href="css/style-responsive.css" rel="stylesheet"><!-- THEME BASIC RESPONSIVE  CSS -->

  </head>
  
  <body>
          <!-- START MAIN CONTENT -->
      <section id="main-content">
	  
	    <!-- START WRAPPER -->
        <section class="wrapper">
          
          <!-- START ROW -->
          <div class="row">
            <div class="col-md-12">
              <section class="panel">
                <header class="panel-heading">
                  <span class="label label-primary">
                    Date Pickers
                  </span>
                  <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down">
                    </a>
                    <a href="javascript:;" class="fa fa-times">
                    </a>
                  </span>
                </header>
                <div class="panel-body">
                  <form action="#" class="form-horizontal tasi-form">
                    <div class="form-group">
                      <label class="control-label col-md-3">
                        Default Datepicker
                      </label>
                      <div class="col-md-3 col-xs-11">
                        <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="text" value="">
                        <span class="help-block">
                          Select date
                        </span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3">
                        Start with years viewMode
                      </label>
                      <div class="col-md-3 col-xs-11">
                        <div data-date-viewmode="years" data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-append date dpYears">
                          <input type="text" readonly="" value="12-02-2012" size="16" class="form-control">
                          <span class="input-group-btn add-on">
                            <button class="btn btn-info" type="button">
                              <i class="fa fa-calendar">
                              </i>
                            </button>
                          </span>
                        </div>
                        <span class="help-block">
                          Select date
                        </span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3">
                        Months Only
                      </label>
                      <div class="col-md-3 col-xs-11">
                        <div data-date-minviewmode="months" data-date-viewmode="years" data-date-format="mm/yyyy" data-date="102/2012" class="input-append date dpMonths">
                          <input type="text" readonly="" value="02/2012" size="16" class="form-control">
                          <span class="input-group-btn add-on">
                            <button class="btn btn-info" type="button">
                              <i class="fa fa-calendar">
                              </i>
                            </button>
                          </span>
                        </div>
                        <span class="help-block">
                          Select month only
                        </span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3">
                        Date Range
                      </label>
                      <div class="col-md-4">
                        <div class="input-group input-large" data-date="13/07/2013" data-date-format="mm/dd/yyyy">
                          <input type="text" class="form-control dpd1" name="from">
                          <span class="input-group-addon">
                            To
                          </span>
                          <input type="text" class="form-control dpd2" name="to">
                        </div>
                        <span class="help-block">
                          Select date range
                        </span>
                      </div>
                    </div>
                    <a class="btn btn-primary" data-toggle="modal" href="#myModal">
                      Datepicker in Modal
                    </a>
                    
                    <div class="modal fade" id="myModal" >
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                              &times;
                            </button>
                            <h4 class="modal-title">
                              Datepicker in Modal
                            </h4>
                          </div>
                          <div class="modal-body">
                            <div class="form-group">
                              <label class="control-label col-md-3">
                                Default input Datetimepicker
                              </label>
                              <div class="col-md-4">
                                <input size="16" type="text" value="2012-06-15 14:45" readonly class="form_datetime form-control">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4">
                                Default Datepicker
                              </label>
                              <div class="col-md-6 col-xs-11">
                                <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="text" value="">
                                <span class="help-block">
                                  Select date
                                </span>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4">
                                Start with years viewMode
                              </label>
                              <div class="col-md-6 col-xs-11">
                                <div data-date-viewmode="years" data-date-format="dd-mm-yyyy" data-date="12-02-2012" class="input-append date dpYears">
                                  <input type="text" readonly="" value="12-02-2012" size="16" class="form-control">
                                  <span class="input-group-btn add-on">
                                    <button class="btn btn-info" type="button">
                                      <i class="fa fa-calendar">
                                      </i>
                                    </button>
                                    
                                  </span>
                                </div>
                                <span class="help-block">
                                  Select date
                                </span>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4">
                                Months Only
                              </label>
                              <div class="col-md-6 col-xs-11">
                                <div data-date-minviewmode="months" data-date-viewmode="years" data-date-format="mm/yyyy" data-date="102/2012" class="input-append date dpMonths">
                                  <input type="text" readonly="" value="02/2012" size="16" class="form-control">
                                  <span class="input-group-btn add-on">
                                    <button class="btn btn-info" type="button">
                                      <i class="fa fa-calendar">
                                      </i>
                                    </button>
                                  </span>
                                </div>
                                <span class="help-block">
                                  Select month only
                                </span>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-4">
                                Date Range
                              </label>
                              <div class="col-md-6">
                                <div class="input-group input-large" data-date="13/07/2013" data-date-format="mm/dd/yyyy">
                                  <input type="text" class="form-control dpd1" name="from">
                                  <span class="input-group-addon">
                                    To
                                  </span>
                                  <input type="text" class="form-control dpd2" name="to">
                                </div>
                                <span class="help-block">
                                  Select date range
                                </span>
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">
                              Close
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                  </form>
                </div>
              </section>
            </div>
          </div>
		  <!-- END ROW -->
  </body>
</html>
