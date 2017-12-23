$(document).ready(function() {
    $('#enrolls-table').DataTable({
        responsive: true,
        columnDefs: [
            { orderable: false, targets: [ 3 ] }
        ],        
    });
} );