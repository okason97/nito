$(document).ready(function() {
    $('#courses-table').DataTable({
        responsive: true,
        columnDefs: [
            { orderable: false, targets: [ 1,2,3,4,5 ] }
        ],        
        paginate: false
    });
    $('#state-table').DataTable({
        responsive: true,
        paginate: false,
        "searching": false,
        aaSortingFixed: [[0,'asc']],
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            },
            {
                orderable: false,
                "targets":  "_all",
            }
        ],
    });
} );