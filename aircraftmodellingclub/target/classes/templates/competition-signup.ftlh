<#import "blocks/template.ftlh" as t>
<@t.template user>
<h1 style="text-align: center">Sign up for Competition</h1>
<hr>
<form action="/competition-signup" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <div class="form-group">
        <label for="competitionId">Selected Competition</label>
        <input type="hidden" name="competitionId" value="${competition.id}">
        <p>${competition.title}</p>
    </div>
    <div class="form-group">
        <label for="useOwnProduct">Use my own product</label>
        <input type="radio" name="useOwnProduct" value="true" checked>
        <label for="bookProduct">Book a product</label>
        <input type="radio" name="useOwnProduct" value="false">
    </div>
    <div id="product-selection" style="display: none;">
        <label for="productId">Select a product</label>
        <select name="productId" class="form-control">
            <#list products as product>
                <option value="${product.id}">${product.title}</option>
            </#list>
        </select>
    </div><br>
    <button type="submit" class="btn btn-success">Sign up</button>
</form>
</@t.template>

<script>
    $(document).ready(function() {
        $('input[name="useOwnProduct"]').change(function() {
            var useOwnProduct = $(this).val() === 'true';
            if (useOwnProduct) {
                $('#product-selection').hide();
            } else {
                $('#product-selection').show();
            }
        });
    });
</script>
