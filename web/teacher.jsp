<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; }
        html, body { height: 100%; margin: 0; font-family: 'Roboto', sans-serif; background: #f8f5f0; }
        .container-fluid { height: 100%; padding: 0; }

        .navbar { background-color: #2a9d8f; color: white; }
        .navbar a { color: white; }

        .jumbotron { background: #264653; color: white; text-align: center; border-radius: 0; padding: 2rem; }

        .card { border: none; border-radius: 8px; background: #fff; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); }
        .card-title a { text-decoration: none; color: #333; font-size: 1.5rem; font-weight: bold; display: block; }
        .card-title a:hover { color: #2a9d8f; }

        .content { display: flex; flex-direction: column; align-items: center; justify-content: center; height: calc(100% - 56px); }
        .row { justify-content: center; width: 100%; max-width: 600px; } 
    </style>
</head>
<body>

<div class="container-fluid">
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="#">Teacher Dashboard</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home</a>
                </li>
            </ul>
            <a href="/logout" class="btn btn-outline-light">Logout</a>
        </div>
    </nav>

    <div class="content">
        <div class="jumbotron">
            <h1 class="display-4">Teacher Dashboard</h1>
            <p class="lead">Add and View Faculty Details</p>
        </div>

        <div class="row text-center">
            <div class="col-md-6 mb-3">
                <div class="card text-center p-3">
                    <h1 class="card-title"><a href="addTeacherRecord.jsp">ADD FACULTY RECORD</a></h1>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <div class="card text-center p-3">
                    <h1 class="card-title"><a href="viewTeacherRecords.jsp">VIEW FACULTY RECORDS</a></h1>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>