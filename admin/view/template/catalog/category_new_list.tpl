<?php echo $header; ?>
<style>
		/*
		 * CSS3 Treevew. No JavaScript
	     * @version 1.0
		 * @author Martin Ivanov
		 * @url developer's website: http://wemakesites.net/
	     * @url developer's twitter: https://twitter.com/#!/wemakesitesnet
		 * @url developer's blog http://acidmartin.wordpress.com/
		 **/
		.css-treeview ul,
		.css-treeview li
		{
			padding: 0;
			margin: 0;
			list-style: none;
		}
		
		.css-treeview li {
			background-color: #EFEFEF;
   			 border: 1px solid #AAAAAA;
   			 margin-bottom: 5px;
   			 padding: 5px 0 5px 5px;
		}

		.css-treeview input
		{
			position: absolute;
			opacity: 0;
		}

		.css-treeview
		{
			font: normal 11px "Segoe UI", Arial, Sans-serif;
			-moz-user-select: none;
			-webkit-user-select: none;
			user-select: none;
			width:250px;
			overflow:auto;
			min-height:500px;
			height:auto;
		}

		.css-treeview a
		{
			color: #00f;
			text-decoration: none;
		}

		.css-treeview a:hover
		{
			text-decoration: underline;
		}

		.css-treeview input + label + ul
		{
			margin: 0 0 0 18px;
		}

		.css-treeview input ~ ul
		{
			display: none;
		}

		.css-treeview label,
		.css-treeview label::before
		{
			cursor: pointer;
		}

		.css-treeview input:disabled + label
		{
			cursor: default;
			opacity: .6;
		}

		.css-treeview input:checked:not(:disabled) ~ ul
		{
			display: block;
		}

		.css-treeview label,
		.css-treeview label::before,
		.css-treeview .nochild
		{
			background: url("../image/icons.png") no-repeat;
		}

		.css-treeview label,
		.css-treeview a,
		.css-treeview label::before,
		.css-treeview .nochild::before
		{
			display: inline-block;
			height: 16px;
			line-height: 16px;,
			vertical-align: middle;
		}

		.css-treeview label
		{
			background-position: 18px 0;
		}
		
		.css-treeview .nochild::before
		{
			margin: 0 22px 0 0;
			content: "";
			width: 1px;
			vertical-align: middle;
		}

		.css-treeview label::before
		{
			content: "";
			width: 16px;
			margin: 0 22px 0 0;
			vertical-align: middle;
			background-position: 0 -35px;
		}

		.css-treeview input:checked + label::before
		{
			background-position: 0 -19px;
		}

		/* webkit adjacent element selector bugfix */
		@media screen and (-webkit-min-device-pixel-ratio:0)
		{
			.css-treeview 
			{
				-webkit-animation: webkit-adjacent-element-selector-bugfix infinite 1s;
			}
			
			@-webkit-keyframes webkit-adjacent-element-selector-bugfix 
			{
				from 
				{ 
					padding: 0;
				} 
				to 
				{ 
					padding: 0;
				}
			}
		}
		.imgAdd img
		{
			width:15px;
			height:15px;
			margin-left: 5px;
		}
		li label
		{
			padding-bottom:2px;
		}
		
		.imgAddMain 
		{
		padding-bottom:10px;
		}
		
		.imgAddMain img
		{
			width:25px;
			height:25px;
		}
		</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div id="categoryNameDiv" style="padding-top: 0;"></div>
    </div>
    <div class="content">
    <table width="100%">
    <tr>
    <td width="250px" valign="top"> 
    
    <div class="css-treeview">
    
    <ul>
    <?php $topCat=0;?>
    <?php $viewCatId='';?>
    <?php $viewCatName='';?>
      <?php foreach ($categories as $category) { ?>
      <?php if($topCat==0) {?>
      <?php $viewCatId = $category['category_id']; $viewCatName = '"'.$category['name'].'"'; $topCat++;?>
      <?php } ?>
      <?php $catName='"'.$category['name'].'"';?>
      <li>        
        <?php if ($category['children']) { ?>
        <?php echo "<input type='checkbox' id='".$category['category_id']."' /><label for='".$category['category_id']."'><a href='javascript:;' onclick='getProducts(".$category['category_id'].", ".$catName.")'>".$category['name']."(".count($category['children']).")</a><a title='Add Product' href=".$category['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a></label>"; ?>
        <ul>
          <?php foreach ($category['children'] as $child) { ?>
          <?php $catName='"'.$child['name'].'"';?>
          <li>                      
            <?php if ($child['children']) { ?>
            <?php echo "<input type='checkbox' id='".$child['category_id']."' /><label for='".$child['category_id']."'><a href='javascript:;' onclick='getProducts(".$child['category_id'].", ".$catName.")'>".$child['name']."(".count($child['children']).")</a><a title='Add Product' href=".$child['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a></label>"; ?>
            <ul>
              <?php foreach ($child['children'] as $child1) { ?>
              <?php $catName='"'.$child1['name'].'"';?>
              <li>                
                <?php if ($child1['children']) { ?>
                <?php echo "<input type='checkbox' id='".$child1['category_id']."' /><label for='".$child1['category_id']."'><a href='javascript:;' onclick='getProducts(".$child1['category_id'].", ".$catName.")'>".$child1['name']."(".count($child1['children']).")</a><a title='Add Product' href=".$child1['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a></label>"; ?>
                <ul>
                  <?php foreach ($child1['children'] as $child2) { ?>
                  <?php $catName='"'.$child2['name'].'"';?>
                  <li>                    
                    <?php if ($child2['children']) { ?>
                    <?php echo "<input type='checkbox' id='".$child2['category_id']."' /><label for='".$child2['category_id']."'><a href='javascript:;' onclick='getProducts(".$child2['category_id'].", ".$catName.")'>".$child2['name']."(".count($child2['children']).")</a><a title='Add Product' href=".$child2['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a></label>"; ?>
                    <ul>
                      <?php foreach ($child2['children'] as $child3) { ?>
                      <?php $catName='"'.$child3['name'].'"';?>
                      <li>                        
                        <?php if ($child3['children']) { ?>
                        <?php echo "<input type='checkbox' id='".$child3['category_id']."' /><label for='".$child3['category_id']."'><a href='javascript:;' onclick='getProducts(".$child3['category_id'].", ".$catName.")'>".$child3['name']."(".count($child3['children']).")</a><a title='Add Product' href=".$child3['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a></label>"; ?>
                        <ul>
                          <?php foreach ($child3['children'] as $child4) { ?>
                          <?php $catName='"'.$child4['name'].'"';?>
                          <li>                            
                            <?php if ($child4['children']) { ?>
                            <?php echo "<input type='checkbox' id='".$child4['category_id']."' /><label for='".$child4['category_id']."'><a href='javascript:;' onclick='getProducts(".$child4['category_id'].", ".$catName.")'>".$child4['name']."(".count($child4['children']).")</a><a title='Add Product' href=".$child4['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a></label>"; ?>
                            <ul>
                              <?php foreach ($child4['children'] as $child5) { ?>
                              <?php $catName='"'.$child5['name'].'"';?>
                              <li>
                              	<?php if($child5['children']) { ?>
                                <?php echo "<input type='checkbox' id='".$child5['category_id']."' /><label for='".$child5['category_id']."'><a href='javascript:;' onclick='getProducts(".$child5['category_id'].", ".$catName.")'>".$child5['name']."</a><a title='Add Product' href=".$child5['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a></label>"; ?>
                                <?php } else { ?>
                                <?php echo "<a class='nochild' href='javascript:;' onclick='getProducts(".$child5['category_id'].", ".$catName.")'>".$child5['name']."</a><a title='Add Product' href=".$child5['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a>"; ?>
                                <?php } ?>
                              </li>
                              <?php } ?>
                             </ul>
                          <?php } else { ?>
                              	<?php echo "<a class='nochild' href='javascript:;' onclick='getProducts(".$child4['category_id'].", ".$catName.")'>".$child4['name']."</a><a title='Add Product' href=".$child4['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a>";?>
                              <?php } ?>
                          </li>
                          <?php } ?>
                         </ul>
                      <?php } else { ?>
                      <?php echo "<a class='nochild' href='javascript:;' onclick='getProducts(".$child3['category_id'].", ".$catName.")'>".$child3['name']."</a><a title='Add Product' href=".$child3['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a>"; ?>
                      <?php } ?>
                      </li>
                      <?php } ?>
                     </ul>
                  <?php } else { ?>
                  <?php echo "<a class='nochild' href='javascript:;' onclick='getProducts(".$child2['category_id'].", ".$catName.")'>".$child2['name']."</a><a title='Add Product' href=".$child2['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a>"; ?>
                  <?php } ?>
              	  </li>
                 <?php } ?>
                </ul>
            <?php } else { ?>
            <?php echo "<a class='nochild' href='javascript:;' onclick='getProducts(".$child1['category_id'].", ".$catName.")'>".$child1['name']."</a><a title='Add Product' href=".$child1['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a>"; ?>
            <?php } ?>
              </li>
          	  <?php } ?>
        	</ul>
        	<?php } else { ?>
            <?php echo "<a class='nochild' href='javascript:;' onclick='getProducts(".$child['category_id'].", ".$catName.")'>".$child['name']."</a><a title='Add Product' href=".$child['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a>"; ?>
            <?php } ?>
      	  </li>
      <?php } ?>
    	</ul>
        <?php } else { ?>
        <?php echo "<a class='nochild' href='javascript:;' onclick='getProducts(".$category['category_id'].", ".$catName.")'>".$category['name']."</a><a title='Add Product' href=".$category['addProdLink']." class='imgAdd'><img src='../image/add_pro.png' alt='Add Product' /></a>"; ?>
        <?php } ?>
      </li>
      <?php } ?>
     </ul>      
  	</div>    
    </td>
    <td valign="top">
    <div id="productList" style="width:auto;">
    </div>
    </td>
    </tr>
    </table>
    </div>
  </div>
</div>

<script type="text/javascript">

var getProducts = function(categoryId, categoryName){
	$("#categoryNameDiv").html('<h1>&nbsp;==>>&nbsp;'+categoryName+'</h1>');	
	var request = $.ajax({
	url: "index.php?route=catalog/product/newindex&token=<?php echo $token; ?>&category_id="+categoryId,
	dataType: "html"
	});
	request.done(function( msg ) {
	$( "#productList" ).html( msg );
	});
}

var getNewPage = function(url){	
	var request = $.ajax({
	url: url,
	dataType: "html"
	});
	request.done(function( msg ) {
	$( "#productList" ).html( msg );
	});
}


var editProduct = function(url){	
	var request = $.ajax({
	url: url,
	dataType: "html"
	});
	request.done(function( msg ) {
	$( "#productList" ).html( msg );
	});
}

var copyProduct = function(url){	
	if(confirm('Are your sure?'))
	{
		var url = $("#form").attr("action");; // the script where you handle the form input.
		//alert(url);
		$.ajax({
			   type: "POST",
			   url: url,
			   data: $("#form").serialize(), // serializes the form's elements.
			   success: function(data)
			   {
				   $( "#productList" ).html( data ); // show response from the php script.
			   }
			 });
	
		return false; 
	}
}

var CKupdate = function(){
    for ( instance in CKEDITOR.instances )
        CKEDITOR.instances[instance].updateElement();
}

var saveeditProduct = function(){	
	CKupdate();
	var url = $("#form").attr("action");
	var request = $.ajax({
	type: "POST",
	url: url,
	data: $("#form").serialize(),
	dataType: "html"
	});
	request.done(function( msg ) {
	$( "#productList" ).html( msg );
	});
}

var saveeditCategory = function(){	
	CKupdate();
	var url = $("#form").attr("action");
	var request = $.ajax({
	type: "POST",
	url: url,
	data: $("#form").serialize(),
	dataType: "html"
	});
	request.done(function( msg ) {
	window.location=msg;//'index.php?route=catalog/category/newindex&token=<?php echo $token; ?>';
	});
}

var ajaxDelete = function(){
	if(confirm('Are your sure?'))
	{
		var url = $("#form").attr("action"); // the script where you handle the form input.
		$.ajax({
			   type: "POST",
			   url: url,
			   data: $("#form").serialize(), // serializes the form's elements.
			   success: function(data)
			   {
				   $( "#productList" ).html( data ); // show response from the php script.
			   }
			 });
	
		return false; 
	}
}



getProducts(<?php echo $viewCatId;?>, <?php echo $viewCatName;?>);
</script> 

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<?php echo $footer; ?>