<%@ Page Title="Persona" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Persona.aspx.vb" Inherits="Persona.Persona" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Para validar campos:
            Se usa el elemento: RequiredFieldValidator(rfv)
                Tiene prioridad en un formulario, hasta que no se complete no deja que el botón haga su acción
    --%>

    <!-- Tipo Identificación -->
    <div class="form-group">
        <asp:Label ID="lblTipoDocumento" runat="server" Text="Tipo Documento:" CssClass="control-label"></asp:Label>
        <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="form-control">
            <asp:ListItem Value="" Text="Seleccione un tipo de documento"/>
            <asp:ListItem Value="1" Text="Cédula Física"/>
            <asp:ListItem Value="2" Text="Cédula Jurídica"/>
            <asp:ListItem Value="3" Text="Pasaporte"/>
            <asp:ListItem Value="4" Text="DIMEX"/>
        </asp:DropDownList>
           <%-- Validación del tipo de idenficación --%>
        <asp:RequiredFieldValidator ID="rfvTipoDocumento" runat="server" ErrorMessage="Es necesario seleccionar un tipo de identificación." ControlToValidate="ddlTipoDocumento" display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <!-- Identificación -->
    <div class="form-group">
        <asp:Label ID="lblDocumento" runat="server" Text="Documento:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control" placeholder="101110111"></asp:TextBox>
            <%-- Validación de la identificación --%>
        <asp:RequiredFieldValidator ID="rfvIdentificacion" runat="server" ErrorMessage="Es necesario ingresar la identificación." ControlToValidate="txtDocumento" display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <!-- Nombre -->
    <div class="form-group">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="John"></asp:TextBox>
            <%-- Validación del nombre --%>
        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Es necesario ingresar el nombre." ControlToValidate="txtNombre" display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    
    <!-- Apellidos -->    <div class="form-group">
        <asp:Label ID="lblApellidos" runat="server" Text="Apellidos:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" placeholder="Doe"></asp:TextBox>
            <%-- Validación del apellido --%>
        <asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ErrorMessage="Es necesario ingresar sus apellidos." ControlToValidate="txtApellidos" display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <!-- Fecha de Nacimiento -->
    <div class="form-group">
        <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        <%-- Validación de la fecha de nacimiento --%>
        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ErrorMessage="Es necesario seleccionar una fecha de nacimiento." ControlToValidate="txtFechaNacimiento" display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <!-- Correo Electrónico -->
    <div class="form-group">
        <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control" TextMode="Email" placeholder="johndoe@correo.com"></asp:TextBox>
            <%-- Validación de la fecha de nacimiento --%>
        <asp:RequiredFieldValidator ID="rfvCorreoElectronico" runat="server" ErrorMessage="Es necesario ingresar el correo electrónico." ControlToValidate="txtCorreoElectronico" display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary my-2" OnClick="btnGuardar_Click"/>

    <asp:Label ID="lblResultado" runat="server" Text="" CssClass="control-label"></asp:Label>

    <asp:Label ID="lblListaPersonas" runat="server" Text="Lista de Personas" CssClass="control-label"></asp:Label>
    <asp:GridView ID="gvPersonas" runat="server" AutoGenerateColumns="False" DataKeyNames="IDPersona" DataSourceID="SqlDataSource1" OnRowDeleting="gvPersonas_RowDeleting" OnRowEditing="gvPersonas_RowEditing" OnSelectedIndexChanged="gvPersonas_SelectedIndexChanged" CssClass="table">
        <Columns>
            <asp:BoundField DataField="IDPersona" HeaderText="IDPersona" InsertVisible="False" ReadOnly="True" SortExpression="IDPersona" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha Nacimiento" SortExpression="FechaNacimiento" />
            <asp:BoundField DataField="CorreoElectronico" HeaderText="Correo Electronico" SortExpression="CorreoElectronico" />
            <asp:BoundField DataField="TipoDocumento" HeaderText="Tipo Documento" SortExpression="TipoDocumento"/>
            <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />

            <%-- Para agregar un icono, el HTML del icono debe ir dentro del Delete/Edit Text sustituyendo las comillas dobles por simples--%>
            <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" DeleteText="<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='icon icon-tabler icons-tabler-outline icon-tabler-trash'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><path d='M4 7l16 0' /><path d='M10 11l0 6' /><path d='M14 11l0 6' /><path d='M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12' /><path d='M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3' /></svg>"/>
            <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-warning" EditText ="<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='icon icon-tabler icons-tabler-outline icon-tabler-pencil'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><path d='M4 20h4l10.5 -10.5a2.828 2.828 0 1 0 -4 -4l-10.5 10.5v4' /><path d='M13.5 6.5l4 4' /></svg>"/>
            <%-- Botón para seleccionar toda la fila de una tabla para luego enviar la información en un evento --%>
            <asp:CommandField ShowSelectButton="true" ControlStyle-CssClass="btn btn-warning" SelectText="Seleccionar fila" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:II-46ConnectionString %>" ProviderName="<%$ ConnectionStrings:II-46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Personas]"></asp:SqlDataSource>

</asp:Content>