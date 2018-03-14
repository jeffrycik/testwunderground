<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.validate.js"></script>
	
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/static/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
   
    <script src="${pageContext.request.contextPath}/static/js/sb-admin-2.js"></script>
    
   <script src="${pageContext.request.contextPath}/static/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/vendor/datatables-responsive/dataTables.responsive.js"></script>
     <script src="${pageContext.request.contextPath}/static/vendor/datatables-rowsgroup-master/dataTables.rowsGroup.js"></script>
	
	 
	 
	 <!-- <script src="${pageContext.request.contextPath}/static/vendor/jquery/dist/jquery.min.js"> </script> -->
    
      <!-- CK Editor -->
      <script src="${pageContext.request.contextPath}/static/ckeditor/ckeditor.js"></script>
      
      <!-- Select2 Dropdownlist -->
      
      <script src="${pageContext.request.contextPath}/static/vendor/select/dist/js/select2.min.js"></script>
      
      <!-- Blueimp for displaying Gallery -->
      <script src="${pageContext.request.contextPath}/static/vendor/blueimp/js/blueimp-gallery.min.js"></script>
	<!-- <script src="${pageContext.request.contextPath}/static/vendor/blueimp/js/jquery.blueimp-gallery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/vendor/blueimp/js/bootstrap-image-gallery.min.js"></script> -->	
	<!-- Untuk Jam -->
	
	<!-- Select with Search -->
	

	
  <script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>

<script>

$(document).ready(function() {
	
	$.ajax({
	 type: "GET",
	    url:"${pageContext.request.contextPath}/roles",
	    dataType: "json",
	    contentType : "application/json",
		
		
	    
	    success: function (data) {
	 
	   
	    $.each(data, function(ind, obj)
	        {
	    	
	    	
	    	var role_data= obj.roleCode;
	    	var full_name = obj.fullName;
	         $("#roles").text(role_data);
	         $("#fullName").text(full_name);
	         
	        });  
	    
	    
	    }
	 
    
			});
	
	
	
	
	
		
$.ajax({
    type: "GET",
    url:"${pageContext.request.contextPath}/notification",
    dataType: "json",
    contentType : "application/json",
	
	
    
    success: function (data) {
 
       
    $('#notification').empty(); 
    
    var count=0;
    $.each(data, function(ind, obj)
        {
    	
    	
    	var div_data="<li><a href='${pageContext.request.contextPath}/to-do-list'> <i class='fa fa-info-circle fa-fw'></i> "+obj.project+"  </a> </li>";
         $(div_data).appendTo('#notification'); 
        
         count++;
         
        });  
    
    
    if (count==0)
    	{
    	
    	$("#font").removeAttr('color','red');
    	$("#count").text("");
    	$("#adaNotif").removeAttr('hidden', 'hidden');
    	var div_data="<li class='divider'></li><li><a class='text-center' href='#'><strong>You Dont Have Notification</strong> <i class='fa fa-angle-right'></i></a></li>";
        $(div_data).appendTo('#notification'); 
    	}
    else{
    	$("#adaNotif").removeAttr('hidden', 'hidden');
    	$("#font").attr('color','red');
    	$("#count").text("("+count+")");
    	var div_data="<li><a class='text-center' href='${pageContext.request.contextPath}/to-do-list'><strong>See All To Do List</strong> <i class='fa fa-angle-right'></i></a></li>";
        $(div_data).appendTo('#notification');
    	
    	
    }
  
 
    
    
    }
  });
});


$("#exCollapse").click(function () {
	
	var countCol = $("#flagCol").val();
	$header2 = $("#navCollapse");
    $body =  $("#isiBody");
    if(countCol==0)
    	{
    		$content2 = $(".col-lg-9");
    		$("#flagCol").val("1");
    		
    	
    	}
    else if(countCol==1)
    	{
    	$content2 = $(".col-lg-13");
    	$("#flagCol").val("0");
    	}
    
    
    $notif = $("#right-sidebar");
    //getting the next element
    //$content = $header2.next();
      $notif.slideToggle(100, function () {});
    
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
    $header2.slideToggle(100, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
       
        
        $content2.attr("class", function () { 
        	
        	
        	return $header2.is(":visible")  ? "col-lg-9" : "col-lg-13" ;
        });
        
        $body.attr("class",function () {
            //change text based on condition
            return $header2.is(":visible")  ? "page-wrapper" : "col-lg-12" ;
        });
        
 		
       
        
    });

});


</script>
	
    
