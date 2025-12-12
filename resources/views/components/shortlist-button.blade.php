@props(['icon'=>'medal','message'=>'Message','type'=>'warning'])

<a onclick="return confirm('{{$message}}')"
   class="btn btn-sm btn-{{$type}} btn-custom-size"><i class='bx bx-{{$icon}}'></i></a>&nbsp;
