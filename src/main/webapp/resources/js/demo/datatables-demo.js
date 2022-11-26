// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('table.action-panel').each(function(index, object) {
    $(object).DataTable( {
      dom: 'Bfrtip',
      "pageLength": 5,
      buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print'
      ]
    } );
  })
} );