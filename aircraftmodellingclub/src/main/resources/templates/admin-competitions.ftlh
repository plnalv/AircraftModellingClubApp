<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Competitions</h1><hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Add new competition
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form method="post" action="/admin/competition/create" enctype="multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="title">Title</label>
                    <input type="text" name="title" class="form-control" id="title">
                </div>
                <div class="form-group col-md-4">
                    <label for="description">Description</label>
                    <input type="text" name="description" class="form-control" id="description">
                </div>
                <div class="form-group col-md-4">
                    <label for="location">Location</label>
                    <input type="text" name="location" class="form-control" id="location">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="date">Date</label>
                    <input type="date" name="date" class="form-control" id="date">
                </div>
                <div class="form-group col-md-4">
                    <label for="maxParticipants">Max Participants</label>
                    <input type="number" name="maxParticipants" class="form-control" id="maxParticipants">
                </div>
                <div class="form-group col-md-4">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" style="width: 100%" class="btn btn-dark">Add</button>
                </div>
            </div>
        </form>
    </div>
    <hr>
    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Location</th>
            <th scope="col">Date</th>
            <th scope="col">Max Participants</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        <#list competitions as competition>
            <tr>
                <td>${competition.title}</td>
                <td>${competition.description}</td>
                <td>${competition.location}</td>
                <td>${competition.date}</td>
                <td>${competition.maxParticipants}</td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal${competition.id}">
                        Update
                    </button>
                </td>
                <td>
                    <form action="/admin/competition/delete/${competition.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-light">Delete</button>
                    </form>
                </td>
            </tr>
            <div class="modal fade" id="updateModal${competition.id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Update Competition</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="/admin/competition/update/${competition.id}" enctype="multipart/form-data">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input type="text" name="title" value="${competition.title}" class="form-control" id="title">
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <input type="text" name="description" value="${competition.description}" class="form-control" id="description">
                                </div>
                                <div class="form-group">
                                    <label for="location">Location</label>
                                    <input type="text" name="location" value="${competition.location}" class="form-control" id="location">
                                </div>
                                <div class="form-group">
                                    <label for="date">Date</label>
                                    <input type="date" name="date" value="${competition.date}" class="form-control" id="date">
                                </div>
                                <div class="form-group">
                                    <label for="maxParticipants">Max Participants</label>
                                    <input type="number" name="maxParticipants" value="${competition.maxParticipants}" class="form-control" id="maxParticipants">
                                </div>
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="button" class="btn btn-secondary" id="cancel-btn" style="display: none;">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <#else>
            <h3>The list of competitions is empty</h3>
        </#list>
    </table>
</@t.template>