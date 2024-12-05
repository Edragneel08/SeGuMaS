<%-- 
    Document   : sessionCheck
    Created on : 26 Jun 2024, 4:30:25 pm
    Author     : edrag
--%>

<!-- commonHead.jsp -->
<!-- SweetAlert2 -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<% 
    String username = (String) session.getAttribute("username");
    if (username == null) {
        // Trigger the SweetAlert2 modal
%>
<script type="text/javascript">
    window.onload = function () {
        Swal.fire({
            title: 'Session Ended',
            text: "Your session has ended. Please log in again.",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'LOGIN'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'index.jsp';
            } else {
                Swal.fire({
                    title: 'Session Ended',
                    text: "Please log in again.",
                    icon: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'LOGIN'
                }).then(() => {
                    window.location.href = 'index.jsp';
                });
            }
        });
    }
</script>
<% 
    }
%>