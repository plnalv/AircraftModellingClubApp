<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>Aicraftmodelling</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>Aicraftmodelling</h1><hr>-->
<#--<h4>Registartion</h4>-->
<#--<form action="/registration " method="post">-->
<#--    Name: <input type="text" name="name"><br><br>-->
<#--    Email: <input type="email" name="email"><br><br>-->
<#--    Phone number: <input type="text" name="phoneNumber"><br><br>-->
<#--    Password: <input type="password" name="password"><br><br>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Sign up"/>-->
<#--</form>-->
<#--<#if errorMessage??>-->
<#--    <h2 style="color: red">${errorMessage}</h2>-->
<#--</#if>-->
<#--</body>-->
<#--</html>-->

<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">CREATE AN ACCOUNT</h1>
    <hr>
    <form action="/registration" method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone number</label>
            <input type="text" class="form-control" id="phoneNumber" required name="phoneNumber">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" required name="password">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">create an account</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>
