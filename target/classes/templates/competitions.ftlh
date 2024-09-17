<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Competitions</h1>
    <hr>
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Location</th>
            <th scope="col">Date</th>
            <th scope="col">Max Participants</th>
            <th scope="col">Sign up</th>
        </tr>
        <#list competitions as competition>
            <tr>
                <td>${competition.title}</td>
                <td>${competition.description}</td>
                <td>${competition.location}</td>
                <td>${competition.date}</td>
                <td>${competition.maxParticipants}</td>
                <td>
                    <a href="/competition-signup?competitionId=${competition.id}" class="btn btn-primary">Sign up</a>
                </td>
            </tr>
        </#list>
    </table>
</@t.template>
