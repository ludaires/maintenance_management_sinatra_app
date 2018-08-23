<h2>Crie um nova legenda</h2>
    <h3>Para Código de Problemas</h3>
    <p>No campo código use <strong>P</strong> para criar um código de problemas<p/>
    <p>No campo tipo de código use <strong>Problemas</strong> para criar um tipo de código de problemas<p/>
    <p>No campo título use <strong>Descreva o nome</strong> para criar o tipo de problemas<p/>

    <h3>Para o Tipo de Código</h3>
    <p>No campo código use <strong>C</strong> para criar um código de causas<p/>
    <p>No campo tipo de código use <strong>Causas</strong> para criar um tipo de código de causas<p/>
    <p>No campo título use <strong>Descreva o nome</strong> para criar o tipo de causas<p/>
     

    <h3>Para Código de Problemas</h3>
    <p>Em código use <strong>P</strong> para criar um código de problemas<p/>
    <p>Em tipo de código use <strong>Problemas</strong> para criar um tipo de código de problemas<p/>
    <p>No campo título use <strong>Descreva o nome</strong> para criar o tipo de problemas<p/>
    <p>Use <strong>A</strong> para criar um código de ações<p/>
<form method="post" action="/inspection/new">
    <label>Maintenance Id: </label>
    <input type="text" name="maintenance_id" value="<%=@maintenance.id%>"><br>
    <label for="maintenancce_type">Maintenance Type: </label>
        <select name="maintenance_type">
            <option value="Preventive">Preventive</option>
            <option value="Corrective">Corrective</option>
        </select>
    <input text="text" name="notes" placeholder="Enter any extra information need it.">
    <input type="submit" value="Inspection">
</form>




