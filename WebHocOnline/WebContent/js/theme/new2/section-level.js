$(document).ready(function() {
	$('[data-toggle="sectiontest"]').click(function(e) {
		e.preventDefault();
        var rpModal = $('#registerPackageModal');
		var box = $('#sectionLevelModal');
		var body = box.find('.modal-body');
        var $this = $(this),
            $sqid = $this.data('sqid'),
            $sectionid = $this.data('sectionid'),
			$courseid = $this.data('courseid'),
			$lastScorm = $this.data('lastscorm'),
			$groupid = $this.data('groupid'),
			$packageid = $this.data('packageid')
		;
		body.empty();

		$.ajax({
			url: '/course/check-sectionlevel.php',
			method: 'POST',
			data:{sqid: $sqid, sectionid: $sectionid, courseid: $courseid, lastScorm: $lastScorm, groupid: $groupid, packageid: $packageid},
			dataType: 'json',
			success: function(response) {
				switch (response.status) {
					case 'success':
						var html = '<div class="inner-body">';
						html += '<div class="msg-wrap">';
						html += response.message;
						html += '</div>';

						if ($lastScorm >= 0) {
							html += '<a href="' + $this.attr('href') + '" class="sl-ignoreCheck btn-sl">Bá» qua</a>';
						} else {
							html += '<a href="#" class="sl-ignoreCheck btn-sl" data-dismiss="modal">Bá» qua</a>';
						}

						html += '<a target="_blank" href="' + response.url + '" class="sl-startCheck btn-sl sl-orange">LĂ m bĂ i</a>';
						html += '</div>';
						body.html(html);
						box.modal('show');
						break;
					case 'fail':
						if ($sectionid) {
							window.location.href = $this.attr('href');
						} else {
						   	var html = '<div class="inner-body">';
							html += '<br><p>' + response.message + '</p>';
							html += '</div>';
							body.html(html);
							box.modal('show');
						}
						break;
					case 'pass':
					case 'notest':
						window.location.href = $this.attr('href');
						break;
					case 'checked':
						location.href = response.url;
						break;
					case 'not_register':
						rpModal.find('.course-register-now').attr('href', response.url);
						rpModal.modal('show');
						break;
					case 'viewscorm':
                        window.location.href = $this.attr('href');
						break;
				}
			}
		});
	});
	$(document).on('click', '.sl-startCheck', function() {
		$('#sectionLevelModal').modal('hide');
	});
});