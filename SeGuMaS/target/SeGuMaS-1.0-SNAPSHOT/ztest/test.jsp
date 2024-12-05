<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stepper Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        .step {
            display: none;
        }
        .step.active {
            display: block;
        }
        .stepper-buttons {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form">

        <c:if test="${staff == null}">
            <form class="cmxform form-horizontal style-form" id="commentForm" action="insert" method="POST" enctype="multipart/form-data">
        </c:if>

        <c:if test="${staff != null}">
            <form class="cmxform form-horizontal style-form" id="commentForm" action="update" method="GET" enctype="multipart/form-data">
        </c:if>

            <div class="step active">
                <div class="form-group">
                    <label for="staffName" class="control-label col-lg-2">Name (required)</label>
                    <div class="col-lg-10">
                        <input type="text" value="<c:out value='${staff.fullname}' />"
                               class="form-control" name="fullname" required="required"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="ICNO" class="control-label col-lg-2">IC NO (required)</label>
                    <div class="col-lg-10">
                        <input type="text" value="<c:out value='${staff.ICNO}' />"
                               class="form-control" name="ICNO" required="required"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="noPhone" class="control-label col-lg-2">No Phone (required)</label>
                    <div class="col-lg-10">
                        <input type="text" value="<c:out value='${staff.noPhone}' />"
                               class="form-control" name="noPhone" required="required"/>
                    </div>
                </div>
            </div>

            <div class="step">
                <div class="form-group">
                    <label for="img" class="control-label col-lg-2">Staff Image (required)</label>
                    <div class="fileupload fileupload-new col-lg-10" data-provides="fileupload">
                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">
                        </div>
                        <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                        <div>
                            <span class="btn btn-theme02 btn-file">
                                <span class="fileupload-new"><i class="fa fa-paperclip"></i> Select image</span>
                                <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                <input type="file" class="default" name="img">
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="step">
                <div class="form-group">
                    <label for="email" class="control-label col-lg-2">E-mail (required)</label>
                    <div class="col-lg-10">
                        <input type="text" value="<c:out value='${staff.email}' />" 
                               class="form-control" name="email"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="username" class="control-label col-lg-2">Username (required)</label>
                    <div class="col-lg-10">
                        <input type="text" value="<c:out value='${staff.username}' />" 
                               class="form-control" name="username"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="control-label col-lg-2">Password (required)</label>
                    <div class="col-lg-10">
                        <input type="text" value="<c:out value='${staff.password}' />" 
                               class="form-control" name="password"/>
                    </div>
                </div>
            </div>

            <div class="stepper-buttons">
                <button type="button" id="prevBtn" class="btn btn-default" onclick="changeStep(-1)">Previous</button>
                <button type="button" id="nextBtn" class="btn btn-primary" onclick="changeStep(1)">Next</button>
            </div>

            <c:if test="${staff != null}">
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button class="btn btn-theme" type="submit">Update</button>
                        <input type='hidden' name="action" value="update">
                        <button class="btn btn-theme04" type="reset">Cancel</button>
                    </div>
                </div>
            </c:if>
            <c:if test="${staff == null}">
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button class="btn btn-theme" type="submit">Save</button>
                        <button class="btn btn-theme04" type="reset">Cancel</button>
                    </div>
                </div>
            </c:if>
        </form>
    </div>
</div>

<script>
    var currentStep = 0;
    showStep(currentStep);

    function showStep(step) {
        var steps = document.getElementsByClassName("step");
        steps[step].classList.add("active");
        if (step === 0) {
            document.getElementById("prevBtn").style.display = "none";
        } else {
            document.getElementById("prevBtn").style.display = "inline";
        }
        if (step === steps.length - 1) {
            document.getElementById("nextBtn").innerHTML = "Submit";
            document.getElementById("nextBtn").setAttribute("type", "submit");
        } else {
            document.getElementById("nextBtn").innerHTML = "Next";
            document.getElementById("nextBtn").setAttribute("type", "button");
        }
    }

    function changeStep(step) {
        var steps = document.getElementsByClassName("step");
        steps[currentStep].classList.remove("active");
        currentStep += step;
        if (currentStep >= steps.length) {
            document.getElementById("commentForm").submit();
            return false;
        }
        showStep(currentStep);
    }
</script>
</body>
</html>
