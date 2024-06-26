<div class="card">
	<div class="card-header">
		Failed orders in the past week
	</div>
	<div class="card-body table-responsive">
	<span>
		Orders that show up here have failed because of a system error. If the error didn't occur immediately some items might have been delivered. You should manually investigate if the user should be refunded.
	</span>

		{if $failed}
		<table class="table table-hover">
			{foreach from=$failed item=failed_log}
					<tr>
						<td width="20%">{date("Y/m/d", $failed_log.timestamp)}</td>
						<td width="16%">
							<a href="{$url}admin/accounts/get/{$failed_log.user_id}" target="_blank">
								{$failed_log.username}
							</a>
						</td>

						<td width="35%">
							{if $failed_log.vp_cost}<i class="fa-solid fa-coins text-transparent"></i> {$failed_log.vp_cost} VP{/if}
							{if $failed_log.dp_cost}<i class="fa-solid fa-coins text-warning ms-2"></i> {$failed_log.dp_cost} DP{/if}
						</td>

						<td>
							<a data-bs-toggle="tooltip" data-placement="top" data-html="true" title="{foreach from=$failed_log.json item=item}{$item.itemName} to {$item.characterName}<br>{/foreach}">{count($failed_log.json)} items</a>
						</td>

						{if hasPermission("canRefundOrders")}
							<td style="text-align:right;">
								<a class="btn btn-primary btn-sm" href="javascript:void(0)" onClick="Orders.refund({$failed_log.id}, this)">Refund</a>
							</td>
						{/if}
					</tr>
			{/foreach}
			</table>
		{/if}
	</div>
</div>

<div class="card">
	<div class="card-header">
		Last 10 successful orders
	</div>
	<div class="card-body table-responsive">
	<form class="input-group mb-3" onSubmit="Orders.search('successful'); return false">
		<input class="form-control" type="text" name="search_successful" id="search_successful" placeholder="Search by username">

		<button type="submit" class="btn btn-primary">Search</button>
	</form>

	<span id="order_list_successful">
		{if $completed}
			{foreach from=$completed item=completed_log}
				<table class="table table-hover">
					<tbody style="border-top:none">
					<tr>
						<td width="20%">{date("Y/m/d", $completed_log.timestamp)}</td>
						<td width="16%">
							<a href="{$url}admin/accounts/get/{$completed_log.user_id}" target="_blank">
								{$completed_log.username}
							</a>
						</td>

						<td width="35%">
							{if $completed_log.vp_cost}<i class="fa-solid fa-coins text-transparent"></i> {$completed_log.vp_cost} VP{/if}
							{if $completed_log.dp_cost}<i class="fa-solid fa-coins text-warning ms-2"></i> {$completed_log.dp_cost} DP{/if}
						</td>

						<td>
							<span data-bs-toggle="tooltip" data-placement="top" data-html="true" title="{foreach from=$completed_log.json item=item}{$item.itemName|replace:'"':'&quot;'} to {$item.characterName}&#013;{/foreach}">{count($completed_log.json)} item{if count($completed_log.json) >1}s{/if}</span>
						</td>
					</tbody>
					</tr>
				</table>
			{/foreach}
		{/if}
	</span>
	</div>
</div>
