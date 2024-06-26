<section id="update_status">
    <div class="text-center my-4">
        <i class="fas fa-spinner fa-pulse fa-xl"></i>
    </div>
</section>

<script>
    var Status = {
        statusField: $("#update_status"),

        /**
         * Refresh the realm status
         */
        update: function()
        {
            $.get(Config.URL + "sidebox_online_players_extended/status", function(data) {
                Status.statusField.html(data);
            });
        }
    }

    Status.update();

	{if $auto_refresh}
		setInterval(Status.update, {$auto_refresh_interval} * 1000);
	{/if}
</script>
