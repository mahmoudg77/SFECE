
<div id="customer" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Customer Info</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="/admin/newCustomer" method="POST" id="frmCustomer">
        	{{ csrf_field() }}
		  <div class="form-group">
		    <label class="control-label col-sm-3" for="first_name">First Name:</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" name="first_name" id="first_name" placeholder="Enter First name">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-3" for="last_name">Last Name:</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Enter Last name">
		    </div>
		  </div>
		  <div class="form-group">
			  <label class="control-label col-sm-3" for="sex">Sex:</label>
			  <div class="col-sm-9">
				  <select class="form-control" id="sex" name="sex">
				    <option value-"">Select Sex</option>
				    <option value="0">Male</option>
				    <option value="1">Female</option>
				  </select>
			  </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-3" for="email">Email:</label>
		    <div class="col-sm-9">
		      <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-3" for="phone">Phone:</label>
		    <div class="col-sm-9">
		      <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter Last name">
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
      	<input type="hidden" name="id" id="id" value=""/>
      	<!-- <input type="submit" value="Save" id="save" class="btn btn-success"/> -->
      	<button type="submit" class="btn btn-success" id="save">Save</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>