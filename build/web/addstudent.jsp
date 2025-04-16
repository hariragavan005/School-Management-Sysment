<%-- 
    Document   : addstudent
    Created on : 10-Nov-2024, 3:15:30 pm
    Author     : subha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student - School Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="addstudent.css">
</head>
<body>
    <div class="page-wrapper">
        <!-- Animated background -->
        <div class="background">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>

        <div class="form-container">
            <h2 class="form-title">Student Registration <div class="underline"></div></h2>
            
            <form id="studentForm" action="AddStudentServlet" method="post" class="registration-form">
                <div class="form-section personal-info">
                    <h3>Personal Information</h3>
                    
                    <div class="input-group">
                        <div class="input-field">
                            <input type="text" name="rollNo" required>
                            <label for="firstName">Roll number:</label>
                            <i class="fas fa-user"></i>
                        </div>
                        
                        <div class="input-field">
                            <input type="text" id="lastName" name="lastName" required>
                            <label for="lastName">Name</label>
                            <i class="fas fa-user"></i>
                        </div>
                    </div>

                    <div class="input-group">
                        <div class="input-field">
                            <input type="date" id="dob" name="dob" required>
                            <label for="dob">Date of Birth</label>
                            <i class="fas fa-calendar"></i>
                        </div>
                        
                        <div class="input-field">
                            <select id="gender" name="gender" required>
                                <option value="">Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                            <i class="fas fa-venus-mars"></i>
                        </div>
                    </div>
                </div>

                <div class="form-section contact-info">
                    <h3>Contact Information</h3>
                    
                    <div class="input-group">
                        <div class="input-field">
                            <input type="email" id="email" name="email" required>
                            <label for="email">Email Address</label>
                            <i class="fas fa-envelope"></i>
                        </div>
                        
                        <div class="input-field">
                            <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>
                            <label for="phone">Phone Number</label>
                            <i class="fas fa-phone"></i>
                        </div>
                    </div>

                    <div class="input-field full-width">
                        <textarea id="address" name="address" required></textarea>
                        <label for="address">Address</label>
                        <i class="fas fa-home"></i>
                    </div>
                </div>

                <div class="form-section academic-info">
                    <h3>Academic Information</h3>
                        <div class="input-field">
                            <select id="grade" name="grade" required>
                                <option value="">Select Grade</option>
                                <option value="6">Grade 6</option>
                                <option value="7">Grade 7</option>
                                <option value="8">Grade 8</option>
                                <option value="9">Grade 9</option>
                                <option value="10">Grade 10</option>
                                <option value="11">Grade 11</option>
                                <option value="12">Grade 12</option>
                            </select>
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                    </div>

                    <div class="input-field full-width">
                        <select id="section" name="section" required>
                            <option value="">Select Section</option>
                            <option value="A">Section A</option>
                            <option value="B">Section B</option>
                            <option value="C">Section C</option>
                        </select>
                        <i class="fas fa-users"></i>
                    </div>
                </div>

                <div class="form-buttons">
                    <button type="submit" class="submit-btn">
                        <span>Register Student</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                    <button type="reset" class="reset-btn">
                        <span>Reset Form</span>
                        <i class="fas fa-undo"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Add animation class when form fields are focused
        $('.input-field input, .input-field select, .input-field textarea').focus(function() {
            $(this).parent().addClass('focused');
        }).blur(function() {
            if ($(this).val() === '') {
                $(this).parent().removeClass('focused');
            }
        });

        // Form validation
        $('#studentForm').submit(function(e) {
            let isValid = true;
            
            // Custom validation logic here
            $(this).find('input[required], select[required], textarea[required]').each(function() {
                if (!$(this).val()) {
                    isValid = false;
                    $(this).parent().addClass('error');
                } else {
                    $(this).parent().removeClass('error');
                }
            });

            if (!isValid) {
                e.preventDefault();
                showNotification('Please fill all required fields', 'error');
            }
        });
    </script>
</body>
</html>