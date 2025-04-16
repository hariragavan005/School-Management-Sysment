<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Record Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                flex-direction: column;
            }

            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            .form-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 100%;
                box-sizing: border-box;
                height: 500px; 
                overflow-y: auto; 
            }

            fieldset {
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 15px;
                margin-bottom: 15px;
            }

            legend {
                font-weight: bold;
                color: #333;
            }

            label {
                display: block;
                font-weight: bold;
                margin-top: 10px;
                color: #333;
            }

            input[type="text"],
            input[type="email"],
            input[type="tel"],
            input[type="number"],
            textarea {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 1rem;
            }

            input[type="submit"],
            input[type="reset"],
            button {
                font-size: 1rem;
                padding: 10px 20px;
                margin-top: 15px;
                margin-right: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
            }

            input[type="reset"] {
                background-color: #f44336;
                color: white;
            }

            button {
                background-color: #2196F3;
                color: white;
                margin-top: 10px;
            }

            button:hover,
            input[type="submit"]:hover,
            input[type="reset"]:hover {
                opacity: 0.9;
            }
        </style>
    </head>
    <body>
        <h1>ADD FACULTY RECORD</h1>
        <div class="form-container">
            <form action="AddTeacherRecordSERVLET" method="post">
                <fieldset>
                    <legend>Personal Information</legend>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required><br><br>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required><br><br>

                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required><br><br>

                    <label for="address">Address:</label>
                    <textarea id="address" name="address" rows="3" required></textarea><br><br>
                </fieldset>

                <fieldset>
                    <legend>Qualifications</legend>
                    <label for="highestQualification">Highest Qualification:</label>
                    <input type="text" id="highestQualification" name="highestQualification" required><br><br>

                    <label for="specialization">Specialization:</label>
                    <input type="text" id="specialization" name="specialization"><br><br>
                </fieldset>

                <fieldset>
                    <legend>Experience</legend>
                    <label for="yearsExperience">Years of Experience:</label>
                    <input type="number" id="yearsExperience" name="yearsExperience" min="0" required><br><br>

                    <label for="previousInstitution">Previous Institution:</label>
                    <input type="text" id="previousInstitution" name="previousInstitution"><br><br>

                    <label for="designation">Designation:</label>
                    <input type="text" id="designation" name="designation"><br><br>
                </fieldset>

                <input type="reset" value="Reset" />
                <input type="submit" value="Submit">
            </form>
        </div>
        <button onclick="window.location.href='teacher.jsp'">Go Back</button>
    </body>
</html>