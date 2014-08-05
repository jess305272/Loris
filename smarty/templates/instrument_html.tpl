<script type="text/javascript" src="js/instrument_form_control.js"></script>
<style type="text/css">
	.table-instrument>tbody>tr>th{
		color: black;
	}
	.table-instrument>tbody>tr>th, .table-instrument>tbody>tr>td  { 
	     border-top: none; 
	 }
</style>
<form {$form.attributes}>
	{$form.hidden}
	{$form.errors.mainError}
	{assign var="inTable" value="FALSE"}
	{foreach from=$form.elements item=element}
		{if $element.name neq mainError}
			{if $element.name eq lorisSubHeader}
				<div class="col-xs-12">
					{$element.label}
				</div>
				<br><br><br><br>
			{elseif $element.type eq "group"}
				{assign var='colspan' value=count($element.elements)}
				{if $colspan <= 2}
					{if $inTable eq "TRUE"}
						{assign var="inTable" value="FALSE"}
						</table>
					{/if}
					{if $element.error}
			    	<div class="row form-group form-inline form-inline has-error">
			        {else}
			        <div class="row form-group form-inline form-inline">
			        {/if}
						<lable class="lab col-sm-4 col-xs-12">
							{if $element.required}
								<span style="color: #ff0000">*</span>
							{/if}
							{$element.label}  
						</lable>
						<div class="col-sm-8">
							<div class="col-xs-12 element">
								{foreach key=gkey item=gitem from=$element.elements}
									{$gitem.html}
								{/foreach}
							</div>
							{if $element.error}
								<div class="col-xs-12">
				                    <font class="form-error">{$element.error}</font>
				                </div>
							{/if}
						</div>
					</div>
				{else}
					{if $inTable eq "FALSE"}
						{assign var="inTable" value="TRUE"}
						<table class="table table-instrument">
							<tr>
								<th>{$element.label}</th>
								{foreach key=gkey item=gitem from=$element.elements}
									<th>{$gitem.html}</th>
								{/foreach}
							</tr>
					{else}
						<tr>
							<td>{$element.label}</td>
							{foreach key=gkey item=gitem from=$element.elements}
								{if $gitem.type == 'date'}
									<td class="element form-inline">{$gitem.html}</td>
								{else}
									<td class="element">{$gitem.html}</td>
								{/if}
							{/foreach}
						</tr>
					{/if}
				{/if}
			{else}
				{if $inTable eq "TRUE"}
					{assign var="inTable" value="FALSE"}
					</table>
				{/if}
				{if $element.error}
		    	<div class="row form-group form-inline form-inline has-error">
		        {else}
		        <div class="row form-group form-inline form-inline">
		        {/if}
		        	<lable class="lab col-sm-4 col-xs-12">
						{if $element.required}
							<span style="color: #ff0000">*</span>
						{/if}
						{$element.label}  
					</lable>
					<div class="col-sm-8">
						<div class="col-xs-12 element">
							{$element.html}
						</div>
						{if $element.error}
							<div class="col-xs-12">
			                    <font class="form-error">{$element.error}</font>
			                </div>
						{/if}
					</div>
				</div>
			{/if}
		{/if}
	{/foreach}
	{foreach from=$form.sections item=section}
		<div class="col-sm-12">
			<div class="col-sm-8">
				<h5 align="center">{$section.header}</h5>
			</div>
		</div>
		{foreach from=$section.elements item=element}
			{if $element.name neq mainError}
				{if $element.name eq lorisSubHeader}
					<div class="col-xs-12">
						{$element.label}
					</div>
					<br><br><br><br>
				{elseif $element.type eq "group"}
					{assign var='colspan' value=count($element.elements)}
					{if $colspan <= 2}
						{if $inTable eq "TRUE"}
							{assign var="inTable" value="FALSE"}
							</table>
						{/if}
						{if $element.error}
				    	<div class="row form-group form-inline form-inline has-error">
				        {else}
				        <div class="row form-group form-inline form-inline">
				        {/if}
							<lable class="lab col-sm-4 col-xs-12">
								{if $element.required}
									<span style="color: #ff0000">*</span>
								{/if}
								{$element.label}  
							</lable>
							<div class="col-sm-8">
								<div class="col-xs-12 element">
									{foreach key=gkey item=gitem from=$element.elements}
										{$gitem.html}
									{/foreach}
								</div>
								{if $element.error}
									<div class="col-xs-12">
					                    <font class="form-error">{$element.error}</font>
					                </div>
								{/if}
							</div>
						</div>
					{else}
						{if $inTable eq "FALSE"}
							{assign var="inTable" value="TRUE"}
							<table class="table table-instrument">
								<tr>
									<th>{$element.label}</th>
									{foreach key=gkey item=gitem from=$element.elements}
										<th>{$gitem.html}</th>
									{/foreach}
								</tr>
						{else}
							<tr>
								<td>{$element.label}</td>
								{foreach key=gkey item=gitem from=$element.elements}
									{if $gitem.type == 'date'}
										<td class="element form-inline">{$gitem.html}</td>
									{else}
										<td class="element">{$gitem.html}</td>
									{/if}
								{/foreach}
							</tr>
						{/if}
					{/if}
				{else}
					{if $inTable eq "TRUE"}
						{assign var="inTable" value="FALSE"}
						</table>
					{/if}
					{if $element.error}
			    	<div class="row form-group form-inline has-error">
			        {else}
			        <div class="row form-group form-inline">
			        {/if}
			        	<lable class="lab col-sm-4 col-xs-12">
							{if $element.required}
								<span style="color: #ff0000">*</span>
							{/if}
							{$element.label}  
						</lable>
						<div class="col-sm-8">
							<div class="col-xs-12 element">
								{$element.html}
							</div>
							{if $element.error}
								<div class="col-xs-12">
				                    <font class="form-error">{$element.error}</font>
				                </div>
							{/if}
						</div>
					</div>
				{/if}
			{/if}
		{/foreach}
		{if $inTable eq "TRUE"}
			{assign var="inTable" value="FALSE"}
			</table>
		{/if}
	{/foreach}
</form>