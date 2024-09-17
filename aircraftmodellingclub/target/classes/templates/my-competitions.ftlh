<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">My Competitions</h1>
    <hr>
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Location</th>
            <th scope="col">Date</th>
        </tr>
        <#list competitions as competition>
            <tr>
                <td>${competition.title}</td>
                <td>${competition.description}</td>
                <td>${competition.location}</td>
                <td>${competition.date}</td>
            </tr>
        </#list>
    </table>
</@t.template>