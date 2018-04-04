@extends('dashboard.index')
@section('title', 'Create Customer')
@section('content')

<div class="panel panel-default">
    <div class="panel-heading"><button type="button" class="btn btn-info" id="add" value="add">New Customer</button></div>

    <div class="panel-body">
    	@include('cpanel.customers.newCustomer')
        <table class="table table-hover table-striped">
        	<caption>Customer Info</caption>
        	<thead style="background-color: #eee;">
        		<th>ID</th>
        		<th>First Name</th>
        		<th>Last Name</th>
        		<th>sex</th>
        		<th>email</th>
        		<th>phone</th>
        		<th></th>
        	</thead>
        	<tbody>
        		@foreach($customers as $key=>$customer)
        		<tr id="customer{{$customer->id}}">
        			<td>{{$customer->id}}</td>
        			<td>{{$customer->first_name}}</td>
        			<td>{{$customer->last_name}}</td>
        			<td>@if ($customer->sex == 0) Male @else Female @endif</td>
        			<td>{{$customer->email}}</td>
        			<td>{{$customer->phone}}</td>
        			<td>
        				<div class="btn-group">
        					<button class="btn btn-success btn-sm btn-edit" data-id="{{$customer->id}}">Edit</button>
        					<button class="btn btn-danger btn-sm btn-delete" data-id="{{$customer->id}}">Delete</button>
        				</div>
        			</td>
        		</tr>
        		@endforeach
        	</tbody>
        </table>
    </div>
</div>


<script type="text/javascript">
$.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
      }
    })
//$(document).ready(function(){
    $('#add').on('click',function(){
		$('#save').val('save');
		//$('#frmCustomer').trigger('reset');
		$('#customer').modal('show');
	});
	//---------add new---------
	$("#save").on('click',function(e){
		e.preventDefault();
		var form=$('#frmCustomer');
		var formData=form.serialize();
		var url=form.attr('action');
		var state=$('#save').val();
		var type= 'post';

		if (state=='update'){
			type='PUT';
		}
		$.ajax({
			type : type,
			url : url,
			data : formData,
			success:function(data){
				//console.log(data);
				//console.log(state);
				//addRow(data);
				var sex="";
				if(data.sex==0){
					sex="Male";
				}else{sex="Female";}
				var row='<tr id=""customer'+ data.id +'">'+
					'<td>'+ data.id +'</td>'+
					'<td>'+ data.first_name +'</td>'+
					'<td>'+ data.last_name +'</td>'+
					'<td>'+ sex +'</td>'+
					'<td>'+ data.email +'</td>'+
					'<td>'+ data.phone +'</td>'+
					'<td><div class="btn-group"><button class="btn btn-success btn-sm btn-edit" data-id="'+data.id+'">Edit</button>'+
					'<button class="btn btn-danger btn-sm btn-delete" data-id="'+data.id+'">Delete</button></div></td>'+
					'</tr>';
						//$('tbody').append(row);
					if(state=='save'){
						$('tbody').append(row);
					}else{
						$('#customer'+data.id).replaceWith(row);
					}
				$('#frmCustomer').trigger('reset');
				$('#first_name').focus();
				//$('#customer').modal('hide');

			}
		})
	});
	//------- get update-------------
	$('tbody').delegate('.btn-edit','click',function(){
		var value=$(this).data('id');
		var url= "{{URL::to('admin/getUpdate')}}";
		//alert(value);
		$.ajax({
			type: 'get',
			url: url,
			data: {'id':value},
			success:function(data){
				//console.log(data);
				$('#id').val(data.id);
				$('#first_name').val(data.first_name);
				$('#last_name').val(data.last_name);
				$('#sex').val(data.sex);
				$('#email').val(data.email);
				$('#phone').val(data.phone);
				$('#save').val('update');
				$('#frmCustomer').attr("action", "newUpdate");
				$('#frmCustomer').attr("method", "PUT");
				$('#customer').modal('show');
			}
		});
	})
	//--------- delete --------------
	$('tbody').delegate('.btn-delete','click',function(){
		var value=$(this).data('id');
		var url= "{{URL::to('admin/deleteCustomer')}}";
		if (confirm('Are you sure to delete')==true){
			$.ajax({
			type: 'post',
			url: url,
			data: {'id':value},
			success:function(data){
				//alert(data.sms);
				$('#customer'+value).remove();
				console.log(data);
			}
			});
		}
	})
//});

</script>


@stop
